import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorQRCodeReaderScreen extends ConsumerWidget {
  const OperatorQRCodeReaderScreen({@queryParam this.imagePath});

  final String? imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorQRCodeReaderControllerProvider.future);

    return CameraScaffold(
      preview: MobileScanner(
        onDetect: (capture) async =>
            (await controller).onQRCodeScanned(context, capture, imagePath),
      ),
      children: [
        Center(
          child: Text(
            "参加者のQRコードを読み取ってください",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

class QRCodeReaderScannedDialog extends StatelessWidget {
  const QRCodeReaderScannedDialog({
    required this.onContinueScanning,
    required this.onMoveToHome,
  });

  final VoidCallback onContinueScanning;
  final VoidCallback onMoveToHome;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      automaticallyImplyLeading: false,
      children: [
        const Spacer(),
        const Icon(
          Icons.check_circle,
          size: 64.0,
          color: Colors.green,
        ),
        const SizedBox(height: 24.0),
        const Text("参加者の方に写真を追加しました"),
        const SizedBox(height: 24.0),
        WideElevatedButton(
          onPressed: onContinueScanning,
          text: "撮影した写真に、別の参加者を追加する",
        ),
        const SizedBox(height: 24.0),
        WideElevatedButton(
          onPressed: onMoveToHome,
          text: "ホームに戻る",
        ),
        const Spacer(),
      ],
    );
  }
}
