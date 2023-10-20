import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/version_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class IntroductionSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final controller = ref.watch(introductionSettingsControllerProvider);

    ref.listen(
      networkErrorProvider,
      (previous, next) => showNetworkErrorSnackBar(context, next),
    );

    ref.listen(
      bluetoothServiceProvider,
      (previous, next) => showBluetoothErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    ref.listen(
      locationServiceProvider,
      (previous, next) => showLocationErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    return ListScaffold(
      scrollableChildren: [
        const ListHeading("管理者設定"),
        const SizedBox(height: 16),
        const Topic(
          icon: Icons.info,
          text: "管理者アカウントはウェブ管理画面から作成可能です。\n\n"
              "モバイル管理画面はウェブ管理画面で取得した管理者アカウントでログインできます。\n\n"
              "モバイル管理画面の使用には、イベントに参加・または他の管理者アカウントに招待される必要があります。",
        ),
        const SizedBox(height: 16),
        WideElevatedButton(
          onPressed: () => controller.onWebConsoleLoginPressed(context),
          text: "ウェブ管理画面にログイン",
          colors: const WideElevatedButtonColors(backgroundColor: Colors.white),
        ),
        const SizedBox(height: 16),
        WideElevatedButton(
          onPressed: () => controller.onMobileLoginPressed(context),
          text: "モバイル管理画面にログイン",
          colors: const WideElevatedButtonColors(backgroundColor: Colors.white),
        ),
        const SizedBox(height: 16),
        const ListHeading("アプリについて"),
        const SizedBox(height: 16),
        VersionTile(packageInfo: packageInfo.value),
        const SizedBox(height: 16),
        WideElevatedButton(
          onPressed: () => controller.onLicensePressed(context),
          text: "ライセンス",
          colors: const WideElevatedButtonColors(backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
