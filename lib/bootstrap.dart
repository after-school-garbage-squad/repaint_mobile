import "package:beacon_plugin/beacon_plugin.dart";
import "package:beacon_plugin/flutter_beacon_api.dart";
import "package:beacon_plugin/pigeon.dart";
import 'package:firebase_messaging/firebase_messaging.dart';
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import 'package:logging/logging.dart';
import "package:repaint_api_client/repaint_api_client.dart";
import 'package:repaint_mobile/config/providers.dart' as providers;
import "package:repaint_mobile/features/common/domain/entities/user_entity.dart";
import "package:repaint_mobile/features/visitor/providers/visitor_providers.dart";

int _notificationId = 0;
int _scannedEpochFirst = 0;
int _scannedEpochLast = DateTime.now().millisecondsSinceEpoch;

Future<ProviderContainer> bootstrap() async {
  Logger.root.level = Level.INFO;
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

  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final container = ProviderContainer();

  await providers.initializeProviders(container);
  final localNotifications = await container.read(
    providers.localNotificationsProvider.future,
  );

  logger.info("visitor user initializing...");
  FirebaseMessaging.onMessage.listen((message) async {
    logger.info("fcm message received: $message");
    if (message.notification?.android != null) {
      await localNotifications.show(
        _notificationId++,
        message.notification?.title ?? "",
        message.notification?.body ?? "",
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "spot",
            "スポット通知",
            channelDescription: "スポット通知",
            importance: Importance.high,
          ),
        ),
      );
    }
  });
  FirebaseMessaging.instance.onTokenRefresh.listen((token) async {
    logger.info("fcm token refreshed: $token");
    await container
        .read(providers.visitorUserProvider.notifier)
        .updateVisitor((p0) => p0.copyWith(registrationId: token));
  });
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await container.read(providers.visitorUserProvider.notifier).initialize();
  logger.info("visitor user initialized");

  FlutterNativeSplash.remove();

  logger.info("beacon state initializing...");
  final beaconManager = BeaconPlugin.beaconManager;
  FlutterBeaconApi.setup(
    FlutterBeaconApiImpl((data) async {
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
      final epochDiff = _scannedEpochLast - _scannedEpochFirst;
      if (visitorIdentification != null &&
          data.hwid != null &&
          epochDiff > 10000 &&
          hwIds?.contains(data.hwid) == true) {
        logger.fine("epochDiff: $epochDiff");
        // final oldScannedEpochFirst = _scannedEpochFirst;
        _scannedEpochFirst = DateTime.now().millisecondsSinceEpoch;
        logger.fine("scannedEpochFirst: $_scannedEpochFirst");
        logger.info("visitor logged in, hwId: ${data.hwid}");

        try {
          final response = await container
              .read(providers.apiClientProvider)
              .getVisitorApi()
              .scannedSpot(
                visitorId: visitorIdentification.visitorId,
                scannedSpotRequest: ScannedSpotRequest(
                  eventId: visitorIdentification.eventId,
                  hwId: data.hwid!,
                ),
              );
          if (response.data != null) {
            container.read(visitorSpotBonusStateProvider.notifier).state =
                response.data!.isBonus;
          }
        } catch (e) {
          // ignore
        }

        // final matchedSpot = visitor.event?.spots.firstWhereOrNull(
        //   (element) => element.hwId == data.hwid && element.isPick == true,
        // );
        // if (matchedSpot != null) {
        //   logger.info("event hwId list contains hwId: ${data.hwid}");
        //   await localNotifications.show(
        //     _notificationId++,
        //     "${matchedSpot.name}の近くにいます",
        //     kDebugMode
        //         ? "前回から今回の検知までの時間: ${_scannedEpochFirst - oldScannedEpochFirst}ms\n"
        //             "検知から遅延含む処理完了までの時間: ${epochDiff}ms"
        //         : "アプリからQRコードをスキャンして、パレットを入手しましょう!",
        //     const NotificationDetails(
        //       android: AndroidNotificationDetails(
        //         "spot",
        //         "スポット通知",
        //         channelDescription: "スポット通知",
        //         importance: Importance.high,
        //       ),
        //     ),
        //   );
        //   logger.info("showed matched spot notification");
        // }
      }

      await Future.delayed(const Duration(seconds: 10), () {
        _scannedEpochLast = DateTime.now().millisecondsSinceEpoch;
        logger.fine("scannedEpochLast: $_scannedEpochLast");
      });
    }),
  );
  await beaconManager.setBeaconServiceUUIDs(["FE6F"]);
  logger.info("beacon state initialized");

  await beaconManager.startScan();
  logger.info("beacon scan started");

  logger.info("finished");
  return container;
}
