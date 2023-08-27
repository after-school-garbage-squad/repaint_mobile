import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permission_providers.g.dart';

@Riverpod(keepAlive: true)
Future<bool> permission(PermissionRef ref) async {
  final statuses = await Future.wait(
    PermissionGuard.permissions.map((permission) => permission.status),
  );
  return statuses.every((status) => status.isGranted);
}
