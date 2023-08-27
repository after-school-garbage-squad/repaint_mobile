import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/infrastructures/datasources/local/local_data_source.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [localDataSource])
class User extends _$User {
  static const _localDataSourceKey = 'user';
  @override
  FutureOr<UserEntity> build() async {
    final user = await _get();
    ref.read(loggerProvider).d('User initialized: $user');
    return user;
  }

  Future<UserEntity> _initialize(LocalDataSource localDataSource) async {
    const user = UserEntity();
    await localDataSource.set(_localDataSourceKey, user.toJson());
    return user;
  }

  Future<UserEntity> _get() async {
    final localDataSource = await ref.read(localDataSourceProvider.future);
    final userJson = localDataSource.get(_localDataSourceKey);

    if (userJson != null) {
      return UserEntity.fromJson(userJson);
    } else {
      return _initialize(localDataSource);
    }
  }

  Future<UserEntity> _set(UserEntity user) async {
    final localDataSource = await ref.read(localDataSourceProvider.future);
    await localDataSource.set(_localDataSourceKey, user.toJson());
    return user;
  }

  Future<void> setType(UserType type) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _set(state.value!.copyWith(type: type)));
  }

  Future<void> clear() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      const value = UserEntity();
      await _set(value);
      return value;
    });
  }
}
