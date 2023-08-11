import 'package:flutter/material.dart';

class ActionElevatedButtonColors {
  const ActionElevatedButtonColors({
    this.borderColor,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.iconColor = Colors.black,
  });

  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
}

class ActionElevatedButton extends StatelessWidget {
  const ActionElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
    this.colors,
  }) : super();

  final VoidCallback onPressed;
  final String text;
  final IconData icon;
  final ActionElevatedButtonColors? colors;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        colors?.borderColor ?? Theme.of(context).colorScheme.primary;
    final backgroundColor = colors?.backgroundColor ??
        Theme.of(context).colorScheme.primaryContainer;
    final borderSide = BorderSide(color: borderColor);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: borderSide,
            borderRadius: BorderRadius.circular(8.0),
          ),
          surfaceTintColor: Colors.white,
          elevation: 4.0,
          padding: EdgeInsets.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Icon(icon, color: colors?.iconColor, size: 80.0),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 40.0),
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(minHeight: 40.0),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  border: Border(top: borderSide),
                ),
                child: Text(text, style: TextStyle(color: colors?.textColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
