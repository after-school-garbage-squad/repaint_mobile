import 'package:permission_handler/permission_handler.dart';
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
    List<Permission> permissions, {
    void Function()? onGranted,
  }) async {
    final status = await permissions.request();
    if (status.values.every((e) => e.isGranted)) {
      onGranted != null ? onGranted() : _stepper.next();
    }
    return status;
  }

  Future<Map<Permission, PermissionStatus>> onStepNotification() {
    return _onStepContinue(PermissionGuard.notificationPermissions);
  }

  Future<Map<Permission, PermissionStatus>> onStepBeacon() {
    return _onStepContinue(PermissionGuard.beaconPermissions);
  }

  Future<Map<Permission, PermissionStatus>> onStepEvent(
    void Function() onGranted,
  ) {
    return _onStepContinue(
      PermissionGuard.eventPermissions,
      onGranted: onGranted,
    );
  }

  void onStepCancel() {
    _stepper.previous();
  }
}
