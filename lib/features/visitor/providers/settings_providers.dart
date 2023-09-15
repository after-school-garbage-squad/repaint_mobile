import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/visitor/domain/entities/visitor_settings_entity.dart';
import 'package:repaint_mobile/features/visitor/providers/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_providers.g.dart';

@Riverpod(keepAlive: true, dependencies: [visitorRepository])
class VisitorSettings extends _$VisitorSettings {
  @override
  FutureOr<VisitorSettingsEntity> build() async {
    final visitorSettings = await _get();
    ref.read(loggerProvider).d('VisitorSettings initialized: $visitorSettings');
    return visitorSettings;
  }

  Future<VisitorSettingsEntity> _get() async {
    final visitorRepository = await ref.read(visitorRepositoryProvider.future);
    return visitorRepository.getSettings();
  }

  Future<VisitorSettingsEntity> _set(
    VisitorSettingsEntity visitorSettings,
  ) async {
    final visitorRepository = await ref.read(visitorRepositoryProvider.future);
    await visitorRepository.setSettings(visitorSettings);
    return visitorSettings;
  }

  Future<void> setNotifications(
    VisitorNotifications? Function(VisitorNotifications?) update,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _set(
        state.value?.copyWith(
              notifications: update(state.value?.notifications) ??
                  const VisitorNotifications(),
            ) ??
            const VisitorSettingsEntity(),
      );
    });
  }

  Future<void> clear() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() {
      return _set(const VisitorSettingsEntity());
    });
  }
}
