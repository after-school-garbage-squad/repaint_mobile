import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorQRCodeReaderScreen extends ConsumerWidget {
  const OperatorQRCodeReaderScreen({
    @queryParam this.typeIndex,
    @queryParam this.imagePath,
  });

  final int? typeIndex;
  final String? imagePath;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorQRCodeReaderControllerProvider.future);

    ref.listen(
      networkErrorProvider,
      (previous, next) => showNetworkErrorSnackBar(context, next),
    );

    return CameraScaffold(
      preview: MobileScanner(
        onDetect: (capture) async => (await controller).onQRCodeScanned(
          context,
          QRCodeType.values[typeIndex!],
          capture,
          imagePath,
        ),
      ),
      children: [
        Center(
          child: Text(
            "${typeIndex == QRCodeType.spot.index ? 'スポット' : '参加者'}のQRコードを読み取ってください",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ],
    );
  }
}

class SpotQRCodeReaderScannedDialog extends StatelessWidget {
  const SpotQRCodeReaderScannedDialog({
    required this.spot,
    required this.onContinueScanning,
    required this.onMoveToHome,
  });

  final SpotQRCodeEntity spot;
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
        SettingsTile.text(
          title: "スポットの名前",
          value: "スポット名",
        ),
        const SizedBox(height: 24.0),
        WideElevatedButton(
          onPressed: onContinueScanning,
          text: "別のスポットを確認する",
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

class VisitorQRCodeReaderScannedDialog extends StatelessWidget {
  const VisitorQRCodeReaderScannedDialog({
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
