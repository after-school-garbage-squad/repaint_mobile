import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';

class OperatorEventListController {
  const OperatorEventListController(this._user);

  final OperatorUser _user;

  Future<void> onEventItemPressed(
    BuildContext context,
    String token,
    String eventId,
  ) async {
    await _user.register(token, eventId);
    if (context.mounted) {
      context.replaceRoute(const OperatorHomeRoute());
    }
  }
}
