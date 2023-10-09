import 'dart:async';

import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_providers.g.dart';

@Riverpod(keepAlive: true)
Future<ServiceStatus> bluetoothService(BluetoothServiceRef ref) async {
  final status = await Permission.bluetooth.serviceStatus;
  final timer = Timer(const Duration(seconds: 1), () => ref.invalidateSelf());
  ref.onDispose(timer.cancel);
  return status;
}

@Riverpod(keepAlive: true)
Future<ServiceStatus> locationService(LocationServiceRef ref) async {
  final status = await Permission.location.serviceStatus;
  final timer = Timer(const Duration(seconds: 1), () => ref.invalidateSelf());
  ref.onDispose(timer.cancel);
  return status;
}
