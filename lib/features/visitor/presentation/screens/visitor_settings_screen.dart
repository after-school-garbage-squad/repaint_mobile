import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/version_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';

@RoutePage()
class VisitorSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(visitorSettingsControllerProvider.future);
    final packageInfo = ref.watch(packageInfoProvider);
    final user = ref.watch(visitorUserProvider);

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
        const ListHeading("イベント"),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "イベント名",
          value: "${user.value?.event?.name}",
        ),
        const SizedBox(height: 16.0),
        const ListHeading("アカウント"),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "イベントID",
          value: "${user.value?.visitor?.visitorIdentification.eventId}",
        ),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "ユーザーID",
          value: "${user.value?.visitor?.visitorIdentification.visitorId}",
        ),
        const SizedBox(height: 16.0),
        WideElevatedButton(
          onPressed: () async =>
              (await controller).onDeleteAccountPressed(context),
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
          onPressed: () async => (await controller).onLicensePressed(context),
          text: "ライセンス",
          colors: const WideElevatedButtonColors(backgroundColor: Colors.white),
        ),
      ],
    );
  }
}
