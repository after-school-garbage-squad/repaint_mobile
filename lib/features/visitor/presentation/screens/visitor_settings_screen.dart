import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/version_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/providers/providers.dart';

@RoutePage()
class VisitorSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(visitorSettingsControllerProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    final user = ref.watch(visitorUserProvider);

    ref.listen(
      networkErrorProvider,
      (previous, next) => showNetworkErrorSnackBar(context, next),
    );

    return ListScaffold(
      scrollableChildren: [
        const ListHeading("アカウント"),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "イベントID",
          value: "${user.value?.visitorIdentification?.eventId}",
        ),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "ユーザーID",
          value: "${user.value?.visitorIdentification?.visitorId}",
        ),
        const SizedBox(height: 16.0),
        WideElevatedButton(
          onPressed: () => controller.onDeleteAccountPressed(context),
          text: "アカウントの削除",
          colors: const WideElevatedButtonColors(
            backgroundColor: Colors.white,
            textColor: Colors.red,
          ),
        ),
        const SizedBox(height: 16.0),
        const ListHeading("アプリについて"),
        const SizedBox(height: 16.0),
        VersionTile(packageInfo: packageInfo.value),
        const SizedBox(height: 16.0),
        WideElevatedButton(
          onPressed: () => controller.onLicensePressed(context),
          text: "ライセンス",
          colors: const WideElevatedButtonColors(backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
