import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/elevated_text_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

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
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("アカウント設定",
                  style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 16),
            ElevatedTextButton(
              onPressed: () {},
              text: "ログアウト",
              colors: const ElevatedTextButtonColors(
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
