import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';

class OperatorHomeController {
  const OperatorHomeController(this._user);

  final OperatorUserEntity _user;

  Future<void> onSettingsPressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_settings_pressed');
    if (context.mounted) {
      context.pushRoute(const OperatorSettingsRoute());
    }
  }

  Future<void> onChangeEventPressed(BuildContext context) async {
    if (_user.token == null) return;
    await analytics.logEvent(name: 'operator_change_event_pressed');
    if (context.mounted) {
      context.pushRoute(
        OperatorEventListRoute(token: _user.token),
      );
    }
  }

  Future<void> onBeaconListPressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_beacon_list_pressed');
    if (context.mounted) {
      context.pushRoute(const OperatorBeaconListRoute());
    }
  }

  Future<void> onCameraPressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_camera_pressed');
    if (context.mounted) {
      context.pushRoute(const OperatorCameraRoute());
    }
  }

  Future<void> onQRCodePressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_qrcode_pressed');
    if (context.mounted) {
      context.pushRoute(
        OperatorQRCodeReaderRoute(
          typeIndex: QRCodeType.visitor.index,
        ),
      );
    }
  }
}
