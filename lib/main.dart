import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/bootstrap.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:sentry_logging/sentry_logging.dart';

void main() async {
  await dotenv.load();
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
