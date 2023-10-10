import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';

class IntroductionHomeController {
  const IntroductionHomeController();

  Future<void> onContinuePressed(BuildContext context) async {
    context.pushRoute(const IntroductionManualRoute());
  }

  void onSettingsPressed(BuildContext context) {
    context.pushRoute(const IntroductionSettingsRoute());
  }
}
