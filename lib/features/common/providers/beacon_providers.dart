import 'package:logging/logging.dart';
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
