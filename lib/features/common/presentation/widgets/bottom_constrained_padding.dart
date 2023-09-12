import 'dart:io';

import 'package:flutter/material.dart';

class BottomConstrainedPadding extends StatelessWidget {
  const BottomConstrainedPadding({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Container(
        height: double.infinity,
        constraints: const BoxConstraints(maxHeight: 96.0),
      );
    } else {
      return const SizedBox(height: 32.0);
    }
  }
}
