import 'package:logging/logging.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beacon_providers.g.dart';

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
Future<Map<String, Spot>> registeredSpots(RegisteredSpotsRef ref) async {
  final apiClient = ref.watch(apiClientProvider);
  final operator = await ref.watch(operatorUserProvider.future);
  final eventId =
      await ref.watch(operatorUserProvider.selectAsync((data) => data.eventId));
  if (eventId == null && operator.token == null) return {};
  final data = (await apiClient.getAdminApi().getSpots(
            eventId: eventId!,
            headers: getAdminApiHeaders(operator.token!),
          ))
      .data;
  if (data == null) return {};
  return Map.fromIterable(data.map((e) => MapEntry(e.beacon.hwId, e)));
}
