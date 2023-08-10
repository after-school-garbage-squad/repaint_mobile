import 'package:flutter/material.dart';

class FlatIconButton extends StatelessWidget {
  const FlatIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: onPressed, icon: Icon(icon), iconSize: 32.0);
  }
}
