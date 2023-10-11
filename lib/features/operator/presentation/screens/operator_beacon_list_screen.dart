import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/presentation/widgets/operator_elevated_tile.dart';
import 'package:repaint_mobile/features/operator/providers/event_providers.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorBeaconListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorBeaconListControllerProvider);
    final Map<String, ScannedBeaconData> scannedBeacons =
        ref.watch(scannedBeaconsProvider);
    final spots = ref.watch(operatorSpotsProvider);

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
      title: "スポット一覧",
      scrollableChildren: [
        const ListHeading("検知したスポット"),
        ...scannedBeacons.values
            .map(
              (beacon) => [
                const SizedBox(height: 16.0),
                OperatorElevatedTile.beacon(
                  onTap: () => controller.onBeaconSelected(context, beacon),
                  // name: "未設定",
                  name: spots.maybeWhen(
                    data: (data) => data[beacon.hwid]?.name ?? "未設定",
                    orElse: () => "読み込み中...",
                  ),
                  rssi: beacon.rssi ?? 0.0,
                  hwid: beacon.hwid ?? "",
                  datetime: beacon.datetime,
                ),
              ],
            )
            .expand((element) => element),
        const SizedBox(height: 16.0),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 16.0),
              Text("スポットを検知中..."),
            ],
          ),
        ),
      ],
      bottomChildren: [
        WideElevatedButton(
          onPressed: () => ref.refresh(scannedBeaconsProvider.notifier),
          text: "再読み込み",
        ),
        const SizedBox(height: 16.0),
        WideElevatedButton(
          onPressed: () => controller.onResetPressed(),
          text: "リセット",
        ),
        const BottomPadding(),
      ],
    );
  }
}
