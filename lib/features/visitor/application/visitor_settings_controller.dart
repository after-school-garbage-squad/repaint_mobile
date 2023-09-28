import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/providers/providers.dart';
import 'package:repaint_mobile/features/visitor/providers/settings_providers.dart';

class VisitorSettingsController {
  VisitorSettingsController(this._settings, this._user);

  final VisitorSettings _settings;
  final User _user;

  Future<void> onSpotNotificationChanged(bool value) async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(spot: value),
    );
  }

  Future<void> onEventNotificationChanged(bool value) async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(event: value),
    );
  }

  Future<void> onOtherNotificationChanged(bool value) async {
    await _settings.setNotifications(
      (notifications) => notifications?.copyWith(other: value),
    );
  }

  Future<void> onLogoutPressed(BuildContext context) async {
    await _settings.clear();
    await _user.clear();
  }

  void onLicensePressed(BuildContext context) {
    context.pushRoute(const OssLicensesRoute());
  }
}
