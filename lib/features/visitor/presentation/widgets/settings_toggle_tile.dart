import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';

class SettingsToggleTile extends StatelessWidget {
  const SettingsToggleTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SettingsTile(
      child: Row(
        children: [
          Text(title),
          const Spacer(),
          Switch(
            value: value,
            onChanged: (value) {},
            activeTrackColor: const Color(0xff49e400),
          )
        ],
      ),
    );
  }
}
