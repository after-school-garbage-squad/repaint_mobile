import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class IntroductionSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsScaffold(
      children: [
        const ListHeading("管理者設定"),
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
    );
  }
}
