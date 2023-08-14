import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class SettingsScaffold extends StatelessWidget {
  const SettingsScaffold({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("設定"),
        centerTitle: true,
        leading: FlatIconButton(
          onPressed: context.popRoute,
          icon: Icons.chevron_left,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: children),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
