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
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorQRCodeReaderControllerProvider);

    return CameraScaffold(
      preview: Stack(
        children: [
          MobileScanner(
            onDetect: (capture) => controller.onQRCodeScanned(context, capture),
          ),
          Positioned(
            right: 14,
            bottom: 8,
            child: Container(
              width: 100,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: const Center(child: Text("1枚目")),
            ),
          ),
        ],
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

class QRCodeReaderConfirmDialog extends StatelessWidget {
  const QRCodeReaderConfirmDialog({
    required this.onContinueScanning,
    required this.onMoveToCamera,
  });

  final VoidCallback onContinueScanning;
  final VoidCallback onMoveToCamera;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      children: [
        const Spacer(),
        WideElevatedButton(
          onPressed: onContinueScanning,
          text: "続けて読み取る",
        ),
        const SizedBox(height: 32.0),
        WideElevatedButton(
          onPressed: onMoveToCamera,
          text: "写真撮影に進む",
        ),
        const Spacer(),
      ],
    );
  }
}
