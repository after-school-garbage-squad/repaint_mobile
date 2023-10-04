import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logging/logging.dart';
import 'package:repaint_mobile/firebase_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseApp> firebase(FirebaseRef ref) {
  return Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

@Riverpod(keepAlive: true, dependencies: [])
Future<String?> firebaseClientId(FirebaseClientIdRef ref) async {
  final id = await FirebaseInstallations.instance.getId();
  final logger = Logger("FirebaseClientIdProvider");
  logger.info("Firebase Client ID: $id");
  return id;
}

@Riverpod(keepAlive: true, dependencies: [])
Future<String?> fcmRegistrationToken(FcmRegistrationTokenRef ref) async {
  final token = await FirebaseMessaging.instance.getToken();
  final logger = Logger("FcmRegistrationTokenProvider");
  logger.info("Firebase FCM Registration Token: $token");
  return token;
}
