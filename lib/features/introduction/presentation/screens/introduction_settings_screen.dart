import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class IntroductionSettingsScreen extends StatelessWidget {
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
                  Text("管理者設定", style: Theme.of(context).textTheme.titleLarge),
            ),
            const SizedBox(height: 16),
            WideElevatedButton(
              onPressed: () {
                // TODO: Auth0の管理者ログイン画面に遷移する
                context.navigateNamedTo("/operator/home");
              },
              text: "管理者としてログイン",
              colors: const WideElevatedButtonColors(
                backgroundColor: Colors.white,
                borderColor: Colors.white,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
