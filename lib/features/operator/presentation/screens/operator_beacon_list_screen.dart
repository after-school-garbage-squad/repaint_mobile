import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/operator/presentation/widgets/operator_elevated_tile.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorBeaconListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorBeaconListControllerProvider);
    final scannedBeacons = ref.watch(beaconsProvider);

    return ListScaffold(
      title: "ビーコン一覧",
      scrollableChildren: [
        const ListHeading("検知したビーコン"),
        const SizedBox(height: 16.0),
        ...scannedBeacons.values
            .map(
              (beacon) => [
                OperatorElevatedTile.beacon(
                  onTap: () => controller.onBeaconSelected(context, beacon),
                  name: "ビーコン名",
                  rssi: beacon.rssi!,
                  hwid: beacon.hwid!,
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
              Text("ビーコンを検知中..."),
            ],
          ),
        ),
      ],
    );
  }
}
