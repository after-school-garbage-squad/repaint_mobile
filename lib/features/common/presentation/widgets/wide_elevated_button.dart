import 'package:flutter/material.dart';

class WideElevatedButtonColors {
  const WideElevatedButtonColors({
    this.backgroundColor,
    this.shadowColor,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  });

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
    this.elevation = 1.0,
    this.elevationOnPressed = 3.0,
  });

  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final WideElevatedButtonColors? colors;
  final double elevation;
  final double elevationOnPressed;

  @override
  Widget build(BuildContext context) {
    final color = colors?.backgroundColor ??
        Theme.of(context).colorScheme.primaryContainer;

    return ConstrainedBox(
      constraints:
          const BoxConstraints(minWidth: double.infinity, minHeight: 48.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.grey.shade400,
          backgroundColor: color,
          surfaceTintColor: Colors.white,
          splashFactory: InkRipple.splashFactory,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ).merge(
          ButtonStyle(
            elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return elevationOnPressed;
              }
              return elevation;
            }),
          ),
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
