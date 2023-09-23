import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/version_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/common/providers/util_providers.dart';
import 'package:repaint_mobile/features/introduction/providers/providers.dart';

@RoutePage()
class IntroductionSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final controller = ref.watch(introductionSettingsControllerProvider.future);

    return ListScaffold(
      scrollableChildren: [
        const ListHeading("管理者設定"),
        const SizedBox(height: 16),
        WideElevatedButton(
          onPressed: () async => (await controller).onLoginPressed(context),
          text: "管理者としてログイン",
          colors: const WideElevatedButtonColors(backgroundColor: Colors.white),
        ),
        const SizedBox(height: 16),
        const ListHeading("アプリについて"),
        const SizedBox(height: 16),
        VersionTile(packageInfo: packageInfo.value),
        const SizedBox(height: 16),
        WideElevatedButton(
          onPressed: () async => (await controller).onLicensePressed(context),
          text: "ライセンス",
          colors: const WideElevatedButtonColors(backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
