import 'package:beacon_plugin/beacon_manager.dart';
import 'package:beacon_plugin/beacon_plugin.dart';
import 'package:beacon_plugin/flutter_beacon_api.dart';
import 'package:beacon_plugin/pigeon.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beacon_providers.g.dart';

@Riverpod(keepAlive: true)
class BeaconState extends _$BeaconState {
  late BeaconManager _beaconManager;
  static final _logger = Logger("BeaconStateProvider");

  @override
  Future<bool> build() async {
    _beaconManager = BeaconPlugin.beaconManager;
    FlutterBeaconApi.setup(
      FlutterBeaconApiImpl((data) {
        _logger.info("beacon data: $data");
      }),
    );
    await _beaconManager.setBeaconServiceUUIDs(["FE6F"]);
    return false;
  }

  Future<void> startScan() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.value! == true) {
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
      if (state.value! == false) {
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
