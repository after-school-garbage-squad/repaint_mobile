import 'package:beacon_plugin/flutter_beacon_api.dart';
import "package:beacon_plugin/pigeon.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/config/providers.dart' as providers;

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final container = ProviderContainer();
  await providers.initializeProviders(container);
  final logger = container.read(providers.loggerProvider);
  FlutterBeaconApi.setup(
    FlutterBeaconApiImpl((data) {
      logger.d(data);
    }),
  );
  return container;
}
