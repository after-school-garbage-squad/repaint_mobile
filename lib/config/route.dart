import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

@immutable
class RepaintRoute extends CustomRoute {
  RepaintRoute({
    required super.page,
    super.fullscreenDialog,
    super.maintainState,
    super.fullMatch = false,
    super.guards,
    super.usesPathAsKey = false,
    super.children,
    super.meta = const {},
    super.title,
    super.path,
    super.keepHistory,
    super.initial,
    super.allowSnapshotting = true,
    super.transitionsBuilder = TransitionsBuilders.slideLeft,
    super.customRouteBuilder,
    super.durationInMilliseconds = 200,
    super.reverseDurationInMilliseconds = 200,
    super.opaque = true,
    super.barrierDismissible = false,
    super.barrierLabel,
    super.restorationId,
    super.barrierColor = CupertinoColors.systemGrey,
  });
}
