import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height = 40.0,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(padding: padding!, child: child),
    );
  }
}
