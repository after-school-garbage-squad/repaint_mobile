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
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            const SizedBox(width: 16.0),
            FlatIconButton(
              onPressed: onBackPressed ?? context.popRoute,
              icon: Icons.chevron_left,
            ),
          ],
        ),
        leadingWidth: 64.0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          preview,
          if (children != null)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 294),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                child: Column(
                  children: [
                    ...children!,
                    const BottomConstrainedPadding(),
                  ],
                ),
              ),
            ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
    );
  }
}
