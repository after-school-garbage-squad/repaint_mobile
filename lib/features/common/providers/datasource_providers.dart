import 'package:logging/logging.dart';
import 'package:repaint_mobile/features/common/infrastructures/datasources/local/local_data_source.dart';
import 'package:repaint_mobile/features/common/providers/util_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'datasource_providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final logger = Logger("SharedPreferencesProvider");
  logger.info('initialized');
  logger.info("keys: ${sharedPreferences.getKeys()}");
  return sharedPreferences;
}

@Riverpod(keepAlive: true, dependencies: [sharedPreferences])
Future<LocalDataSource> localDataSource(LocalDataSourceRef ref) async {
  // TODO: バージョンごとにデータをクリアする処理
  // final packageInfo = await ref.watch(packageInfoProvider.future);
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  // final currentVersion = sharedPreferences.getString("version");
  // final latestVersion = "${packageInfo.version} (${packageInfo.buildNumber})";
  // if (currentVersion == null || currentVersion != latestVersion) {
  //   sharedPreferences.clear();
  //   sharedPreferences.setString("version", latestVersion);
  // }
  final localDataSource = LocalDataSource(sharedPreferences);
  Logger("LocalDataSourceProvider").info('initialized');
  return localDataSource;
}
