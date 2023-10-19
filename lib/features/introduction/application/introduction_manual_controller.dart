import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/config/providers.dart';

class IntroductionManualController {
  const IntroductionManualController();

  Future<void> onContinuePressed(BuildContext context) async {
    await analytics.logEvent(name: 'introduction_continue_pressed');
    final futures = PermissionGuard.permissions
        .map((element) => element.isGranted)
        .toList();
    await Future.wait(futures)
        .then((value) => value.every((element) => element))
        .then(
          (value) => value
              ? context.pushRoute(const IntroductionQRCodeReaderRoute())
              : context.pushRoute(const IntroductionStepperRoute()),
        );
  }
}
