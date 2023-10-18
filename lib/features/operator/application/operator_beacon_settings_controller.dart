import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/operator/providers/event_providers.dart';
import 'package:repaint_mobile/utils.dart';

class OperatorBeaconSettingsController {
  const OperatorBeaconSettingsController(this._client, this._user);

  final RepaintApiClient _client;
  final OperatorUserEntity _user;

  Future<void> onUnregisterPressed(
    BuildContext context,
    WidgetRef ref,
    String? spotId,
  ) async {
    if (spotId != null) {
      await analytics.logEvent(
        name: 'operator_unregister_spot_pressed',
        parameters: {'spot_id': spotId},
      );
      await _client.getAdminApi().deleteSpot(
            eventId: _user.eventId!,
            deleteSpotRequest: DeleteSpotRequest(spotId: spotId),
            headers: getAdminApiHeaders(_user.token!),
          );
      ref.invalidate(operatorSpotsByHwIdProvider);
      if (context.mounted) {
        await context.popRoute();
      }
    }
  }

  Future<void> onRegisterPressed(
    BuildContext context,
    WidgetRef ref,
    String name,
    String hwId,
    String serviceUuid,
  ) async {
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("名前を入力してください")),
      );
      return;
    }
    await _client.getAdminApi().registerSpot(
          eventId: _user.eventId!,
          registerSpotRequest: RegisterSpotRequest(
            name: name,
            hwId: hwId,
            serviceUuid: serviceUuid,
          ),
          headers: getAdminApiHeaders(_user.token!),
        );
    await analytics.logEvent(
      name: 'operator_register_spot_pressed',
      parameters: {'name': name, 'hw_id': hwId, 'service_uuid': serviceUuid},
    );
    ref.invalidate(operatorSpotsByHwIdProvider);
    if (context.mounted) {
      await context.popRoute();
    }
  }
}
