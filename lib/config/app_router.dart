import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/permissions.dart';
import 'package:repaint_mobile/config/providers.dart';
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
  });

  final PermissionGuard permissionGuard;

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
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'camera',
              page: OperatorCameraRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'camera/preview',
              page: OperatorCameraPreviewRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'beacon',
              page: OperatorBeaconListRoute.page,
              transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
            ),
            CustomRoute(
              path: 'beacon/settings',
              page: OperatorBeaconSettingsRoute.page,
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

class PermissionGuard extends AutoRouteGuard {
  PermissionGuard(this._ref);

  final Ref _ref;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    await permissions.request();
    final permission = await _ref.refresh(checkPermissionProvider.future);

    if (permission) {
      resolver.next();
    } else {
      resolver.next(false);
      if (router.currentPath != '/introduction/welcome') {
        resolver.redirect(const IntroductionRoute(), replace: true);
      }
    }
  }
}
