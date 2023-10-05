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

@Riverpod(keepAlive: true, dependencies: [VisitorUser])
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
        if (data.hwid != null) {
          _logger.info("beacon data: $data");
          // ignore: avoid_manual_providers_as_generated_provider_dependency
          ref.read(beaconsProvider.notifier).addBeacon(data);

          if (user.visitorIdentification != null) {
            // TODO: 通知の実装確認
            await notifications.show(
              0,
              "テスト",
              "テスト",
              const NotificationDetails(),
            );
            await apiClient.getVisitorApi().dropPalette(
                  visitorId: user.visitorIdentification!.visitorId,
                  dropPaletteRequest: DropPaletteRequest(
                    eventId: user.visitorIdentification!.eventId,
                    hwId: data.hwid,
                  ),
                );
            await Future.delayed(const Duration(seconds: 5));
          }
        }
      }),
    );
    await _beaconManager.setBeaconServiceUUIDs(["FE6F"]);
    _logger.info("beacon state initialized");
    return false;
  }

  Future<void> startScan() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.value == true) {
        _logger.warning("beacon scan already started");
      } else {
        await _beaconManager.startScan();
        _logger.info("beacon scan started");
      }
      return true;
    });
  }

  Future<void> stopScan() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.value == false) {
        _logger.warning("beacon scan already stopped");
      } else {
        await _beaconManager.stopScan();
        _logger.info("beacon scan stopped");
      }
      return false;
    });
  }

  Future<void> setBeaconServiceUUIDs(List<String> uuids) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _beaconManager.setBeaconServiceUUIDs(uuids);
      _logger.info("beacon service uuids set");
      return state.value!;
    });
  }
}

@Riverpod(keepAlive: true)
class Beacons extends _$Beacons {
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
