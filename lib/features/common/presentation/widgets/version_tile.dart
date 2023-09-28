import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/settings_tile.dart';

class VersionTile extends StatelessWidget {
  const VersionTile({
    super.key,
    required this.packageInfo,
  });

  final PackageInfo? packageInfo;

  @override
  Widget build(BuildContext context) {
    return SettingsTile.text(
      title: "バージョン",
      titleStyle: Theme.of(context).textTheme.bodyLarge,
      value: "${packageInfo?.version} (${packageInfo?.buildNumber})",
    );
  }
}
