import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_stepper_screen.dart';
import 'package:repaint_mobile/features/operator/providers/state_providers.dart';

class OperatorStepperController {
  const OperatorStepperController(this._stepper, this._auth0);

  final OperatorStepper _stepper;
  final Auth0 _auth0;
  static final _logger = Logger("OperatorStepperController");

  Future<void> onPostFrameCallback(int steps) async {
    await analytics.logEvent(name: 'stepper_post_frame_callback');
    _stepper.setSteps(steps);
  }

  Future<void> onStepTapped(int index) async {
    await analytics
        .logEvent(name: 'stepper_step_tapped', parameters: {'index': index});
    _stepper.jumpTo(index);
  }

  Future<Map<Permission, PermissionStatus>> _onStepContinue(
    BuildContext context,
    List<Permission> permissions,
  ) async {
    await analytics.logEvent(name: 'stepper_step_continue');

    final List<PermissionStatus> statuses = [];

    await Future.forEach(
      permissions.map((permission) => permission.request()),
      (element) async => statuses.add(await element),
    );

    if (statuses.every((e) => e.isGranted)) {
      _stepper.next();
    } else {
      final status = statuses.firstWhereOrNull((e) => !e.isGranted);
      final permission = permissions[statuses.indexOf(status!)];

      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) => PermissionDeniedDialog(permission: permission),
        );
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
    await analytics.logEvent(name: 'stepper_step_event');
    try {
      final credential = await _auth0
          .webAuthentication(scheme: dotenv.env["AUTH0_SCHEME"])
          .login();
      _logger.info("accessToken: ${credential.accessToken}");
      _logger.info("idToken: ${credential.idToken}");
      _logger.info("refreshToken: ${credential.refreshToken}");
      if (context.mounted) {
        await context
            .pushRoute(OperatorEventListRoute(token: credential.idToken));
      }
    } catch (e) {
      _logger.warning(e.toString());
    }
  }

  Future<void> onStepCancel() async {
    await analytics.logEvent(name: 'stepper_step_cancel');
    _stepper.previous();
  }
}
