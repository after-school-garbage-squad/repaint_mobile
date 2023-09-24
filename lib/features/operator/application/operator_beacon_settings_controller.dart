import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

class OperatorBeaconSettingsController {
  const OperatorBeaconSettingsController();

  void onUnregisterPressed(BuildContext context) {
    // TODO: ビーコンの登録解除処理を実装する
    context.popRoute();
  }

  void onRegisterPressed(BuildContext context) {
    // TODO: ビーコンの登録処理を実装する
    context.popRoute();
  }
}
