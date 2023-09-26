import 'package:beacon_plugin/beacon_manager.dart';
import 'package:beacon_plugin/beacon_plugin.dart';
import 'package:beacon_plugin/flutter_beacon_api.dart';
import 'package:beacon_plugin/pigeon.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beacon_providers.g.dart';

@Riverpod(keepAlive: true)
class BeaconState extends _$BeaconState {
  late BeaconManager _beaconManager;

  @override
  Future<bool> build() async {
    _beaconManager = BeaconPlugin.beaconManager;
    await _beaconManager.setBeaconServiceUUIDs(["FE6F"]);
    FlutterBeaconApi.setup(
      FlutterBeaconApiImpl((data) {
        ref.read(loggerProvider).d("beacon data: $data");
      }),
    );
    return false;
  }

  Future<void> startScan() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.value! == true) {
        ref.read(loggerProvider).d("beacon scan already started");
      } else {
        await _beaconManager.startScan();
        ref.read(loggerProvider).d("beacon scan started");
      }
      return true;
    });
  }

  Future<void> stopScan() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      if (state.value! == false) {
        ref.read(loggerProvider).d("beacon scan already stopped");
      } else {
        await _beaconManager.stopScan();
        ref.read(loggerProvider).d("beacon scan stopped");
      }
      return false;
    });
  }

  Future<void> setBeaconServiceUUIDs(List<String> uuids) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _beaconManager.setBeaconServiceUUIDs(uuids);
      ref.read(loggerProvider).d("beacon service uuids set");
      return state.value!;
    });
  }
}
