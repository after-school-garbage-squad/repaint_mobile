import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/bootstrap.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/providers/uri_providers.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';
import 'package:uni_links/uni_links.dart';

// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   // handle action
// }

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

void main() async {
  await dotenv.load();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await SentryFlutter.init(
    (options) {
      options.dsn = kDebugMode ? '' : dotenv.env["SENTRY_DSN"];
      options.environment = dotenv.env["SENTRY_ENVIRONMENT"];
      options.tracesSampleRate = 1.0;
      options.addIntegration(LoggingIntegration());
    },
    appRunner: () async => runApp(
      UncontrolledProviderScope(
        container: await bootstrap(),
        child: DefaultAssetBundle(
          bundle: SentryAssetBundle(),
          child: const RepaintApp(),
        ),
      ),
    ),
  );
}

class RepaintApp extends ConsumerWidget {
  const RepaintApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider.future);

    ref.listen(uriLinkProvider, (previous, next) async {
      if (next.value != null) await joinEvent(next.value, ref);
    });

    uriLinkStream.listen((data) async {
      if (data != null) await joinEvent(data, ref);
    });

    return FutureBuilder(
      future: appRouter,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp.router(
            title: 'Re:paint',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0x00429cff),
                primary: const Color(0xff0079ff),
                primaryContainer: const Color(0xffc0deff),
                secondary: const Color(0xff9376e0),
                secondaryContainer: const Color(0xffada2ff),
                tertiary: const Color(0xffe0b3ff),
                tertiaryContainer: const Color(0xfff2daff),
                error: const Color(0xffff003d),
                surface: const Color(0xffd6d6d6),
                background: const Color(0xfff8f8f8),
              ),
              useMaterial3: true,
            ),
            routerConfig: snapshot.data?.config(
              navigatorObservers: () => [
                SentryNavigatorObserver(),
              ],
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
