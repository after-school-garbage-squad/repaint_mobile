import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorBeaconSettingsScreen extends ConsumerWidget {
  const OperatorBeaconSettingsScreen({super.key, @queryParam this.hwId});

  final String? hwId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(operatorBeaconSettingsControllerProvider.future);
    final beacon =
        ref.watch(scannedBeaconsProvider.select((value) => value[hwId]));
    final textEditingController = TextEditingController();

    ref.listen(
      networkErrorProvider,
      (previous, next) => showNetworkErrorSnackBar(context, next),
    );

    return ListScaffold(
      title: "スポットの設定",
      scrollableChildren: [
        const ListHeading("情報"),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "SSID",
          value: "${beacon?.rssi}",
        ),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "HWID",
          value: "${beacon?.hwid}",
        ),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "Service UUID",
          value: "${beacon?.serviceUUID}",
        ),
        const SizedBox(height: 16.0),
        const ListHeading("設定"),
        const SizedBox(height: 16.0),
        Material(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
          elevation: 1.0,
          child: SettingsTile.textField(
            label: "スポットの名前",
            controller: textEditingController,
          ),
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
                  beacon!.hwid!,
                  "FE6F", // beacon.serviceUUID!,
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
