import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class CameraScaffold extends StatelessWidget {
  const CameraScaffold({
    super.key,
    required this.preview,
    this.onBackPressed,
    this.children,
  });

  final Widget preview;
  final VoidCallback? onBackPressed;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      maxLines: 1,
      softWrap: false,
      style: Theme.of(context).textTheme.bodyMedium!,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: FlatIconButton(
              onPressed: onBackPressed ?? context.popRoute,
              icon: Icons.chevron_left,
              colors: const FlatIconButtonColors(
                backgroundColor: Colors.white,
                shadowColor: Colors.black,
              ),
            ),
          ),
          leadingWidth: 64.0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(child: preview),
            if (children != null) ...[
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: children!,
                ),
              ),
              const BottomConstrainedPadding(),
            ],
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        extendBodyBehindAppBar: true,
      ),
    );
  }
}
