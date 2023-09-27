import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';

class IntroductionHomeController {
  const IntroductionHomeController();

  void onContinuePressed(BuildContext context) {
    context.pushRoute(const IntroductionStepperRoute());
  }

  void onSettingsPressed(BuildContext context) {
    context.pushRoute(const IntroductionSettingsRoute());
  }
}
