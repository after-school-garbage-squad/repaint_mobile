import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/providers/user_providers.dart';

class OperatorSettingsController {
  const OperatorSettingsController(this._auth0, this._user);

  final Auth0 _auth0;
  final User _user;
  static final _logger = Logger("OperatorSettingsController");

  Future<void> onLogoutPressed(BuildContext context) async {
    try {
      await _auth0
          .webAuthentication(scheme: dotenv.env["AUTH0_SCHEME"])
          .logout();
    } catch (e) {
      _logger.severe(e);
    } finally {
      await _user.clear();
      _logger.info("logged out");
    }
  }

  void onLicensePressed(BuildContext context) {
    context.pushRoute(const OssLicensesRoute());
  }
}
