import 'package:repaint_mobile/features/visitor/providers/settings_providers.dart';

class VisitorSettingsController {
  VisitorSettingsController(this._settings);

  final VisitorSettings _settings;

  Future<void> toggleSpotEntryNotification() async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(
        spotEntry: !notifications.spotEntry,
      ),
    );
  }

  Future<void> toggleEventAnnouncementNotification() async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(
        eventAnnouncement: !notifications.eventAnnouncement,
      ),
    );
  }

  Future<void> toggleOtherNotification() async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(
        other: !notifications.other,
      ),
    );
  }

  Future<void> logout() async {
    _settings.clear();
  }
}
