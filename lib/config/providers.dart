import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/permissions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod()
Future<bool> checkPermission(CheckPermissionRef ref) async {
  return Future.wait(permissions.map((permission) => permission.status))
      .then((statuses) => statuses.every((status) => status.isGranted));
}

@Riverpod(keepAlive: true)
PermissionGuard permissionGuard(PermissionGuardRef ref) {
  return PermissionGuard(ref);
}

Future<void> initializeProviders(ProviderContainer container) async {
  // TODO: 初期化が必要なプロバイダーがあればここで初期化する
}
