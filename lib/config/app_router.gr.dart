// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    IntroductionExplainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IntroductionExplainScreen(),
      );
    },
    IntroductionQRCodeReaderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IntroductionQRCodeReaderScreen(),
      );
    },
    IntroductionSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IntroductionSettingsScreen(),
      );
    },
    IntroductionWelcomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: IntroductionWelcomeScreen(),
      );
    },
    OperatorBeaconListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperatorBeaconListScreen(),
      );
    },
    OperatorBeaconSettingsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<OperatorBeaconSettingsRouteArgs>(
          orElse: () => OperatorBeaconSettingsRouteArgs(
              beaconId: pathParams.getString('beaconId')));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperatorBeaconSettingsScreen(
          key: args.key,
          beaconId: args.beaconId,
        ),
      );
    },
    OperatorCameraPreviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperatorCameraPreviewScreen(),
      );
    },
    OperatorCameraRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperatorCameraScreen(),
      );
    },
    OperatorHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperatorHomeScreen(),
      );
    },
    OperatorQRCodeReaderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperatorQRCodeReaderScreen(),
      );
    },
    OperatorSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OperatorSettingsScreen(),
      );
    },
    VisitorHomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VisitorHomeScreen(),
      );
    },
    VisitorQRCodeReaderRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VisitorQRCodeReaderScreen(),
      );
    },
    VisitorSettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: VisitorSettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [IntroductionExplainScreen]
class IntroductionExplainRoute extends PageRouteInfo<void> {
  const IntroductionExplainRoute({List<PageRouteInfo>? children})
      : super(
          IntroductionExplainRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionExplainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroductionQRCodeReaderScreen]
class IntroductionQRCodeReaderRoute extends PageRouteInfo<void> {
  const IntroductionQRCodeReaderRoute({List<PageRouteInfo>? children})
      : super(
          IntroductionQRCodeReaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionQRCodeReaderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroductionSettingsScreen]
class IntroductionSettingsRoute extends PageRouteInfo<void> {
  const IntroductionSettingsRoute({List<PageRouteInfo>? children})
      : super(
          IntroductionSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [IntroductionWelcomeScreen]
class IntroductionWelcomeRoute extends PageRouteInfo<void> {
  const IntroductionWelcomeRoute({List<PageRouteInfo>? children})
      : super(
          IntroductionWelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'IntroductionWelcomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OperatorBeaconListScreen]
class OperatorBeaconListRoute extends PageRouteInfo<void> {
  const OperatorBeaconListRoute({List<PageRouteInfo>? children})
      : super(
          OperatorBeaconListRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorBeaconListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OperatorBeaconSettingsScreen]
class OperatorBeaconSettingsRoute
    extends PageRouteInfo<OperatorBeaconSettingsRouteArgs> {
  OperatorBeaconSettingsRoute({
    Key? key,
    required String beaconId,
    List<PageRouteInfo>? children,
  }) : super(
          OperatorBeaconSettingsRoute.name,
          args: OperatorBeaconSettingsRouteArgs(
            key: key,
            beaconId: beaconId,
          ),
          rawPathParams: {'beaconId': beaconId},
          initialChildren: children,
        );

  static const String name = 'OperatorBeaconSettingsRoute';

  static const PageInfo<OperatorBeaconSettingsRouteArgs> page =
      PageInfo<OperatorBeaconSettingsRouteArgs>(name);
}

class OperatorBeaconSettingsRouteArgs {
  const OperatorBeaconSettingsRouteArgs({
    this.key,
    required this.beaconId,
  });

  final Key? key;

  final String beaconId;

  @override
  String toString() {
    return 'OperatorBeaconSettingsRouteArgs{key: $key, beaconId: $beaconId}';
  }
}

/// generated route for
/// [OperatorCameraPreviewScreen]
class OperatorCameraPreviewRoute extends PageRouteInfo<void> {
  const OperatorCameraPreviewRoute({List<PageRouteInfo>? children})
      : super(
          OperatorCameraPreviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorCameraPreviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OperatorCameraScreen]
class OperatorCameraRoute extends PageRouteInfo<void> {
  const OperatorCameraRoute({List<PageRouteInfo>? children})
      : super(
          OperatorCameraRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorCameraRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OperatorHomeScreen]
class OperatorHomeRoute extends PageRouteInfo<void> {
  const OperatorHomeRoute({List<PageRouteInfo>? children})
      : super(
          OperatorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OperatorQRCodeReaderScreen]
class OperatorQRCodeReaderRoute extends PageRouteInfo<void> {
  const OperatorQRCodeReaderRoute({List<PageRouteInfo>? children})
      : super(
          OperatorQRCodeReaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorQRCodeReaderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OperatorSettingsScreen]
class OperatorSettingsRoute extends PageRouteInfo<void> {
  const OperatorSettingsRoute({List<PageRouteInfo>? children})
      : super(
          OperatorSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'OperatorSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VisitorHomeScreen]
class VisitorHomeRoute extends PageRouteInfo<void> {
  const VisitorHomeRoute({List<PageRouteInfo>? children})
      : super(
          VisitorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisitorHomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VisitorQRCodeReaderScreen]
class VisitorQRCodeReaderRoute extends PageRouteInfo<void> {
  const VisitorQRCodeReaderRoute({List<PageRouteInfo>? children})
      : super(
          VisitorQRCodeReaderRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisitorQRCodeReaderRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [VisitorSettingsScreen]
class VisitorSettingsRoute extends PageRouteInfo<void> {
  const VisitorSettingsRoute({List<PageRouteInfo>? children})
      : super(
          VisitorSettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'VisitorSettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
