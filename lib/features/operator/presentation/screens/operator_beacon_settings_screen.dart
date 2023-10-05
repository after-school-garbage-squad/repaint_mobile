import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
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
    @queryParam this.hwId,
    @queryParam this.serviceUuid,
  });

  final String? hwId;
  final String? serviceUuid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(operatorBeaconSettingsControllerProvider.future);
    final textEditingController = TextEditingController();

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
      title: "スポット設定",
      scrollableChildren: [
        const ListHeading("スポットの設定"),
        const SizedBox(height: 16),
        SettingsTile.textField(
          label: "スポットの名前",
          controller: textEditingController,
        ),
      ],
      bottomChildren: [
        Row(
          children: [
            Expanded(
              child: WideElevatedButton(
                onPressed: () async =>
                    (await controller).onUnregisterPressed(context, hwId!),
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
                onPressed: () async => (await controller).onRegisterPressed(
                  context,
                  textEditingController.value.text,
                  hwId!,
                  serviceUuid!,
                ),
                text: "登録する",
              ),
            ),
          ],
        ),
        const BottomPadding(),
      ],
    );
  }
}
