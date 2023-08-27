import 'package:repaint_mobile/features/common/infrastructures/datasources/local/local_data_source.dart';
import 'package:repaint_mobile/features/common/providers/util_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'datasource_providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
Future<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final logger = ref.read(loggerProvider);
  logger.d('SharedPreferences initialized');
  logger.d("SharedPreferences keys: ${sharedPreferences.getKeys()}");
  return sharedPreferences;
}

@Riverpod(keepAlive: true, dependencies: [sharedPreferences])
Future<LocalDataSource> localDataSource(LocalDataSourceRef ref) async {
  final sharedPreferences = await ref.watch(sharedPreferencesProvider.future);
  final logger = ref.read(loggerProvider);
  logger.d('LocalDataSource initialized');
  return LocalDataSource(sharedPreferences, logger);
}
