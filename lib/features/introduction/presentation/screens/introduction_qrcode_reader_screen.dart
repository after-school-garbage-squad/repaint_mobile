import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/introduction/providers/providers.dart';

@RoutePage()
class IntroductionQRCodeReaderScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(introductionQRCodeReaderControllerProvider.future);

    ref.listen(
      networkErrorProvider,
      (previous, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(kDebugMode ? next.toString() : "通信エラー"),
            ),
          );
        }
      },
    );

    return CameraScaffold(
      preview: MobileScanner(
        onDetect: (capture) async =>
            (await controller).onQRCodeScanned(context, capture),
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
