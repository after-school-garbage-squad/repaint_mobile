import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.gr.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/presentation/widgets/operator_elevated_tile.dart';

@RoutePage()
class OperatorHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("管理者画面"),
        centerTitle: true,
        actions: [
          FlatIconButton(
            onPressed: () {
              context.pushRoute(const OperatorSettingsRoute());
            },
            icon: Icons.settings,
          ),
          // TODO: https://github.com/flutter/flutter/issues/118965
          const SizedBox(width: 16.0)
        ],
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          children: [
            OperatorElevatedTile(
              automaticallyImplyTail: false,
              padding: const EdgeInsets.all(16),
              direction: Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // TODO: 選択中のイベントを表示する
                Text("選択中のイベント", style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 16),
                WideElevatedButton(
                  // TODO: イベントを変更する機能を実装する
                  onPressed: () {},
                  text: "イベントを変更",
                  colors: WideElevatedButtonColors(
                    backgroundColor: Colors.transparent,
                    borderColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    textColor: Theme.of(context).colorScheme.primary,
                  ),
                  elevation: 0.0,
                )
              ],
            ),
            const SizedBox(height: 16),
            OperatorElevatedTile.action(
              onTap: () {
                context.pushRoute(const OperatorCameraRoute());
              },
              title: "写真を撮影する",
              icon: Icons.camera_alt,
            ),
            const SizedBox(height: 16),
            OperatorElevatedTile.action(
              onTap: () {
                context.pushRoute(const OperatorBeaconListRoute());
              },
              title: "ビーコンを設定する",
              // TODO: 仮で設定した下記のアイコンを変更するかを検討する
              icon: Icons.settings_input_antenna,
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
