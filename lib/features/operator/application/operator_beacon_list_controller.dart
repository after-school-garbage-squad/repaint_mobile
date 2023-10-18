import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';

class OperatorBeaconListController {
  const OperatorBeaconListController(this._beacons);

  final ScannedBeacons _beacons;

  Future<void> onBeaconSelected(
    BuildContext context,
    ScannedBeaconData beacon,
  ) async {
    if (beacon.hwid == null) return;
    await analytics.logEvent(
      name: 'operator_beacon_selected',
      parameters: {'beacon': beacon.hwid},
    );
    if (context.mounted) {
      context.pushRoute(OperatorBeaconSettingsRoute(hwId: beacon.hwid));
    }
  }

  Future<void> onResetPressed() async {
    await analytics.logEvent(name: 'operator_beacon_reset');
    _beacons.clearBeacons();
  }
}
