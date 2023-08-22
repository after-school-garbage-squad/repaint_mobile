import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class IntroductionQRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        Future.delayed(const Duration(seconds: 5)).then((_) {
          context.replaceRoute(const VisitorRoute());
        }).catchError((error) {});
      });
    }

    return CameraScaffold(
      preview: Expanded(
        child: MobileScanner(
          onDetect: (capture) {
            // TODO: QRコードの内容を取得した際の処理を実装する
            context.replaceRoute(const VisitorRoute());
          },
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
        const SizedBox(height: 20.0),
        const Text('カメラが起動しない場合は、設定から使用許可をお願いします'),
        const Spacer(),
        const WideElevatedButton(
          onPressed: openAppSettings,
          text: "設定に進む",
          colors: WideElevatedButtonColors(
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
