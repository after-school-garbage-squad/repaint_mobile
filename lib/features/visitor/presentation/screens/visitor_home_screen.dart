import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/presentation/widgets/action_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/presentation/widgets/dot_indicator.dart';
import 'package:repaint_mobile/features/visitor/presentation/widgets/progress_bar.dart';

@RoutePage()
class VisitorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          FlatIconButton(
            onPressed: () {
              context.navigateNamedTo("settings");
            },
            icon: Icons.settings,
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SingleChildScrollView(
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
              const SizedBox(height: 12.0),
              // TODO: ドットインジケーターの値を実際の値に合わせる
              SizedBox(
                height: 32.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DotIndicator(onPressed: () {}, enabled: true),
                    const SizedBox(width: 32.0),
                    DotIndicator(onPressed: () {}),
                    const SizedBox(width: 32.0),
                    DotIndicator(onPressed: () {}),
                    const SizedBox(width: 32.0),
                    DotIndicator(onPressed: () {}),
                  ],
                ),
              ),
              const SizedBox(height: 12.0),
              // TODO: プログレスバーの値を実際の値に合わせる
              ProgressBar(progress: Random().nextDouble()),
              const SizedBox(height: 32.0),
              // TODO: ダウンロード機能を実装する
              WideElevatedButton(
                onPressed: () {},
                text: "ダウンロード",
                icon: Icons.group,
                colors: WideElevatedButtonColors(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  borderColor: Theme.of(context).colorScheme.surface,
                ),
              ),
              const SizedBox(height: 32.0),
              Row(
                children: [
                  Expanded(
                    child: ActionElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const QRCodeViewDialog(),
                        );
                      },
                      text: "QRコードの表示",
                      icon: Icons.qr_code,
                      colors: ActionElevatedButtonColors(
                        borderColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40.0),
                  Expanded(
                    child: ActionElevatedButton(
                      onPressed: () {
                        context.navigateNamedTo("qrcode_reader");
                      },
                      text: "QRコードの読み取り",
                      icon: Icons.qr_code_scanner,
                      colors: ActionElevatedButtonColors(
                        borderColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16.0),
              // TODO: イベントHPに遷移できるようにする
              WideElevatedButton(
                onPressed: () {},
                text: "イベントHPを見る",
                colors: const WideElevatedButtonColors(
                  backgroundColor: Colors.white,
                ),
              ),
              const BottomConstrainedPadding(),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}

class QRCodeViewDialog extends StatelessWidget {
  const QRCodeViewDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatIconButton(
                  onPressed: context.popRoute,
                  icon: Icons.chevron_left,
                ),
                const Spacer()
              ],
            ),
            const SizedBox(height: 24.0),
            // TODO: QRコードを実際の画像に設定する
            const Icon(Icons.qr_code, size: 200.0),
            const SizedBox(height: 24.0),
            Text(
              "写真撮影の際にご掲示ください",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
