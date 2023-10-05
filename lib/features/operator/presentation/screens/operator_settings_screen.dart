import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/version_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorSettingsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageInfo = ref.watch(packageInfoProvider);
    final controller = ref.watch(operatorSettingsControllerProvider);

    ref.listen(
      networkErrorProvider,
      (previous, next) {
        if (next != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(kDebugMode ? next.toString() : "通信エラー"),
            ),
          );
        }
      },
    );

    return ListScaffold(
      scrollableChildren: [
        const ListHeading("アカウント設定"),
        const SizedBox(height: 16),
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
