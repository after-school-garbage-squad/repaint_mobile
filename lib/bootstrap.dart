import "package:beacon_plugin/beacon_plugin.dart";
import "package:beacon_plugin/flutter_beacon_api.dart";
import "package:beacon_plugin/pigeon.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/services.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:logging/logging.dart';
import "package:repaint_api_client/repaint_api_client.dart";
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
  logger.info("started");

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final container = ProviderContainer();
  await providers.initializeProviders(container);

  logger.info("beacon state initializing...");
  final beaconManager = BeaconPlugin.beaconManager;
  FlutterBeaconApi.setup(
    FlutterBeaconApiImpl((data) async {
      logger.info("beacon data: $data");
      container.read(providers.scannedBeaconsProvider.notifier).addBeacon(
            providers.ScannedBeaconData(
              data.serviceUUID,
              data.hwid,
              data.rssi,
              DateTime.now(),
            ),
          );
      final visitor =
          (await container.read(providers.visitorUserProvider.future)).visitor;
      if (visitor != null && data.hwid != null) {
        logger.info("drop palette");
        await container
            .read(providers.apiClientProvider)
            .getVisitorApi()
            .dropPalette(
              visitorId: visitor.visitorIdentification.visitorId,
              dropPaletteRequest: DropPaletteRequest(
                eventId: visitor.visitorIdentification.eventId,
                hwId: data.hwid!,
              ),
            );
        await Future.delayed(const Duration(seconds: 20));
      }
    }),
  );
  await beaconManager.setBeaconServiceUUIDs(["FE6F"]);
  logger.info("beacon state initialized");

  await beaconManager.startScan();
  logger.info("beacon scan started");

  logger.info("finished");
  return container;
}
