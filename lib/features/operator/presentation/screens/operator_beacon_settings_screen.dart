import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/event_providers.dart';

@RoutePage()
class OperatorBeaconSettingsScreen extends ConsumerWidget {
  const OperatorBeaconSettingsScreen({super.key, @queryParam this.hwId});

  final String? hwId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.watch(operatorBeaconSettingsControllerProvider.future);
    final beacon =
        ref.read(scannedBeaconsProvider.select((value) => value[hwId]));
    final spot = ref.watch(
      operatorSpotsByHwIdProvider.select((value) => value.value?[hwId]),
    );
    final textEditingController = TextEditingController(text: spot?.name);

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
      title: "スポットの設定",
      scrollableChildren: [
        const ListHeading("情報"),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "RSSI",
          value: "${beacon?.rssi}dBm",
        ),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "HWID",
          value: "${beacon?.hwid}",
        ),
        const SizedBox(height: 16.0),
        SettingsTile.text(
          title: "検知日時",
          value: DateFormat('yyyy/MM/dd HH:mm:ss')
              .format(beacon!.datetime.toLocal()),
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
        if (spot != null)
          WideElevatedButton(
            onPressed: () async => (await controller)
                .onUnregisterPressed(context, ref, spot.spotId),
            text: "登録解除",
            colors: const WideElevatedButtonColors(
              backgroundColor: Colors.white,
              textColor: Colors.red,
            ),
          )
        else
          WideElevatedButton(
            onPressed: () async => (await controller).onRegisterPressed(
              context,
              ref,
              textEditingController.value.text,
              beacon.hwid!,
              "FE6F", // beacon.serviceUUID!,
            ),
            text: "登録する",
          ),
        const BottomPadding(),
      ],
    );
  }
}
