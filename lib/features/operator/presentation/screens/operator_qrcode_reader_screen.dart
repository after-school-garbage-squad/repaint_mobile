import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/qrcode_entity.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
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

    final type = QRCodeType.values[typeIndex!];
    final typeString = type == QRCodeType.visitor
        ? "参加者"
        : type == QRCodeType.spot
            ? "スポット"
            : "イベント";

    ref.listen(
      networkErrorProvider,
      (previous, next) => showNetworkErrorSnackBar(context, next),
    );

    ref.listen(
      bluetoothServiceProvider,
      (previous, next) => showBluetoothErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    ref.listen(
      locationServiceProvider,
      (previous, next) => showLocationErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    return CameraScaffold(
      preview: MobileScanner(
        onDetect: (capture) async => (await controller)
            .onQRCodeScanned(context, ref, type, capture, imagePath),
      ),
      children: [
        Center(
          child: Text(
            "$typeStringのQRコードを読み取ってください",
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
  });

  final Spot? spot;
  final VoidCallback onContinueScanning;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      automaticallyImplyLeading: false,
      children: [
        const Spacer(),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 16.0),
            Text("スポットをスキャンしました"),
          ],
        ),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "名前",
          value: spot?.name ?? "未登録",
        ),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "HWID",
          value: spot?.beacon.hwId ?? "未登録",
        ),
        const SizedBox(height: 16.0),
        WideElevatedButton(
          onPressed: onContinueScanning,
          text: "閉じる",
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 16.0),
            Text("参加者の方に写真を追加しました"),
          ],
        ),
        const SizedBox(height: 16.0),
        WideElevatedButton(
          onPressed: onContinueScanning,
          text: "撮影した写真に、別の参加者を追加する",
        ),
        const SizedBox(height: 16.0),
        WideElevatedButton(
          onPressed: onMoveToHome,
          text: "ホームに戻る",
        ),
        const Spacer(),
      ],
    );
  }
}
