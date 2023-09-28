import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/version_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/visitor/providers/providers.dart';

@RoutePage()
class VisitorSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(visitorSettingsProvider);
    final controller = ref.watch(visitorSettingsControllerProvider);
    final packageInfo = ref.watch(packageInfoProvider);

    return ListScaffold(
      scrollableChildren: [
        const ListHeading("通知設定"),
        const SizedBox(height: 12),
        SettingsTile.toggle(
          title: "スポットに入った際の通知",
          value: settings.value?.notifications.spot ?? false,
          onChanged: controller.onSpotNotificationChanged,
        ),
        const SizedBox(height: 12),
        SettingsTile.toggle(
          title: "イベントからのお知らせ",
          value: settings.value?.notifications.event ?? false,
          onChanged: controller.onEventNotificationChanged,
        ),
        const SizedBox(height: 12),
        SettingsTile.toggle(
          title: "その他の通知",
          value: settings.value?.notifications.other ?? false,
          onChanged: controller.onOtherNotificationChanged,
        ),
        const SizedBox(height: 32),
        const ListHeading("アカウント設定"),
        const SizedBox(height: 12),
        WideElevatedButton(
          onPressed: () => controller.onLogoutPressed(context),
          text: "ログアウト",
          colors: const WideElevatedButtonColors(
            backgroundColor: Colors.white,
            textColor: Colors.red,
          ),
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
