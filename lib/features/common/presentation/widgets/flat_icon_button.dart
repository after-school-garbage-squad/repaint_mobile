import 'package:flutter/material.dart';

class FlatIconButtonColors {
  const FlatIconButtonColors({
    this.borderColor,
    this.backgroundColor,
  });

  final Color? borderColor;
  final Color? backgroundColor;
}

class FlatIconButton extends StatelessWidget {
  const FlatIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize,
    this.colors,
    this.elevation,
  });

  final VoidCallback onPressed;
  final IconData icon;
  final double? iconSize;
  final FlatIconButtonColors? colors;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      onPressed: onPressed,
      icon: Icon(icon),
      iconSize: iconSize ?? 32.0,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          colors?.backgroundColor ?? Colors.transparent,
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          CircleBorder(
            side: BorderSide(
              color: colors?.borderColor ?? Colors.transparent,
            ),
          ),
        ),
        elevation: MaterialStateProperty.all<double>(elevation ?? 0.0),
      ),
    );
  }
}
