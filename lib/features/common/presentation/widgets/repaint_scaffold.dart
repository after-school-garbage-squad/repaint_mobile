import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class RepaintScaffold extends StatelessWidget {
  const RepaintScaffold({
    this.title,
    required this.child,
    this.isBackButtonVisible = true,
    this.action,
    this.padding = const EdgeInsets.all(16),
  });

  final String? title;
  final Widget child;
  final bool isBackButtonVisible;
  final Widget? action;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: title != null ? Text(title!) : null,
        automaticallyImplyLeading: false,
        leading: isBackButtonVisible
            ? Row(
                children: [
                  const SizedBox(width: 16.0),
                  FlatIconButton(
                    onPressed: context.popRoute,
                    icon: Icons.chevron_left,
                  ),
                ],
              )
            : null,
        actions: action != null
            ? [
                action!,
                // https://github.com/flutter/flutter/issues/118965
                const SizedBox(width: 16.0),
              ]
            : null,
        leadingWidth: 64.0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: padding,
        child: child,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
