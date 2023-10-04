import 'package:flutter/material.dart';

class ProgressBarColors {
  const ProgressBarColors({
    this.backgroundColor,
    this.foregroundColor,
  });

  final Color? backgroundColor;
  final Color? foregroundColor;
}

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.progress, this.colors});

  final double progress;
  final ProgressBarColors? colors;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        colors?.backgroundColor ?? Theme.of(context).colorScheme.surface;
    final foregroundColor =
        colors?.foregroundColor ?? Theme.of(context).colorScheme.secondary;

    return SizedBox(
      height: 20.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: LinearProgressIndicator(
          value: progress,
          backgroundColor: backgroundColor,
          valueColor: AlwaysStoppedAnimation<Color>(foregroundColor),
        ),
      ),
    );
  }
}
