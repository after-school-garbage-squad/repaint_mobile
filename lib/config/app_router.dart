import 'package:auto_route/auto_route.dart';
import 'package:repaint_mobile/config/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          page: IntroductionRoute.page,
          initial: true,
          children: [
            CustomRoute(
              path: 'welcome',
              page: WelcomeRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'explain',
              page: ExplainRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'qrcode',
              page: QRCodeReaderRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'settings',
              page: IntroductionSettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            )
          ],
        )
      ];
}
