import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';

class OperatorHomeController {
  const OperatorHomeController();

  void onSettingsPressed(BuildContext context) {
    context.pushRoute(const OperatorSettingsRoute());
  }

  void onChangeEventPressed(BuildContext context) {
    // TODO: イベントを変更する機能を実装する
  }

  void onQRCodeReaderPressed(BuildContext context) {
    context.pushRoute(const OperatorQRCodeReaderRoute());
  }

  void onCameraPressed(BuildContext context) {
    context.pushRoute(const OperatorCameraRoute());
  }

  void onBeaconListPressed(BuildContext context) {
    context.pushRoute(const OperatorBeaconListRoute());
  }
}
