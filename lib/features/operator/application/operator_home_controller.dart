import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';

class OperatorHomeController {
  const OperatorHomeController(this._user);

  final OperatorUserEntity _user;

  void onSettingsPressed(BuildContext context) {
    context.pushRoute(const OperatorSettingsRoute());
  }

  void onChangeEventPressed(BuildContext context) {
    if (_user.token == null) return;
    context.pushRoute(OperatorEventListRoute(token: _user.token));
  }

  void onBeaconListPressed(BuildContext context) {
    context.pushRoute(const OperatorBeaconListRoute());
  }

  void onCameraPressed(BuildContext context) {
    context.pushRoute(const OperatorCameraRoute());
  }

  void onQRCodePressed(BuildContext context) {
    context.pushRoute(
      OperatorQRCodeReaderRoute(
        typeIndex: QRCodeType.spot.index,
      ),
    );
  }
}
