import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/introduction/providers/providers.dart';

@RoutePage()
class IntroductionQRCodeReaderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(introductionQRCodeReaderControllerProvider.future);

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
        onDetect: (capture) async =>
            (await controller).onQRCodeScanned(context, capture),
        errorBuilder: (context, error, widget) => Container(
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.black),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error, color: Colors.white),
              SizedBox(width: 16.0),
              Text("エラーが発生しました", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      children: [
        Text(
          "QRコードを読み取ってください",
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(overflow: TextOverflow.ellipsis),
        ),
        const SizedBox(height: 16.0),
        const Text('カメラが起動しない場合は、アプリを再起動してください'),
      ],
    );
  }
}
