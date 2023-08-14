// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_explain_screen.dart'
    as _i1;
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_qrcode_reader_screen.dart'
    as _i2;
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_screen.dart'
    as _i3;
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_settings_screen.dart'
    as _i4;
import 'package:repaint_mobile/features/introduction/presentation/screens/introduction_welcome_screen.dart'
    as _i5;
import 'package:repaint_mobile/features/operator/presentation/screens/operator_beacon_list_screen.dart'
    as _i6;
import 'package:repaint_mobile/features/operator/presentation/screens/operator_beacon_settings_screen.dart'
    as _i7;
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_preview_screen.dart'
    as _i8;
import 'package:repaint_mobile/features/operator/presentation/screens/operator_camera_screen.dart'
    as _i9;
import 'package:repaint_mobile/features/operator/presentation/screens/operator_home_screen.dart'
    as _i10;
import 'package:repaint_mobile/features/operator/presentation/screens/operator_qrcode_reader_screen.dart'
    as _i11;
import 'package:repaint_mobile/features/operator/presentation/screens/operator_screen.dart'
    as _i12;
import 'package:repaint_mobile/features/operator/presentation/screens/operator_settings_screen.dart'
    as _i13;
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_home_screen.dart'
    as _i14;
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_qrcode_reader_screen.dart'
    as _i15;
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_screen.dart'
    as _i16;
import 'package:repaint_mobile/features/visitor/presentation/screens/visitor_settings_screen.dart'
    as _i17;

abstract class $AppRouter extends _i18.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i18.PageFactory> pagesMap = {
    IntroductionExplainRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.IntroductionExplainScreen(),
      );
    },
    IntroductionQRCodeReaderRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.IntroductionQRCodeReaderScreen(),
      );
    },
    IntroductionRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.IntroductionScreen(),
      );
    },
    IntroductionSettingsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.IntroductionSettingsScreen(),
      );
    },
    IntroductionWelcomeRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.IntroductionWelcomeScreen(),
      );
    },
    OperatorBeaconListRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.OperatorBeaconListScreen(),
      );
    },
    OperatorBeaconSettingsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.OperatorBeaconSettingsScreen(),
      );
    },
    OperatorCameraPreviewRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.OperatorCameraPreviewScreen(),
      );
    },
    OperatorCameraRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.OperatorCameraScreen(),
      );
    },
    OperatorHomeRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.OperatorHomeScreen(),
      );
    },
    OperatorQRCodeReaderRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.OperatorQRCodeReaderScreen(),
      );
    },
    OperatorRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.OperatorScreen(),
      );
    },
    OperatorSettingsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.OperatorSettingsScreen(),
      );
    },
    VisitorHomeRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.VisitorHomeScreen(),
      );
    },
    VisitorQRCodeReaderRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.VisitorQRCodeReaderScreen(),
      );
    },
    VisitorRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.VisitorScreen(),
      );
    },
    VisitorSettingsRoute.name: (routeData) {
      return _i18.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.VisitorSettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.IntroductionExplainScreen]
class IntroductionExplainRoute extends _i18.PageRouteInfo<void> {
  const IntroductionExplainRoute({List<_i18.PageRouteInfo>? children})
      : super(
          IntroductionExplainRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionExplainRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IntroductionQRCodeReaderScreen]
class IntroductionQRCodeReaderRoute extends _i18.PageRouteInfo<void> {
  const IntroductionQRCodeReaderRoute({List<_i18.PageRouteInfo>? children})
      : super(
          IntroductionQRCodeReaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionQRCodeReaderRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i3.IntroductionScreen]
class IntroductionRoute extends _i18.PageRouteInfo<void> {
  const IntroductionRoute({List<_i18.PageRouteInfo>? children})
      : super(
          IntroductionRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i4.IntroductionSettingsScreen]
class IntroductionSettingsRoute extends _i18.PageRouteInfo<void> {
  const IntroductionSettingsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          IntroductionSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionSettingsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i5.IntroductionWelcomeScreen]
class IntroductionWelcomeRoute extends _i18.PageRouteInfo<void> {
  const IntroductionWelcomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          IntroductionWelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionWelcomeRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i6.OperatorBeaconListScreen]
class OperatorBeaconListRoute extends _i18.PageRouteInfo<void> {
  const OperatorBeaconListRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OperatorBeaconListRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorBeaconListRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i7.OperatorBeaconSettingsScreen]
class OperatorBeaconSettingsRoute extends _i18.PageRouteInfo<void> {
  const OperatorBeaconSettingsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OperatorBeaconSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorBeaconSettingsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i8.OperatorCameraPreviewScreen]
class OperatorCameraPreviewRoute extends _i18.PageRouteInfo<void> {
  const OperatorCameraPreviewRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OperatorCameraPreviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorCameraPreviewRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OperatorCameraScreen]
class OperatorCameraRoute extends _i18.PageRouteInfo<void> {
  const OperatorCameraRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OperatorCameraRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorCameraRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i10.OperatorHomeScreen]
class OperatorHomeRoute extends _i18.PageRouteInfo<void> {
  const OperatorHomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OperatorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorHomeRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OperatorQRCodeReaderScreen]
class OperatorQRCodeReaderRoute extends _i18.PageRouteInfo<void> {
  const OperatorQRCodeReaderRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OperatorQRCodeReaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorQRCodeReaderRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i12.OperatorScreen]
class OperatorRoute extends _i18.PageRouteInfo<void> {
  const OperatorRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OperatorRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OperatorSettingsScreen]
class OperatorSettingsRoute extends _i18.PageRouteInfo<void> {
  const OperatorSettingsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          OperatorSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorSettingsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i14.VisitorHomeScreen]
class VisitorHomeRoute extends _i18.PageRouteInfo<void> {
  const VisitorHomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          VisitorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisitorHomeRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i15.VisitorQRCodeReaderScreen]
class VisitorQRCodeReaderRoute extends _i18.PageRouteInfo<void> {
  const VisitorQRCodeReaderRoute({List<_i18.PageRouteInfo>? children})
      : super(
          VisitorQRCodeReaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisitorQRCodeReaderRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i16.VisitorScreen]
class VisitorRoute extends _i18.PageRouteInfo<void> {
  const VisitorRoute({List<_i18.PageRouteInfo>? children})
      : super(
          VisitorRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisitorRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}

/// generated route for
/// [_i17.VisitorSettingsScreen]
class VisitorSettingsRoute extends _i18.PageRouteInfo<void> {
  const VisitorSettingsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          VisitorSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisitorSettingsRoute';

  static const _i18.PageInfo<void> page = _i18.PageInfo<void>(name);
}
