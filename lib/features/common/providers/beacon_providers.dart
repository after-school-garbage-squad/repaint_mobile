import 'package:beacon_plugin/beacon_manager.dart';
import 'package:beacon_plugin/beacon_plugin.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'beacon_providers.g.dart';

@Riverpod(keepAlive: true)
bool scanningState(ScanningStateRef ref) {
  return true; // TODO: Shared Preferencesで永続化する
}

@Riverpod(keepAlive: true)
Future<BeaconManager> beaconManager(BeaconManagerRef ref) async {
  final scanningState = ref.read(scanningStateProvider);
  final beaconManager = BeaconPlugin.beaconManager;
  await beaconManager.setBeaconServiceUUIDs(["FE6F"]);
  if (scanningState) await beaconManager.startScan();
  return beaconManager;
}
