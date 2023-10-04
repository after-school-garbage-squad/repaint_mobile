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
