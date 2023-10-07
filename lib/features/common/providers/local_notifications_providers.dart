import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_notifications_providers.g.dart';

@Riverpod(keepAlive: true)
Future<FlutterLocalNotificationsPlugin> localNotifications(
  LocalNotificationsRef ref,
) async {
  return FlutterLocalNotificationsPlugin();
}

@Riverpod(keepAlive: true, dependencies: [])
class NotificationId extends _$NotificationId {
  @override
  int build() {
    return 0;
  }

  int increment() {
    final oldState = state;
    state = state + 1;
    return oldState;
  }
}
