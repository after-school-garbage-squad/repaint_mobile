import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/controller_providers.dart';

@RoutePage()
class OperatorCameraPreviewScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorCameraPreviewControllerProvider);

    return RepaintScaffold(
      title: "確認画面",
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
        child: Column(
          children: [
            ConstrainedBox(
              // TODO: 実際の画像のサイズに合わせる
              constraints: const BoxConstraints(maxHeight: 480.0),
              child: const AspectRatio(
                aspectRatio: 1,
                // TODO: 画像を設定する
                child: Placeholder(fallbackWidth: double.infinity),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: WideElevatedButton(
                    onPressed: () => controller.onUnregisterPressed(context),
                    text: "登録解除",
                    colors: const WideElevatedButtonColors(
                      backgroundColor: Colors.white,
                      textColor: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 32.0),
                Expanded(
                  child: WideElevatedButton(
                    onPressed: () => controller.onRegisterPressed(context),
                    text: "登録する",
                  ),
                ),
              ],
            ),
            const BottomPadding(),
          ],
        ),
      ),
    );
  }
}

class PictureRegisteredDialog extends StatelessWidget {
  const PictureRegisteredDialog({required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      automaticallyImplyLeading: false,
      children: [
        const Expanded(child: Center(child: Text("登録しました！"))),
        WideElevatedButton(
          onPressed: onPressed,
          text: "写真撮影に戻る",
        ),
      ],
    );
  }
}
