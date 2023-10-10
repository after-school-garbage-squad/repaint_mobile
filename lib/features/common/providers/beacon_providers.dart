import 'package:beacon_plugin/beacon_manager.dart';
import 'package:beacon_plugin/flutter_beacon_api.dart';
import 'package:beacon_plugin/pigeon.dart';
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
        final visitor = (await ref.read(visitorUserProvider.future)).visitor;
        if (visitor != null) {
          _logger.info("drop palette");
          await ref.read(apiClientProvider).getVisitorApi().dropPalette(
                visitorId: visitor.visitorIdentification.visitorId,
                dropPaletteRequest: DropPaletteRequest(
                  eventId: visitor.visitorIdentification.eventId,
                ),
              );
          await Future.delayed(const Duration(seconds: 20));
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

@Riverpod(keepAlive: true, dependencies: [apiClient, OperatorUser])
Future<Map<String, Spot>?> registeredSpots(RegisteredSpotsRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final eventId =
      await ref.watch(operatorUserProvider.selectAsync((data) => data.eventId));
  if (eventId == null) return null;
  final data = (await apiClient.getAdminApi().getSpots(eventId: eventId)).data;
  if (data == null) return null;
  return Map.fromIterable(data.map((e) => MapEntry(e.hwId, e)));
}
