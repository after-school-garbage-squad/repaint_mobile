import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logging/logging.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';

class IntroductionSettingsController {
  const IntroductionSettingsController(this._auth0, this._user);

  final Auth0 _auth0;
  final User _user;
  static final _logger = Logger("IntroductionSettingsController");

  Future<void> onLoginPressed(BuildContext context) async {
    final credential = await _auth0
        .webAuthentication(scheme: dotenv.env["AUTH0_SCHEME"])
        .login();
    _logger.info("credential: ${credential.user.name}");
    // TODO: Auth0の管理者ログイン画面に遷移する
    await _user.setType(UserType.operator);
    if (context.mounted) {
      context.router.pushAndPopUntil(
        const OperatorHomeRoute(),
        predicate: (_) => false,
      );
    }
  }

  void onLicensePressed(BuildContext context) {
    context.pushRoute(const OssLicensesRoute());
  }
}
