import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class OperatorSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);

    return ListScaffold(
      scrollableChildren: [
        const ListHeading("アカウント設定"),
        const SizedBox(height: 16),
        WideElevatedButton(
          onPressed: () async {
            // TODO: ログアウト処理を実装する
            await ref.read(userProvider.notifier).setType(UserType.unknown);
            if (context.mounted) {
              context.router.pushAndPopUntil(
                const IntroductionWelcomeRoute(),
                predicate: (_) => false,
              );
            }
          },
          text: "ログアウト",
          colors: const WideElevatedButtonColors(
            backgroundColor: Colors.white,
            borderColor: Colors.white,
            textColor: Colors.red,
          ),
        ),
        const SizedBox(height: 16),
        const ListHeading("アプリについて"),
        const SizedBox(height: 16),
        SettingsTile.text(
          title: "バージョン",
          titleStyle: Theme.of(context).textTheme.bodyLarge,
          value: packageInfo.value?.version ?? "",
        ),
        const SizedBox(height: 16),
        WideElevatedButton(
          onPressed: () {
            context.pushRoute(const OssLicensesRoute());
          },
          text: "ライセンス",
          colors: const WideElevatedButtonColors(
            backgroundColor: Colors.white,
            borderColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
