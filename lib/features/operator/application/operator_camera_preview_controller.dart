import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';

class OperatorCameraPreviewController {
  const OperatorCameraPreviewController();

  void onCancelPressed(BuildContext context) {
    context.popRoute();
  }

  void onRegisterPressed(
    BuildContext context,
    String? imagePath,
  ) {
    context.pushRoute(OperatorQRCodeReaderRoute(imagePath: imagePath));
  }
}
