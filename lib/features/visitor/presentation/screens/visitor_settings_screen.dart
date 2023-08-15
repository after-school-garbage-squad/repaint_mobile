import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class VisitorSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
        centerTitle: true,
        leading: Row(
          children: [
            const SizedBox(width: 16.0),
            FlatIconButton(
              onPressed: context.popRoute,
              icon: Icons.chevron_left,
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const SettingsHeading("通知設定"),
            const SizedBox(height: 12),
            // TODO: 実際の通知設定を実装する
            SettingsTile.toggle(
              title: "スポットに入った際の通知",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            SettingsTile.toggle(
              title: "イベントからのお知らせ",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            SettingsTile.toggle(
              title: "その他の通知",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            const SettingsHeading("アカウント設定"),
            const SizedBox(height: 12),
            WideElevatedButton(
              onPressed: () {
                // TODO: ログアウト機能を実装する
                context.navigateNamedTo("/introduction");
              },
              text: "ログアウト",
              colors: const WideElevatedButtonColors(
                backgroundColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
