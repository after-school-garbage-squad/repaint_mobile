import 'package:repaint_mobile/features/common/infrastructures/datasources/local/local_data_source.dart';
import 'package:repaint_mobile/features/visitor/domain/entities/visitor_settings_entity.dart';
import 'package:repaint_mobile/features/visitor/domain/repositories/visitor_repository.dart';

class VisitorRepository extends VisitorRepositoryInterface {
  VisitorRepository(this._localDataSource);

  final LocalDataSource _localDataSource;

  static const String _localDataSourceKey = "visitor_settings";

  Future<VisitorSettingsEntity> _initialize() async {
    const settings = VisitorSettingsEntity();
    await _localDataSource.set(_localDataSourceKey, settings.toJson());
    return settings;
  }

  @override
  Future<void> setSettings(
    VisitorSettingsEntity settings,
  ) =>
      _localDataSource.set(_localDataSourceKey, settings.toJson());

  @override
  Future<VisitorSettingsEntity> getSettings() async {
    final settingsJson = _localDataSource.get(_localDataSourceKey);
    return settingsJson != null
        ? VisitorSettingsEntity.fromJson(settingsJson)
        : await _initialize();
  }
}
