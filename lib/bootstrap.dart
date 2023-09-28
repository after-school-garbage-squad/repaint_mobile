import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:logging/logging.dart';
import 'package:repaint_mobile/config/providers.dart' as providers;

Future<ProviderContainer> bootstrap() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    if (kDebugMode) {
      print(
        [
          "[${record.loggerName}]",
          record.time,
          "${record.level.name}:",
          record.message,
        ].join(" "),
      );
    }
  });

  final logger = Logger("Bootstrap");
  logger.info("Bootstrap started");

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final container = ProviderContainer();
  await providers.initializeProviders(container);

  logger.info("Bootstrap finished");
  return container;
}
