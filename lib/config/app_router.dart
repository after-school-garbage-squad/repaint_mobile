import 'package:auto_route/auto_route.dart';
import 'package:repaint_mobile/config/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/introduction',
          page: IntroductionRoute.page,
          initial: true,
          children: [
            CustomRoute(
              path: 'welcome',
              page: IntroductionWelcomeRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'explain',
              page: IntroductionExplainRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'qrcode_reader',
              page: IntroductionQRCodeReaderRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'settings',
              page: IntroductionSettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            )
          ],
        ),
        AutoRoute(
          path: '/visitor',
          page: VisitorRoute.page,
          children: [
            CustomRoute(
              path: 'home',
              page: VisitorHomeRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'qrcode_reader',
              page: VisitorQRCodeReaderRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'settings',
              page: VisitorSettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
          ],
        ),
        AutoRoute(
          path: '/operator',
          page: OperatorRoute.page,
          children: [
            CustomRoute(
              path: 'home',
              page: OperatorHomeRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'qrcode_reader',
              page: OperatorQRCodeReaderRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'camera',
              page: OperatorCameraRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'camera/preview',
              page: OperatorCameraPreviewRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'beacon',
              page: OperatorBeaconListRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'beacon/settings',
              page: OperatorBeaconSettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
            CustomRoute(
              path: 'settings',
              page: OperatorSettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeft,
            ),
          ],
        )
      ];
}
