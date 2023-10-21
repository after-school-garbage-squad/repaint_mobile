import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';
import 'package:repaint_mobile/features/common/providers/user_providers.dart';

class OperatorSettingsController {
  const OperatorSettingsController(this._auth0, this._user);

  final Auth0 _auth0;
  final OperatorUser _user;
  static final _logger = Logger("OperatorSettingsController");

  Future<void> onLogoutPressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_logout_pressed');
    try {
      await _auth0
          .webAuthentication(scheme: dotenv.env["AUTH0_SCHEME"])
          .logout();
      await _user.clear();
      _logger.info("logged out");
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("ログアウトに失敗しました"),
            action: SnackBarAction(
              label: "再試行",
              onPressed: () => onLogoutPressed(context),
            ),
          ),
        );
      }
    }
  }

  Future<void> onLicensePressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_license_pressed');
    if (context.mounted) {
      context.pushRoute(const OssLicensesRoute());
    }
  }
}
