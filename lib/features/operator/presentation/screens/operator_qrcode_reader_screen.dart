import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
            // TODO: カメラを実装する
            const Placeholder(),
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
                child: Center(
                  child: Text(
                    "1枚目",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
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

// TODO: ダイアログを表示させる
// ignore: unused_element
class _QRCodeReaderConfirmDialog extends StatelessWidget {
  const _QRCodeReaderConfirmDialog();

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      children: [
        const Spacer(),
        // TODO:各ボタンの挙動を実装する
        WideElevatedButton(
          onPressed: () {},
          text: "続けて読み取る",
        ),
        const SizedBox(height: 32.0),
        WideElevatedButton(
          onPressed: () {},
          text: "写真撮影に進む",
        ),
        const Spacer(),
      ],
    );
  }
}
