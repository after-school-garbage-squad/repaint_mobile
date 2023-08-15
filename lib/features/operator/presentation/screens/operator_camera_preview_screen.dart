import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class OperatorCameraPreviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("確認画面"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
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
                      borderColor: Colors.white,
                      textColor: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 32.0),
                Expanded(
                  child: WideElevatedButton(
                    onPressed: () {
                      // TODO: 写真の登録処理を実装する
                      context.popRoute();
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
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
