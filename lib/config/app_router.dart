import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/config/route.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/presentation/screens/oss_licenses_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_settings_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_stepper_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_welcome_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_beacon_list_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_beacon_settings_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_preview_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_home_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_settings_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_home_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter(
    this._user,
    this._permissionGuard,
    this._logger,
  ) : super();

  final UserEntity? _user;
  final PermissionGuard _permissionGuard;
  final Logger _logger;
  bool _initialized = false;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    if (_initialized) {
      _logger.i(
        'from ${router.currentPath} to ${resolver.route.path}\n'
        'as ${_user?.type}',
      );
      resolver.next();
    } else {
      _initialized = true;
      if (_user?.type == UserType.visitor) {
        _logger.i('redirect to visitor');
        await resolver.redirect(const VisitorHomeRoute());
      } else if (_user?.type == UserType.operator) {
        _logger.i('redirect to operator');
        await resolver.redirect(const OperatorHomeRoute());
      } else {
        _logger.i('default page');
        await resolver.redirect(const IntroductionWelcomeRoute());
      }
    }
  }

  @override
  List<RepaintRoute> get routes => [
        RepaintRoute(
          path: '/introduction/welcome',
          page: IntroductionWelcomeRoute.page,
          initial: true,
        ),
        RepaintRoute(
          path: '/introduction/stepper',
          page: IntroductionStepperRoute.page,
        ),
        RepaintRoute(
          path: '/introduction/qrcode_reader',
          page: IntroductionQRCodeReaderRoute.page,
          guards: [_permissionGuard],
        ),
        RepaintRoute(
          path: '/introduction/settings',
          page: IntroductionSettingsRoute.page,
        ),
        RepaintRoute(
          path: '/visitor/home',
          page: VisitorHomeRoute.page,
        ),
        RepaintRoute(
          path: '/visitor/qrcode_reader',
          page: VisitorQRCodeReaderRoute.page,
          guards: [_permissionGuard],
        ),
        RepaintRoute(
          path: '/visitor/settings',
          page: VisitorSettingsRoute.page,
        ),
        RepaintRoute(
          path: '/operator/home',
          page: OperatorHomeRoute.page,
        ),
        RepaintRoute(
          path: '/operator/qrcode_reader',
          page: OperatorQRCodeReaderRoute.page,
          guards: [_permissionGuard],
        ),
        RepaintRoute(
          path: '/operator/camera',
          page: OperatorCameraRoute.page,
          guards: [_permissionGuard],
        ),
        RepaintRoute(
          path: '/operator/camera/preview',
          page: OperatorCameraPreviewRoute.page,
          guards: [_permissionGuard],
        ),
        RepaintRoute(
          path: '/operator/beacon',
          page: OperatorBeaconListRoute.page,
          guards: [_permissionGuard],
        ),
        RepaintRoute(
          path: '/operator/beacon/settings',
          page: OperatorBeaconSettingsRoute.page,
          guards: [_permissionGuard],
        ),
        RepaintRoute(
          path: '/operator/settings',
          page: OperatorSettingsRoute.page,
        ),
        RepaintRoute(
          path: '/licenses',
          page: OssLicensesRoute.page,
        )
      ];
}
