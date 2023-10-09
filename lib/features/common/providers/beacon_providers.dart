import 'package:beacon_plugin/beacon_plugin.dart';
import 'package:beacon_plugin/flutter_beacon_api.dart';
import 'package:beacon_plugin/pigeon.dart';
import 'package:logging/logging.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beacon_providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [VisitorUser, apiClient])
class BeaconState extends _$BeaconState {
  static final _logger = Logger("BeaconStateProvider");

  @override
  Future<bool> build() async {
    final user = await ref.watch(visitorUserProvider.future);

    FlutterBeaconApi.setup(
      FlutterBeaconApiImpl((data) async {
        _logger.info("beacon data: $data");
        ref.read(scannedBeaconsProvider.notifier).addBeacon(
              ScannedBeaconData(
                data.serviceUUID,
                data.hwid,
                data.rssi,
                DateTime.now(),
              ),
            );
        final visitor = user.visitor;
        if (visitor != null) {
          await ref.read(apiClientProvider).getVisitorApi().dropPalette(
                visitorId: visitor.visitorIdentification.visitorId,
                dropPaletteRequest: DropPaletteRequest(
                  eventId: visitor.visitorIdentification.eventId,
                ),
              );
          await Future.delayed(const Duration(seconds: 5));
        }
      }),
    );
    BeaconPlugin.beaconManager.setBeaconServiceUUIDs(["FE6F"]);
    return false;
  }

  Future<void> startScan() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.value! == true) {
        _logger.warning("beacon scan already started");
      } else {
        await BeaconPlugin.beaconManager.startScan();
        _logger.info("beacon scan started");
      }
      return true;
    });
  }
}

@Riverpod(keepAlive: true)
class ScannedBeacons extends _$ScannedBeacons {
  final _logger = Logger("ScannedBeaconsProvider");

  @override
  Map<String, ScannedBeaconData> build() => <String, ScannedBeaconData>{};

  void addBeacon(ScannedBeaconData beacon) {
    final newState = {...state, beacon.hwid!: beacon};
    state = newState;
    _logger.info("beacon added: $beacon");
  }

  void clearBeacons() {
    final newState = <String, ScannedBeaconData>{};
    state = newState;
    _logger.info("beacons cleared");
  }
}

class ScannedBeaconData {
  const ScannedBeaconData(
    this.serviceUUID,
    this.hwid,
    this.rssi,
    this.datetime,
  );

  final String? serviceUUID;
  final String? hwid;
  final double? rssi;
  final DateTime datetime;
}

@Riverpod(keepAlive: true)
Future<Map<String, Spot>?> registeredSpots(RegisteredSpotsRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final eventId =
      await ref.watch(operatorUserProvider.selectAsync((data) => data.eventId));
  if (eventId == null) return null;
  final data = (await apiClient.getAdminApi().getSpots(eventId: eventId)).data;
  if (data == null) return null;
  return Map.fromIterable(data.map((e) => MapEntry(e.hwId, e)));
}
