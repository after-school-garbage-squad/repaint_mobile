import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_core/firebase_core.dart';
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
Future<String> firebaseClientId(FirebaseClientIdRef ref) {
  return FirebaseInstallations.instance.getId();
}
