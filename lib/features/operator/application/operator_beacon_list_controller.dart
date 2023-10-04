import 'package:auto_route/auto_route.dart';
import 'package:beacon_plugin/pigeon.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';

class OperatorBeaconListController {
  const OperatorBeaconListController();

  void onBeaconSelected(BuildContext context, BeaconData beacon) {
    if (beacon.hwid == null) return;
    context.pushRoute(OperatorBeaconSettingsRoute(beaconId: beacon.hwid!));
  }
}
