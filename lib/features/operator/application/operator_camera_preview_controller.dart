import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';

class OperatorCameraPreviewController {
  const OperatorCameraPreviewController();

  void onCancelPressed(BuildContext context) {
    context.popRoute();
  }

  void onRegisterPressed(
    BuildContext context,
    String? imagePath,
  ) {
    context.pushRoute(
      OperatorQRCodeReaderRoute(
        typeIndex: QRCodeType.visitor.index,
        imagePath: imagePath,
      ),
    );
  }
}
