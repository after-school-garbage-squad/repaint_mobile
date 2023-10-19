import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';

class IntroductionWelcomeController {
  const IntroductionWelcomeController();

  Future<void> onContinuePressed(BuildContext context) async {
    await analytics.logEvent(name: 'introduction_continue_pressed');
    if (context.mounted) {
      context.pushRoute(const IntroductionManualRoute());
    }
  }

  Future<void> onSettingsPressed(BuildContext context) async {
    await analytics.logEvent(name: 'introduction_settings_pressed');
    if (context.mounted) {
      context.pushRoute(const IntroductionSettingsRoute());
    }
  }
}
