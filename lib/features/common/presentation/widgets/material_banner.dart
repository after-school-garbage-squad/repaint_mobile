import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void showBluetoothErrorMaterialBanner(
  BuildContext context,
  ServiceStatus? previous,
  ServiceStatus? next,
) {
  if (next == ServiceStatus.disabled && context.mounted) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text("Bluetoothがオフになっています"),
        actions: [
          TextButton(
            child: const Text("設定"),
            onPressed: () =>
                AppSettings.openAppSettings(type: AppSettingsType.bluetooth),
          ),
        ],
      ),
    );
  } else if (previous == ServiceStatus.disabled &&
      next == ServiceStatus.enabled &&
      context.mounted) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
  }
}

void showLocationErrorMaterialBanner(
  BuildContext context,
  ServiceStatus? previous,
  ServiceStatus? next,
) {
  if (next == ServiceStatus.disabled && context.mounted) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: const Text("位置情報がオフになっています"),
        actions: [
          TextButton(
            child: const Text("設定"),
            onPressed: () =>
                AppSettings.openAppSettings(type: AppSettingsType.location),
          ),
        ],
      ),
    );
  } else if (previous == ServiceStatus.disabled &&
      next == ServiceStatus.enabled &&
      context.mounted) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
  }
}
