import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_stepper_screen.dart';
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
    BuildContext context,
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
      if (context.mounted) {
        final status = statuses.firstWhereOrNull((e) => !e.isGranted);
        final permission = permissions[statuses.indexOf(status!)];

        if (context.mounted) {
          showDialog(
            context: context,
            builder: (context) =>
                PermissionDeniedDialog(permission: permission),
          );
        }
      }
    }
    return Map.fromIterables(permissions, statuses);
  }

  Future<void> onStepNotificationPermit(BuildContext context) async {
    _onStepContinue(context, PermissionGuard.notificationPermissions);
  }

  Future<void> onStepNotificationDeny(BuildContext context) async {
    _onStepContinue(context, []);
  }

  Future<void> onStepLocation(BuildContext context) async {
    _onStepContinue(context, PermissionGuard.locationPermissions);
  }

  Future<void> onStepBluetooth(BuildContext context) async {
    _onStepContinue(context, PermissionGuard.bluetoothPermissions);
  }

  Future<void> onStepCamera(BuildContext context) async {
    _onStepContinue(context, PermissionGuard.cameraPermissions);
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
