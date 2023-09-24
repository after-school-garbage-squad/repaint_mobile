import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorBeaconSettingsScreen extends ConsumerWidget {
  const OperatorBeaconSettingsScreen({
    super.key,
    @PathParam('beaconId') required this.beaconId,
  });

  final String beaconId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorBeaconSettingsControllerProvider);

    return ListScaffold(
      title: "ビーコン設定",
      scrollableChildren: [
        const ListHeading("ビーコンの設定"),
        const SizedBox(height: 16),
        // TODO: ビーコンの名前変更処理を実装する
        SettingsTile.textField(
          label: "ビーコンの名前",
          controller: TextEditingController(),
        ),
      ],
      bottomChildren: [
        Row(
          children: [
            Expanded(
              child: WideElevatedButton(
                onPressed: () => controller.onUnregisterPressed(context),
                text: "登録解除",
                colors: const WideElevatedButtonColors(
                  backgroundColor: Colors.white,
                  textColor: Colors.red,
                ),
              ),
            ),
            const SizedBox(width: 32.0),
            Expanded(
              child: WideElevatedButton(
                onPressed: () => controller.onRegisterPressed(context),
                text: "登録する",
              ),
            ),
          ],
        ),
        const BottomConstrainedPadding(),
      ],
    );
  }
}
