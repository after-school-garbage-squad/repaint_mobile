import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/utils.dart';

class OperatorBeaconSettingsController {
  const OperatorBeaconSettingsController(this._client, this._user);

  final RepaintApiClient _client;
  final OperatorUserEntity _user;

  Future<void> onUnregisterPressed(
    BuildContext context,
    String hwId,
  ) async {
    await _client.getAdminApi().deleteSpot(
          eventId: _user.eventId!,
          deleteSpotRequest: DeleteSpotRequest(spotId: hwId),
          headers: getAdminApiHeaders(_user.token!),
        );
    if (context.mounted) {
      await context.popRoute();
    }
  }

  Future<void> onRegisterPressed(
    BuildContext context,
    String name,
    String hwId,
    String serviceUuid,
  ) async {
    await _client.getAdminApi().registerSpot(
          eventId: _user.eventId!,
          registerSpotRequest: RegisterSpotRequest(
            name: name,
            hwId: hwId,
            serviceUuid: serviceUuid,
          ),
          headers: getAdminApiHeaders(_user.token!),
        );
    if (context.mounted) {
      await context.popRoute();
    }
  }
}
