import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';

class OperatorCameraPreviewController {
  const OperatorCameraPreviewController();

  Future<void> onCancelPressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_camera_preview_cancel_pressed');
    if (context.mounted) {
      context.popRoute();
    }
  }

  Future<void> onRegisterPressed(
    BuildContext context,
    String? imagePath,
  ) async {
    await analytics.logEvent(name: 'operator_camera_preview_register_pressed');
    if (context.mounted) {
      context.pushRoute(
        OperatorQRCodeReaderRoute(
          typeIndex: QRCodeType.visitor.index,
          imagePath: imagePath,
        ),
      );
    }
  }
}
