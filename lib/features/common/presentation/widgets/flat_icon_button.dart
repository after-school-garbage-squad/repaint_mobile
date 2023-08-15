import 'package:flutter/material.dart';

class FlatIconButtonColors {
  const FlatIconButtonColors({
    this.borderColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
  });

  final Color? borderColor;
  final Color? backgroundColor;
}

class FlatIconButton extends StatelessWidget {
  const FlatIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 32.0,
    this.colors = const FlatIconButtonColors(),
    this.elevation = 0.0,
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
      iconSize: iconSize,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(colors!.backgroundColor!),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          CircleBorder(side: BorderSide(color: colors!.borderColor!)),
        ),
        elevation: MaterialStateProperty.all<double>(elevation!),
      ),
    );
  }
}
