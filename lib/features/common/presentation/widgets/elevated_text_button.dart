import 'package:flutter/material.dart';

class ElevatedTextButton extends StatelessWidget {
  const ElevatedTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderColor,
    this.textColor,
  });

  final VoidCallback onPressed;
  final String text;
  final Color? borderColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
          const BoxConstraints(minWidth: double.infinity, minHeight: 48.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor ?? Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: textColor ?? Colors.black),
        ),
      ),
    );
  }
}
