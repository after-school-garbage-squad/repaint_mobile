import 'package:auto_route/auto_route.dart';
import 'package:repaint_mobile/config/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: MyHomePage.page,
          initial: true,
        )
      ];
}
