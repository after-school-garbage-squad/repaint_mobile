import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';

class IntroductionSettingsController {
  const IntroductionSettingsController();

  void onLoginPressed(BuildContext context) {
    context.pushRoute(const OperatorStepperRoute());
  }

  void onLicensePressed(BuildContext context) {
    context.pushRoute(const OssLicensesRoute());
  }
}
