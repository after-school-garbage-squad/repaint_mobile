import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/operator/providers/state_providers.dart';

class OperatorStepperController {
  const OperatorStepperController(this._stepper, this._auth0);

  final OperatorStepper _stepper;
  final Auth0 _auth0;
  static final _logger = Logger("OperatorStepperController");

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

  void onStepCancel() {
    _stepper.previous();
  }
}
