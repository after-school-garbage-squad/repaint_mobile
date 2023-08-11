import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/presentation/widgets/settings_toggle_element.dart';

@RoutePage()
class VisitorSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
        centerTitle: true,
        leading: FlatIconButton(
          onPressed: context.popRoute,
          icon: Icons.chevron_left,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child:
                  Text("通知設定", style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 12),
            // TODO: 実際の通知設定を実装する
            SettingsToggleElement(
              title: "スポットに入った際の通知",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            SettingsToggleElement(
              title: "イベントからのお知らせ",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 12),
            SettingsToggleElement(
              title: "その他の通知",
              value: true,
              onChanged: (value) {},
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "アカウント設定",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            const SizedBox(height: 12),
            // TODO: ログアウト機能を実装する
            WideElevatedButton.withTemplate(
              onPressed: () {},
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
