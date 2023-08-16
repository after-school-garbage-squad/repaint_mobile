import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.gr.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class IntroductionQRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: 不要になったら5秒後に自動で遷移するコード(デバッグ用)を削除する
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 5)).then((_) {
        context.replaceRoute(const VisitorRoute());
      }).catchError((error) {});
    });

    return CameraScaffold(
      // TODO: カメラを実装する
      preview: const Expanded(child: Placeholder()),
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
        WideElevatedButton(
          // TODO: 設定画面に遷移できるようにする
          onPressed: () {},
          text: "設定に進む",
          colors: const WideElevatedButtonColors(
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
