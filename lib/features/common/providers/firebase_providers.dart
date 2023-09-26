import 'package:firebase_core/firebase_core.dart'; // import 'package:repaint_mobile/firebase_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_providers.g.dart';

@Riverpod(keepAlive: true)
Future<FirebaseApp> firebase(FirebaseRef ref) {
  // TODO: FirebaseOptions.currentPlatform
  return Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
}

@Riverpod(keepAlive: true, dependencies: [])
Future<String> firebaseClientId(FirebaseClientIdRef ref) {
  return Future.value(""); // TODO: FirebaseInstallations.instance.getId();
}
