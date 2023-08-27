import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/providers.dart';

class PermissionGuard extends AutoRouteGuard {
  PermissionGuard(this._ref);

  final Ref _ref;
  static final permissions = [
    Permission.notification,
    Permission.location,
    Permission.bluetooth,
    Permission.camera,
  ];

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    bool permission = await _ref.read(permissionProvider.future);
    if (permission == false) {
      await permissions.request();
      permission = await _ref.refresh(permissionProvider.future);
    }
    resolver.next(permission);
  }
}
