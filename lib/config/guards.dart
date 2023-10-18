import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/providers.dart';

class PermissionGuard extends AutoRouteGuard {
  PermissionGuard(this._ref);

  final Ref _ref;
  static final permissions = [
    ...locationPermissions,
    ...bluetoothPermissions,
    ...cameraPermissions,
  ];

  static final notificationPermissions = [
    Permission.notification,
  ];

  static final locationPermissions = [
    Permission.location,
    Permission.locationWhenInUse,
    Permission.locationAlways,
  ];

  static final bluetoothPermissions = [
    Permission.bluetooth,
    if (Platform.isAndroid) Permission.bluetoothScan,
    if (Platform.isAndroid) Permission.ignoreBatteryOptimizations,
  ];

  static final cameraPermissions = [
    Permission.camera,
  ];

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    bool isAllPermissionsGranted = await _ref.read(permissionProvider.future);
    if (isAllPermissionsGranted == false) {
      try {
        for (final permission in permissions) {
          await permission.request();
        }
      } catch (e) {
        // ignore
      }
      isAllPermissionsGranted = await _ref.refresh(permissionProvider.future);
    }
    resolver.next(isAllPermissionsGranted);
  }
}
