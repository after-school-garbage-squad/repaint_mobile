import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/introduction/providers/state_providers.dart';

class IntroductionStepperController {
  const IntroductionStepperController(this._stepper);

  final IntroductionStepper _stepper;

  void onPostFrameCallback(int steps) {
    _stepper.setSteps(steps);
  }

  void onStepTapped(int index) {
    _stepper.jumpTo(index);
  }

  Future<Map<Permission, PermissionStatus>> _onStepContinue(
    List<Permission> permissions,
  ) async {
    final List<PermissionStatus> statuses = [];

    await Future.forEach(
      permissions.map((permission) => permission.request()),
      (element) async => statuses.add(await element),
    );

    if (statuses.every((e) => e.isGranted)) _stepper.next();
    return Map.fromIterables(permissions, statuses);
  }

  Future<void> onStepNotification() async {
    _onStepContinue(PermissionGuard.notificationPermissions);
  }

  Future<void> onStepBeacon() async {
    _onStepContinue(PermissionGuard.beaconPermissions);
  }

  Future<void> onStepEvent(BuildContext context) async {
    context.pushRoute(const IntroductionQRCodeReaderRoute());
  }

  void onStepCancel() {
    _stepper.previous();
  }
}
