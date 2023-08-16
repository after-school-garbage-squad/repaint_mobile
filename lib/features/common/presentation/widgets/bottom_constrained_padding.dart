import 'package:flutter/material.dart';

class BottomConstrainedPadding extends StatelessWidget {
  const BottomConstrainedPadding({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(constraints: const BoxConstraints(minHeight: 96.0));
  }
}
