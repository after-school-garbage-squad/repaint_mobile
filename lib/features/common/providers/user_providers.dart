import 'package:logging/logging.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/infrastructures/datasources/local/local_data_source.dart';
import 'package:repaint_mobile/features/visitor/domain/entities/visitor_settings_entity.dart';
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
      _logger.info("user type: ${newUser.type}");
      return newUser;
    });
  }

  Future<void> clear() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      const value = CommonUserEntity();
      await _set(value);
      _logger.info("user type: ${value.type}");
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

  Future<void> register(String token, String eventId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await _get();
      final newUser = user.copyWith(token: token, eventId: eventId);
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
  dependencies: [
    localDataSource,
    CommonUser,
    fcmRegistrationToken,
    apiClient,
    VisitorUser,
  ],
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
      final apiClient = ref.read(apiClientProvider);
      final registrationId =
          await ref.read(fcmRegistrationTokenProvider.future);

      if (state.value?.visitor == null || registrationId == null) return;

      final response = await apiClient.getVisitorApi().initializeVisitor(
            visitorId: state.value!.visitor!.visitorIdentification.visitorId,
            joinEventRequest: JoinEventRequest(
              eventId: state.value!.visitor!.visitorIdentification.eventId,
              registrationId: registrationId,
            ),
          );

      if (response.data != null) {
        await ref.read(visitorUserProvider.notifier).update(
              (p0) => p0.copyWith(
                visitor: RegisterVisitor(
                  visitorIdentification:
                      response.data!.visitor.visitorIdentification,
                  registrationId: response.data!.visitor.registrationId,
                  palettes: response.data!.visitor.palettes,
                ),
                event: response.data!.event,
              ),
            );
        _isInitialized = true;
      }
    }
  }

  Future<void> register(JoinEvent200Response joinEvent) async {
    isImageRenewable = true;
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final user = await _get();
      final response =
          await ref.read(apiClientProvider).getVisitorApi().getCurrentImage(
                visitorId: joinEvent.visitor.visitorIdentification.visitorId,
                eventId: joinEvent.visitor.visitorIdentification.eventId,
              );
      final newUser = user.copyWith(
        visitor: joinEvent.visitor,
        event: joinEvent.event,
        imageId: response.data?.imageId,
      );
      await ref.read(commonUserProvider.notifier).set(UserType.visitor);
      await _set(newUser);
      return newUser;
    });
  }

  Future<void> setNotifications(
    VisitorNotifications Function(VisitorNotifications) update,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _set(
        state.value!.copyWith(
          settings: state.value!.settings.copyWith(
            notifications: update(state.value!.settings.notifications),
          ),
        ),
      );
    });
  }

  Future<void> updateImageUrl(
    String? Function(String?) update,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _set(
        state.value!.copyWith(
          imageUrl: update(state.value!.imageUrl),
        ),
      );
    });
  }

  Future<void> updateVisitor(
    RegisterVisitor Function(RegisterVisitor) update,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _set(
        state.value!.copyWith(
          visitor: update(state.value!.visitor!),
        ),
      );
    });
  }

  Future<void> updateEvent(
    Event Function(Event) update,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _set(
        state.value!.copyWith(
          event: update(state.value!.event!),
        ),
      );
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
