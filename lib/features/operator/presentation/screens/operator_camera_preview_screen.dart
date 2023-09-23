import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class OperatorCameraPreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () {
                      // TODO: 写真の登録解除処理を実装する
                      context.popRoute();
                    },
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
                    onPressed: () {
                      // TODO: 写真の登録処理を実装する
                      showDialog(
                        context: context,
                        builder: (_) => const _PictureRegisteredDialog(),
                      );
                    },
                    text: "登録する",
                  ),
                ),
              ],
            ),
            const BottomConstrainedPadding(),
          ],
        ),
      ),
    );
  }
}

class _PictureRegisteredDialog extends StatelessWidget {
  const _PictureRegisteredDialog();

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      automaticallyImplyLeading: false,
      children: [
        const Expanded(child: Center(child: Text("登録しました！"))),
        WideElevatedButton(
          onPressed: () {
            context.replaceRoute(const OperatorCameraRoute());
            context.popRoute();
          },
          text: "写真撮影に戻る",
        ),
      ],
    );
  }
}
