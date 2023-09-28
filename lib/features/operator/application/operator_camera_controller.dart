import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';

class OperatorCameraController {
  const OperatorCameraController();

  void onBackPressed(BuildContext context) {
    context.popRoute();
  }

  void onPictureTaken(BuildContext context) {
    // TODO: 撮影処理の実装
    context.replaceRoute(const OperatorCameraPreviewRoute());
  }
}
