import 'package:auto_route/auto_route.dart';
import 'package:beacon_plugin/pigeon.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/providers/beacon_providers.dart';

class OperatorBeaconListController {
  const OperatorBeaconListController(this._beacons);

  final Beacons _beacons;

  void onBeaconSelected(BuildContext context, BeaconData beacon) {
    if (beacon.hwid == null) return;
    context.pushRoute(
      OperatorBeaconSettingsRoute(
        hwId: beacon.hwid,
        serviceUuid: beacon.serviceUUID,
      ),
    );
  }

  void onResetPressed() {
    _beacons.clearBeacons();
  }
}
