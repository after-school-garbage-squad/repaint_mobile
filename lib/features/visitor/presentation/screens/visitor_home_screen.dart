import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

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
      body: Center(
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
              const SizedBox(height: 16.0),
              // TODO: ダウンロード機能を実装する
              WideElevatedButton.withTemplate(
                onPressed: () {},
                text: "ダウンロード",
                icon: Icons.group,
                colors: WideElevatedButtonColors(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  borderColor: Theme.of(context).colorScheme.surface,
                ),
              ),
              const SizedBox(height: 16.0),
              WideElevatedButton.withTemplate(
                onPressed: () {
                  context.navigateNamedTo("qrcode_reader");
                },
                text: "QRコードの読み取り",
                colors: const WideElevatedButtonColors(
                  backgroundColor: Colors.white,
                ),
              ),
              const SizedBox(height: 16.0),
              const Spacer(),
              // TODO: イベントHPに遷移できるようにする
              WideElevatedButton.withTemplate(
                onPressed: () {},
                text: "イベントHPを見る",
                colors: const WideElevatedButtonColors(
                  backgroundColor: Colors.white,
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 96.0),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
