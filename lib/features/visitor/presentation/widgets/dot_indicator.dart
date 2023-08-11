import 'package:flutter/material.dart';

class DotIndicatorColors {
  const DotIndicatorColors({
    this.disabledColor,
    this.enabledColor,
  });

  final Color? disabledColor;
  final Color? enabledColor;
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.onPressed,
    this.colors,
    this.enabled,
  });

  final VoidCallback onPressed;
  final DotIndicatorColors? colors;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    final disabledColor =
        colors?.disabledColor ?? Theme.of(context).colorScheme.surface;
    final enabledColor =
        colors?.enabledColor ?? Theme.of(context).colorScheme.primaryContainer;

    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: enabled == true ? enabledColor : disabledColor,
        ),
      ),
    );
  }
}
