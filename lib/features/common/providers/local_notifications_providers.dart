import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_notifications_providers.g.dart';

@Riverpod(keepAlive: true)
Future<FlutterLocalNotificationsPlugin> localNotifications(
    LocalNotificationsRef ref,) async {
  return FlutterLocalNotificationsPlugin()
    ..initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings("@drawable/repaint"),
        iOS: DarwinInitializationSettings(),
      ),
    );
}
