import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/common/infrastructures/datasources/local/local_data_source.dart';
import 'package:repaint_mobile/features/common/infrastructures/entities/result.dart';
import 'package:repaint_mobile/features/visitor/domain/entities/visitor_settings_entity.dart';
import 'package:repaint_mobile/features/visitor/domain/repositories/visitor_repository.dart';

class VisitorRepository extends VisitorRepositoryInterface {
  VisitorRepository(this._localDataSource, this._apiClient);

  final LocalDataSource _localDataSource;
  final RepaintApiClient _apiClient;

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

  @override
  Future<Either<Failure, Success<RegisterVisitor>>> joinEvent(
    JoinEventRequest joinEventRequest,
  ) async {
    try {
      final response = await _apiClient
          .getVisitorApi()
          .joinEvent(joinEventRequest: joinEventRequest);

      return Either.right(Success(response.data!.visitor));
    } on DioException catch (e) {
      return Either.left(Failure(e));
    }
  }
}
