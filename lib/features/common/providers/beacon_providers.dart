import 'package:beacon_plugin/beacon_manager.dart';
import 'package:beacon_plugin/beacon_plugin.dart';
import 'package:beacon_plugin/flutter_beacon_api.dart';
import 'package:beacon_plugin/pigeon.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logging/logging.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beacon_providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [VisitorUser, apiClient])
class BeaconState extends _$BeaconState {
  late BeaconManager _beaconManager;
  static final _logger = Logger("BeaconStateProvider");

  @override
  Future<bool> build() async {
    _logger.info("beacon state initializing...");
    _beaconManager = BeaconPlugin.beaconManager;
    final apiClient = ref.watch(apiClientProvider);
    final user = await ref.watch(visitorUserProvider.future);
    final notifications = await ref.watch(localNotificationsProvider.future);

    FlutterBeaconApi.setup(
      FlutterBeaconApiImpl((data) async {
        _logger.info("beacon data: $data");

        if (data.hwid != null) {
          // ignore: avoid_manual_providers_as_generated_provider_dependency
          ref.read(scannedBeaconsProvider.notifier).addBeacon(data);

          if (user.visitor != null) {
            // TODO: 通知の実装確認
            await notifications.show(
              0,
              "テスト",
              "${data.hwid}が検出されました",
              const NotificationDetails(),
            );
            await apiClient.getVisitorApi().dropPalette(
                  visitorId: user.visitor!.visitorIdentification.visitorId,
                  dropPaletteRequest: DropPaletteRequest(
                    eventId: user.visitor!.visitorIdentification.eventId,
                    hwId: data.hwid,
                  ),
                );
          }
        }
      }),
    );
    await _beaconManager.setBeaconServiceUUIDs(["FE6F"]);
    _logger.info("beacon state initialized");

    if (state.value == true) {
      _logger.warning("beacon scan already started");
      return false;
    } else {
      await _beaconManager.startScan();
      _logger.info("beacon scan started");
      return true;
    }
  }
}

@Riverpod(keepAlive: true)
class ScannedBeacons extends _$ScannedBeacons {
  final _logger = Logger("BeaconsProvider");

  @override
  Map<String, BeaconData> build() => <String, BeaconData>{};

  void addBeacon(BeaconData beacon) {
    final newState = {...state, beacon.hwid!: beacon};
    state = newState;
    _logger.info("beacon added: $beacon");
  }

  void clearBeacons() {
    final newState = <String, BeaconData>{};
    state = newState;
    _logger.info("beacons cleared");
  }
}

// @Riverpod()
// Future<List<Spot>> registeredSpots(RegisteredSpotsRef ref) async {
//   final client = ref.watch(apiClientProvider);
//   final user = await ref.watch(visitorUserProvider.future);
//   final result = await client.getVisitorApi().checkUpdate(visitorId: visitorId, eventId: eventId)
//   return result;
// }
