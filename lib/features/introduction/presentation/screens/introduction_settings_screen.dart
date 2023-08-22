import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class IntroductionSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListScaffold(
      children: [
        const ListHeading("管理者設定"),
        const SizedBox(height: 16),
        WideElevatedButton(
          onPressed: () {
            // TODO: Auth0の管理者ログイン画面に遷移する
            ref.read(userTypeProvider.notifier).state = UserType.operator;
            context.replaceRoute(const OperatorRoute());
          },
          text: "管理者としてログイン",
          colors: const WideElevatedButtonColors(
            backgroundColor: Colors.white,
            borderColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
