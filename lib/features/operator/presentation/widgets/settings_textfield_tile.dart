import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';

class SettingsTextFieldTile extends StatelessWidget {
  const SettingsTextFieldTile({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.onChanged,
  });

  final String label;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.text,
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
}
