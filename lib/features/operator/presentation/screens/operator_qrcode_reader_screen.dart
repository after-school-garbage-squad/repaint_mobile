import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class OperatorQRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraScaffold(
      preview: Expanded(
        child: Stack(
          children: [
            MobileScanner(
              onDetect: (capture) {
                // TODO: QRコードの内容を取得した際の処理を実装する
                showDialog(
                  context: context,
                  builder: (_) => const _QRCodeReaderConfirmDialog(),
                );
              },
            ),
            Positioned(
              right: 14,
              bottom: 8,
              child: Container(
                width: 100,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(child: Text("1枚目")),
              ),
            ),
          ],
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 64.0),
          child: Center(
            child: Text(
              "参加者のQRコードを読み取ってください",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      ],
    );
  }
}

class _QRCodeReaderConfirmDialog extends StatelessWidget {
  const _QRCodeReaderConfirmDialog();

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      children: [
        const Spacer(),
        // TODO:各ボタンの挙動を実装する
        WideElevatedButton(
          onPressed: () {
            context.back();
          },
          text: "続けて読み取る",
        ),
        const SizedBox(height: 32.0),
        WideElevatedButton(
          onPressed: () {
            context.replaceRoute(const OperatorCameraPreviewRoute());
          },
          text: "写真撮影に進む",
        ),
        const Spacer(),
      ],
    );
  }
}
