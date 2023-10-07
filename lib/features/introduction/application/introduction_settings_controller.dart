import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:repaint_mobile/config/app_router.dart';

class IntroductionSettingsController {
  const IntroductionSettingsController(this._auth0);

  final Auth0 _auth0;
  static final _logger = Logger("IntroductionSettingsController");

  Future<void> onLoginPressed(BuildContext context) async {
    try {
      final credential = await _auth0
          .webAuthentication(scheme: dotenv.env["AUTH0_SCHEME"])
          .login();
      _logger.info("accessToken: ${credential.accessToken}");
      _logger.info("idToken: ${credential.idToken}");
      _logger.info("refreshToken: ${credential.refreshToken}");
      if (context.mounted) {
        await context
            .pushRoute(OperatorEventListRoute(token: credential.idToken));
      }
    } catch (e) {
      _logger.warning(e.toString());
    }
  }

  void onLicensePressed(BuildContext context) {
    context.pushRoute(const OssLicensesRoute());
  }
}
