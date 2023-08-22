import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_explain_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_settings_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_welcome_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_beacon_list_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_beacon_settings_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_preview_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_home_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_settings_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_home_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter({
    required this.permissionGuard,
    required this.visitorGuard,
    required this.operatorGuard,
  });

  final PermissionGuard permissionGuard;
  final VisitorGuard visitorGuard;
  final OperatorGuard operatorGuard;

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
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'explain',
              page: IntroductionExplainRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              guards: [permissionGuard],
            ),
            CustomRoute(
              path: 'qrcode_reader',
              page: IntroductionQRCodeReaderRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
              guards: [permissionGuard],
            ),
            CustomRoute(
              path: 'settings',
              page: IntroductionSettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
          ],
        ),
        AutoRoute(
          path: '/visitor',
          page: VisitorRoute.page,
          guards: [visitorGuard],
          children: [
            CustomRoute(
              path: 'home',
              page: VisitorHomeRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'qrcode_reader',
              page: VisitorQRCodeReaderRoute.page,
              guards: [permissionGuard],
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'settings',
              page: VisitorSettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
          ],
        ),
        AutoRoute(
          path: '/operator',
          page: OperatorRoute.page,
          guards: [operatorGuard],
          children: [
            CustomRoute(
              path: 'home',
              page: OperatorHomeRoute.page,
              initial: true,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'qrcode_reader',
              page: OperatorQRCodeReaderRoute.page,
              guards: [permissionGuard],
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'camera',
              page: OperatorCameraRoute.page,
              guards: [permissionGuard],
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'camera/preview',
              page: OperatorCameraPreviewRoute.page,
              guards: [permissionGuard],
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'beacon',
              page: OperatorBeaconListRoute.page,
              guards: [permissionGuard],
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'beacon/settings',
              page: OperatorBeaconSettingsRoute.page,
              guards: [permissionGuard],
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'settings',
              page: OperatorSettingsRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
          ],
        ),
      ];
}
