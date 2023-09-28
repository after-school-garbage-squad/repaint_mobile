import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/features/common/domain/entities/beacon_entity.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_heading.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/list_scaffold.dart';
import 'package:repaint_mobile/features/operator/presentation/widgets/operator_elevated_tile.dart';
import 'package:repaint_mobile/features/operator/providers/providers.dart';

@RoutePage()
class OperatorBeaconListScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(operatorBeaconListControllerProvider);

    const List<BeaconEntity> beacons = [
      BeaconEntity(
        id: "aaa",
        name: "登録済みの名前",
        proximity: BeaconProximity.immediate,
        hwid: "0x0000000000",
      ),
      BeaconEntity(
        id: "bbb",
        name: "登録済みの名前",
        proximity: BeaconProximity.near,
        hwid: "0x0000000000",
      ),
      BeaconEntity(
        id: "ccc",
        name: "登録済みの名前",
        proximity: BeaconProximity.far,
        hwid: "0x0000000000",
      ),
    ];

    return ListScaffold(
      scrollableChildren: [
        const ListHeading("検知したビーコン"),
        ...beacons
            .map(
              (beacon) => [
                const SizedBox(height: 16),
                OperatorElevatedTile.beacon(
                  onTap: () => controller.onBeaconSelected(context, beacon),
                  name: beacon.name,
                  proximity: beacon.proximity,
                  hwid: beacon.hwid,
                ),
              ],
            )
            .expand((element) => element),
      ],
    );
  }
}
