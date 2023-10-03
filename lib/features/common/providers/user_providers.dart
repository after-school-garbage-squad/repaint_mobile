import 'package:logging/logging.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/infrastructures/datasources/local/local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [localDataSource])
class CommonUser extends _$CommonUser {
  static const _localDataSourceKey = 'common';
  static final _logger = Logger("CommonUserProvider");

  @override
  FutureOr<CommonUserEntity> build() async {
    final user = await _get();
    _logger.info('initialized: $user');
    return user;
  }

  Future<CommonUserEntity> _initialize(
    LocalDataSource localDataSource,
  ) async {
    const user = CommonUserEntity();
    await localDataSource.set(_localDataSourceKey, user.toJson());
    return user;
  }

  Future<CommonUserEntity> _get() async {
    final localDataSource = await ref.read(localDataSourceProvider.future);
    final userJson = localDataSource.get(_localDataSourceKey);

    if (userJson != null) {
      return CommonUserEntity.fromJson(userJson);
    } else {
      return _initialize(localDataSource);
    }
  }

  Future<CommonUserEntity> _set(CommonUserEntity user) async {
    final localDataSource = await ref.read(localDataSourceProvider.future);
    await localDataSource.set(_localDataSourceKey, user.toJson());
    return user;
  }

  Future<void> set(UserType type) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await _get();
      final newUser = user.copyWith(type: type);
      await _set(newUser);
      return newUser;
    });
  }

  Future<void> clear() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      const value = CommonUserEntity();
      await _set(value);
      return value;
    });
  }
}

@Riverpod(keepAlive: true, dependencies: [localDataSource, CommonUser])
class OperatorUser extends _$OperatorUser {
  static const _localDataSourceKey = 'operator';
  static final _logger = Logger("OperatorUserProvider");

  @override
  FutureOr<OperatorUserEntity> build() async {
    final user = await _get();
    _logger.info('initialized: $user');
    return user;
  }

  Future<OperatorUserEntity> _initialize(
    LocalDataSource localDataSource,
  ) async {
    const user = OperatorUserEntity();
    await localDataSource.set(_localDataSourceKey, user.toJson());
    return user;
  }

  Future<OperatorUserEntity> _get() async {
    final localDataSource = await ref.read(localDataSourceProvider.future);
    final userJson = localDataSource.get(_localDataSourceKey);

    if (userJson != null) {
      return OperatorUserEntity.fromJson(userJson);
    } else {
      return _initialize(localDataSource);
    }
  }

  Future<OperatorUserEntity> _set(OperatorUserEntity user) async {
    final localDataSource = await ref.read(localDataSourceProvider.future);
    await localDataSource.set(_localDataSourceKey, user.toJson());
    return user;
  }

  Future<void> register(String operatorToken) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await _get();
      final newUser = user.copyWith(
        operatorToken: operatorToken,
        operatorEventId: "01HBRF13Q0J3HP66P8747ZVVF0", // TODO: 仮の値
      );
      await ref.read(commonUserProvider.notifier).set(UserType.operator);
      await _set(newUser);
      return newUser;
    });
  }

  Future<void> clear() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      const value = OperatorUserEntity();
      await ref.read(commonUserProvider.notifier).clear();
      await _set(value);
      return value;
    });
  }
}

@Riverpod(
  keepAlive: true,
  dependencies: [localDataSource, CommonUser, fcmRegistrationToken],
)
class VisitorUser extends _$VisitorUser {
  static const _localDataSourceKey = 'visitor';
  static final _logger = Logger("VisitorUserProvider");

  bool _isInitialized = false;

  @override
  FutureOr<VisitorUserEntity> build() async {
    final user = await _get();
    _logger.info('initialized: $user');
    return user;
  }

  Future<VisitorUserEntity> _initialize(LocalDataSource localDataSource) async {
    const user = VisitorUserEntity();
    await localDataSource.set(_localDataSourceKey, user.toJson());
    return user;
  }

  Future<VisitorUserEntity> _get() async {
    final localDataSource = await ref.read(localDataSourceProvider.future);
    final userJson = localDataSource.get(_localDataSourceKey);

    if (userJson != null) {
      return VisitorUserEntity.fromJson(userJson);
    } else {
      return _initialize(localDataSource);
    }
  }

  Future<VisitorUserEntity> _set(VisitorUserEntity user) async {
    final localDataSource = await ref.read(localDataSourceProvider.future);
    await localDataSource.set(_localDataSourceKey, user.toJson());
    return user;
  }

  Future<void> initialize() async {
    if (!_isInitialized) {
      final apiClient = ref.watch(apiClientProvider);
      final registrationId =
          await ref.watch(fcmRegistrationTokenProvider.future);

      if (state.value?.visitorIdentification == null ||
          state.value?.registrationId == null ||
          registrationId == null) return;

      apiClient.getVisitorApi().initializeVisitor(
            visitorID: state.value!.visitorIdentification!.visitorId,
            joinEventRequest: JoinEventRequest(
              eventId: state.value!.visitorIdentification!.eventId,
              registrationId: registrationId,
            ),
          );
      _isInitialized = true;
    }
  }

  Future<void> register(RegisterVisitor registerVisitor) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await _get();
      final newUser = user.copyWith(
        visitorIdentification: registerVisitor.visitorIdentification,
        registrationId: registerVisitor.registrationId,
        palettes: registerVisitor.palettes,
      );
      await ref.read(commonUserProvider.notifier).set(UserType.visitor);
      await _set(newUser);
      return newUser;
    });
  }

  Future<void> clear() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      const value = VisitorUserEntity();
      await ref.read(commonUserProvider.notifier).clear();
      await _set(value);
      return value;
    });
  }
}
