import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_preview_screen.dart';

class OperatorCameraPreviewController {
  const OperatorCameraPreviewController();

  void onUnregisterPressed(BuildContext context) {
    // TODO: 写真の登録解除処理を実装する
    context.popRoute();
  }

  void onRegisterPressed(BuildContext context) {
    // TODO: 写真の登録処理を実装する
    showDialog(
      context: context,
      builder: (_) => PictureRegisteredDialog(
        onPressed: () => _onDialogBackPressed(context),
      ),
    );
  }

  void _onDialogBackPressed(BuildContext context) {
    context.replaceRoute(const OperatorCameraRoute());
    context.popRoute();
  }
}
