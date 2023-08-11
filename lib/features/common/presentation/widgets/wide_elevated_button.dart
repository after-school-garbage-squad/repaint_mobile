import 'package:flutter/material.dart';

class WideElevatedButtonColors {
  const WideElevatedButtonColors({
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.iconColor,
  });

  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
}

class WideElevatedButton extends StatelessWidget {
  const WideElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.colors,
  });

  factory WideElevatedButton.template({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    required IconData icon,
    WideElevatedButtonColors? colors,
  }) = _WideElevatedButtonWithTemplate;

  final VoidCallback onPressed;
  final Widget child;
  final WideElevatedButtonColors? colors;

  @override
  Widget build(BuildContext context) {
    final borderColor =
        colors?.borderColor ?? Theme.of(context).colorScheme.primary;
    final backgroundColor = colors?.backgroundColor ??
        Theme.of(context).colorScheme.primaryContainer;

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
          elevation: 4.0,
        ),
        child: child,
      ),
    );
  }
}

class _WideElevatedButtonWithTemplate extends WideElevatedButton {
  _WideElevatedButtonWithTemplate({
    super.key,
    required super.onPressed,
    required this.text,
    this.icon,
    super.colors,
  }) : super(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _WideElevatedButtonText(text: text, colors: colors),
              if (icon != null) ...[
                const SizedBox(width: 8.0),
                Icon(icon, color: colors?.iconColor ?? Colors.black),
              ]
            ],
          ),
        );

  final String text;
  final IconData? icon;
}

class _WideElevatedButtonText extends StatelessWidget {
  const _WideElevatedButtonText({
    required this.text,
    required this.colors,
  });

  final String text;
  final WideElevatedButtonColors? colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: colors?.textColor ?? Colors.black),
    );
  }
}
