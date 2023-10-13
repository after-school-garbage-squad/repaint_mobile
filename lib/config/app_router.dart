import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/config/route.dart';
import 'package:repaint_mobile/features/common/domain/entities/user_entity.dart';
import 'package:repaint_mobile/features/common/presentation/screens/oss_licenses_detail_screen.dart';
import 'package:repaint_mobile/features/common/presentation/screens/oss_licenses_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_manual_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_settings_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_stepper_screen.dart';
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_welcome_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_beacon_list_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_beacon_settings_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_preview_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_event_list_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_home_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_settings_screen.dart';
import 'package:repaint_mobile/features/operator/presentation/screens/operator_stepper_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_home_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_images_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_qrcode_reader_screen.dart';
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_settings_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter implements AutoRouteGuard {
  AppRouter(
    this._user,
    this._permissionGuard,
  ) : super();

  final CommonUserEntity? _user;
  final PermissionGuard _permissionGuard;
  static final Logger _logger = Logger("AppRouter");
  bool _isInitialized = false;

  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final currentUserType = _user?.type.name.split('.').last;
    final nextUserPath = resolver.route.path.split('/').elementAtOrNull(1);
    final nextUserType =
        nextUserPath == 'introduction' ? 'unknown' : nextUserPath;
    _logger.info('user type: $currentUserType -> $nextUserType');

    if (_isInitialized ||
        currentUserType == nextUserType ||
        resolver.route.path == "/operator/stepper" ||
        resolver.route.path == "/operator/events" ||
        resolver.route.path.contains("/licenses")) {
      _logger.info(
        'from ${router.currentPath} to ${resolver.route.path} as ${_user?.type}',
      );
      resolver.next();
    } else {
      _isInitialized = true;
      if (_user?.type == UserType.visitor) {
        _logger.info('redirect to visitor');
        await resolver.redirect(const VisitorHomeRoute());
      } else if (_user?.type == UserType.operator) {
        _logger.info('redirect to operator');
        await resolver.redirect(const OperatorHomeRoute());
      } else {
        _logger.info('default page');
        await resolver.redirect(const IntroductionHomeRoute());
      }
    }
  }

  @override
  List<RepaintRoute> get routes => [
        RepaintRoute(
          path: '/introduction/home',
          page: IntroductionHomeRoute.page,
          initial: true,
        ),
        RepaintRoute(
          path: '/introduction/manual',
          page: IntroductionManualRoute.page,
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
          path: '/visitor/images',
          page: VisitorImagesRoute.page,
        ),
        RepaintRoute(
          path: '/visitor/settings',
          page: VisitorSettingsRoute.page,
        ),
        RepaintRoute(
          path: '/operator/stepper',
          page: OperatorStepperRoute.page,
        ),
        RepaintRoute(
          path: '/operator/home',
          page: OperatorHomeRoute.page,
        ),
        RepaintRoute(
          path: '/operator/events',
          page: OperatorEventListRoute.page,
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
        ),
        RepaintRoute(
          path: '/licenses/detail',
          page: OssLicensesDetailRoute.page,
        ),
      ];
}
