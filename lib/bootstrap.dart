import "package:beacon_plugin/beacon_plugin.dart";
import "package:beacon_plugin/flutter_beacon_api.dart";
import "package:beacon_plugin/pigeon.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/services.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:logging/logging.dart';
import 'package:repaint_mobile/config/providers.dart' as providers;

int _notificationId = 0;
bool _isScanned = false;

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
  final localNotifications = await container.read(
    providers.localNotificationsProvider.future,
  );

  logger.info("beacon state initializing...");
  final beaconManager = BeaconPlugin.beaconManager;
  FlutterBeaconApi.setup(
    FlutterBeaconApiImpl((data) async {
      // logger.info("beacon data: $data");
      container.read(providers.scannedBeaconsProvider.notifier).addBeacon(
            providers.ScannedBeaconData(
              data.serviceUUID,
              data.hwid,
              data.rssi,
              DateTime.now(),
            ),
          );
      final visitor =
          await container.read(providers.visitorUserProvider.future);
      final visitorIdentification = visitor.visitor?.visitorIdentification;
      final hwIds = visitor.event?.spots.map((e) => e.hwId).toList();
      if (visitorIdentification != null && data.hwid != null && !_isScanned) {
        _isScanned = true;

        if (hwIds?.contains(data.hwid) == true) {
          await localNotifications.show(
            _notificationId++,
            "テスト",
            "登録済みのスポット: ${data.hwid}が検出されました",
            const NotificationDetails(
              android: AndroidNotificationDetails(
                "スポット通知",
                "スポット通知",
                channelDescription: "スポット通知",
              ),
            ),
          );
          // final response = await container
          //     .read(providers.apiClientProvider)
          //     .getVisitorApi()
          //     .scannedSpot(
          //       visitorId: visitorIdentification.visitorId,
          //       scannedSpotRequest: ScannedSpotRequest(
          //         eventId: visitorIdentification.eventId,
          //         hwId: data.hwid!,
          //       ),
          //     );
          // if (response.data?.isUpdated == true) {
          container.read(providers.visitorConfettiProvider.notifier).state =
              data;
          // }
        } else {
          await localNotifications.show(
            _notificationId++,
            "テスト",
            "未登録のスポット: ${data.hwid}が検出されました",
            const NotificationDetails(
              android: AndroidNotificationDetails(
                "スポット通知",
                "スポット通知",
                channelDescription: "スポット通知",
              ),
            ),
          );
        }

        await Future.delayed(const Duration(seconds: 10), () {
          _isScanned = false;
        });
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
