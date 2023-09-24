import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/providers/user_providers.dart';

class OperatorSettingsController {
  const OperatorSettingsController(this._user);

  final User _user;

  void onLogoutPressed(BuildContext context) {
    // TODO: ログアウト処理を実装する
    _user.setType(UserType.unknown);
    if (context.mounted) {
      context.router.pushAndPopUntil(
        const IntroductionWelcomeRoute(),
        predicate: (_) => false,
      );
    }
  }

  void onLicensePressed(BuildContext context) {
    context.pushRoute(const OssLicensesRoute());
  }
}
