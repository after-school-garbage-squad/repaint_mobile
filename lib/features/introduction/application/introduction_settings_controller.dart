import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/common/providers/firebase_providers.dart';
import 'package:url_launcher/url_launcher_string.dart';

class IntroductionSettingsController {
  const IntroductionSettingsController(this._auth0);

  final Auth0 _auth0;
  static final _logger = Logger("IntroductionSettingsController");

  Future<void> onWebConsoleLoginPressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_web_login_pressed');
    await launchUrlString("https://console.asgs.dev");
  }

  Future<void> onMobileLoginPressed(BuildContext context) async {
    await analytics.logEvent(name: 'operator_mobile_login_pressed');
    final futures = PermissionGuard.permissions
        .map((element) => element.isGranted)
        .toList();
    await Future.wait(futures)
        .then((value) => value.every((element) => element))
        .then(
      (value) async {
        if (value) {
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
        } else {
          context.pushRoute(const OperatorStepperRoute());
        }
      },
    );
  }

  Future<void> onLicensePressed(BuildContext context) async {
    await analytics.logEvent(name: 'introduction_license_pressed');
    if (context.mounted) {
      context.pushRoute(const OssLicensesRoute());
    }
  }
}
