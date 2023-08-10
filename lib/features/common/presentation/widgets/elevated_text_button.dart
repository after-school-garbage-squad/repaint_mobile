import 'package:flutter/material.dart';

class ElevatedTextButtonColors {
  const ElevatedTextButtonColors({
    this.borderColor,
    this.backgroundColor,
    this.textColor,
  });

  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
}

class ElevatedTextButton extends StatelessWidget {
  const ElevatedTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.colors,
  });

  final VoidCallback onPressed;
  final String text;
  final ElevatedTextButtonColors? colors;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        colors?.borderColor ?? Theme.of(context).colorScheme.primary;
    final backgroundColor = colors?.backgroundColor ??
        Theme.of(context).colorScheme.primaryContainer;
    final textColor = colors?.textColor ?? Colors.black;

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
          elevation: 4.0,
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
