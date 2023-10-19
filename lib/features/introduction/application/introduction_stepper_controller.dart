import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';
import 'package:repaint_mobile/features/introduction/providers/state_providers.dart';

class IntroductionStepperController {
  const IntroductionStepperController(this._stepper);

  final IntroductionStepper _stepper;

  Future<void> onPostFrameCallback(int steps) async {
    await analytics.logEvent(name: 'stepper_post_frame_callback');
    _stepper.setSteps(steps);
  }

  Future<void> onStepTapped(int index) async {
    await analytics.logEvent(name: 'stepper_step_tapped');
    _stepper.jumpTo(index);
  }

  Future<Map<Permission, PermissionStatus>> _onStepContinue(
    List<Permission> permissions,
  ) async {
    await analytics.logEvent(name: 'stepper_continue_pressed');

    final List<PermissionStatus> statuses = [];

    await Future.forEach(
      permissions.map((permission) => permission.request()),
      (element) async => statuses.add(await element),
    );

    if (statuses.every((e) => e.isGranted)) {
      _stepper.next();
    } else {
      openAppSettings();
    }
    return Map.fromIterables(permissions, statuses);
  }

  Future<void> onStepNotificationPermit() async {
    _onStepContinue(PermissionGuard.notificationPermissions);
  }

  Future<void> onStepNotificationDeny() async {
    _onStepContinue([]);
  }

  Future<void> onStepLocation() async {
    _onStepContinue(PermissionGuard.locationPermissions);
  }

  Future<void> onStepBluetooth() async {
    _onStepContinue(PermissionGuard.bluetoothPermissions);
  }

  Future<void> onStepCamera() async {
    _onStepContinue(PermissionGuard.cameraPermissions);
  }

  Future<void> onStepEvent(BuildContext context) async {
    await analytics.logEvent(name: 'stepper_continue_pressed');

    if (context.mounted) {
      context.pushRoute(const IntroductionQRCodeReaderRoute());
    }
  }

  Future<void> onStepCancel() async {
    await analytics.logEvent(name: 'stepper_cancel_pressed');
    _stepper.previous();
  }
}
