import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class QRCodeReaderScaffold extends StatelessWidget {
  const QRCodeReaderScaffold({
    super.key,
    required this.child,
  });

  final Widget child;

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
          // TODO: カメラを実装する
          const Expanded(
            child: Placeholder(),
          ),
          child,
          ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 96.0),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBodyBehindAppBar: true,
    );
  }
}
