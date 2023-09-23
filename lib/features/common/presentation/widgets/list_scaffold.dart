import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';

class ListScaffold extends StatelessWidget {
  const ListScaffold({
    super.key,
    this.title = "設定",
    required this.scrollableChildren,
    this.bottomChildren = const [],
  });

  final String title;
  final List<Widget> scrollableChildren;
  final List<Widget> bottomChildren;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        overflow: TextOverflow.ellipsis,
      ),
      child: RepaintScaffold(
        title: title,
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
    );
  }
}
