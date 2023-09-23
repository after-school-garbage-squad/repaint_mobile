import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';

class IntroductionSettingsController {
  const IntroductionSettingsController(this._user);

  final User _user;

  Future<void> onLoginPressed(BuildContext context) async {
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
