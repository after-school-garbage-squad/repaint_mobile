import "package:flutter/cupertino.dart";
import "package:flutter/services.dart";
import "package:flutter_dotenv/flutter_dotenv.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:repaint_mobile/config/providers.dart' as providers;

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await dotenv.load();

  final container = ProviderContainer();
  await providers.initializeProviders(container);
  await container.read(providers.beaconStateProvider.notifier).startScan();
  await container.read(providers.beaconStateProvider.notifier).startScan();
  return container;
}
