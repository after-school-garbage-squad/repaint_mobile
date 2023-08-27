import 'package:flutter/material.dart';

class WideElevatedButtonColors {
  const WideElevatedButtonColors({
    this.borderColor,
    this.backgroundColor,
    this.shadowColor,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  });

  final Color? borderColor;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? textColor;
  final Color? iconColor;
}

class WideElevatedButton extends StatelessWidget {
  const WideElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.colors,
    this.elevation = 2.0,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final WideElevatedButtonColors? colors;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        colors?.borderColor ?? Theme.of(context).colorScheme.primary;
    final backgroundColor = colors?.backgroundColor ??
        Theme.of(context).colorScheme.primaryContainer;
    final shadowColor = colors?.shadowColor ?? Theme.of(context).shadowColor;

    return ConstrainedBox(
      constraints:
          const BoxConstraints(minWidth: double.infinity, minHeight: 48.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(8.0),
          ),
          surfaceTintColor: Colors.white,
          elevation: elevation,
          shadowColor: shadowColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: colors?.textColor),
            ),
            if (icon != null) ...[
              const SizedBox(width: 8.0),
              Icon(icon, color: colors?.iconColor),
            ],
          ],
        ),
      ),
    );
  }
}
