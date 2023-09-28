import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_qrcode_reader_screen.dart';

class OperatorQRCodeReaderController {
  const OperatorQRCodeReaderController();

  void onQRCodeScanned(
    BuildContext context,
    BarcodeCapture capture,
  ) {
    // TODO: QRコードの内容を取得した際の処理を実装する
    showDialog(
      context: context,
      builder: (_) => QRCodeReaderConfirmDialog(
        onContinueScanning: () => _onContinueScanning(context),
        onMoveToCamera: () => _onMoveToCamera(context),
      ),
    );
  }

  void _onContinueScanning(BuildContext context) {
    context.back();
  }

  void _onMoveToCamera(BuildContext context) {
    context.replaceRoute(const OperatorCameraRoute());
  }
}
