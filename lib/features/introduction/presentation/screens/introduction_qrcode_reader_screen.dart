import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/camera_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class IntroductionQRCodeReaderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CameraScaffold(
      // TODO: カメラを実装する
      preview: const Expanded(child: Placeholder()),
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
          child: Column(
            children: [
              Text(
                "QRコードを読み取ってください",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20.0),
              Text(
                'カメラが起動しない場合は、設定から使用許可をお願いします',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              WideElevatedButton(
                // TODO: 設定画面に遷移できるようにする
                onPressed: () {},
                text: "設定に進む",
                colors: const WideElevatedButtonColors(
                  backgroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
