import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logging/logging.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/firebase_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseApp> firebase(FirebaseRef ref) {
  return Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

// @Riverpod(keepAlive: true, dependencies: [])
// Future<String?> firebaseClientId(FirebaseClientIdRef ref) async {
//   final id = await FirebaseInstallations.instance.getId();
//   final logger = Logger("FirebaseClientIdProvider");
//   logger.info("Firebase Client ID: $id");
//   return id;
// }

@Riverpod(keepAlive: true, dependencies: [VisitorUser])
Future<String?> fcmRegistrationToken(FcmRegistrationTokenRef ref) async {
  final registrationId = await ref.read(
    visitorUserProvider.selectAsync((value) => value.visitor?.registrationId),
  );
  await FirebaseMessaging.instance.requestPermission();
  final apnsToken = await FirebaseMessaging.instance.getAPNSToken();

  if (apnsToken != null) {
    final fcmToken =
        registrationId ?? await FirebaseMessaging.instance.getToken();
    final logger = Logger("FcmRegistrationTokenProvider");
    logger.info("Firebase FCM Registration Token: $fcmToken");
    return fcmToken;
  } else {
    return null;
  }
}
