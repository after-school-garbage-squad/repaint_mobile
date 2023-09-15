import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    this.borderRadius,
  });

  final Widget child;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  factory SettingsTile.toggle({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SettingsTile(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: const Color(0xff49e400),
          ),
        ],
      ),
    );
  }

  factory SettingsTile.textField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
  }) {
    return SettingsTile(
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            padding: EdgeInsets.zero,
            onPressed: () => controller.clear(),
          ),
          suffixIconConstraints: BoxConstraints.tight(const Size.square(24.0)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(8.0),
        ),
        onChanged: onChanged,
        scrollPhysics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(12.0),
      ),
      child: Padding(padding: padding!, child: child),
    );
  }
}
