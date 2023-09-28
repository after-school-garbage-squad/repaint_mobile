import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/beacon_entity.dart';

class OperatorBeaconListController {
  const OperatorBeaconListController();

  void onBeaconSelected(BuildContext context, BeaconEntity beacon) {
    // TODO: タップした際の処理を実装する
    context.pushRoute(OperatorBeaconSettingsRoute(beaconId: beacon.id));
  }
}
