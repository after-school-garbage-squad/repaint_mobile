import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';

class ListScaffold extends StatelessWidget {
  const ListScaffold({
    super.key,
    this.title = "設定",
    required this.scrollableChildren,
    this.bottomChildren = const [],
  });

  final String? title;
  final List<Widget> scrollableChildren;
  final List<Widget> bottomChildren;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title!),
          centerTitle: true,
          leading: Row(
            children: [
              const SizedBox(width: 16.0),
              FlatIconButton(
                onPressed: context.popRoute,
                icon: Icons.chevron_left,
              ),
            ],
          ),
          leadingWidth: 64.0,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...scrollableChildren,
                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
              ...bottomChildren,
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
