import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class CameraScaffold extends StatelessWidget {
  const CameraScaffold({
    super.key,
    required this.preview,
    this.children,
  });

  final Widget preview;
  final List<Widget>? children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: FlatIconButton(
          onPressed: context.popRoute,
          icon: Icons.chevron_left,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          preview,
          if (children != null)
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 294),
              child: Column(children: children!),
            ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
    );
  }
}
