import 'package:repaint_mobile/features/visitor/providers/settings_providers.dart';

class VisitorSettingsController {
  VisitorSettingsController(this._settings);

  final VisitorSettings _settings;

  Future<void> setSpotNotification(bool value) async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(spot: value),
    );
  }

  Future<void> setEventNotification(bool value) async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(event: value),
    );
  }

  Future<void> setOtherNotification(bool value) async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(other: value),
    );
  }

  Future<void> logout() async {
    _settings.clear();
  }
}
