import 'package:app_settings/app_settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

final _excludedPaths = [
  '/introduction/qrcode_reader',
  "/operator/qrcode_reader",
  "/operator/camera",
  "/visitor/qrcode_reader",
];

void showBluetoothErrorMaterialBanner(
  BuildContext context,
  ServiceStatus? previous,
  ServiceStatus? next,
) {
  if (next == ServiceStatus.disabled &&
      context.mounted &&
      !_excludedPaths.contains(context.routeData.path)) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        dividerColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 16.0),
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
  } else if ((previous == ServiceStatus.disabled &&
          next == ServiceStatus.enabled &&
          context.mounted) ||
      _excludedPaths.contains(context.routeData.path)) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
  }
}

void showLocationErrorMaterialBanner(
  BuildContext context,
  ServiceStatus? previous,
  ServiceStatus? next,
) {
  if (next == ServiceStatus.disabled &&
      context.mounted &&
      !_excludedPaths.contains(context.routeData.path)) {
    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
        dividerColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: 16.0),
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
  } else if ((previous == ServiceStatus.disabled &&
          next == ServiceStatus.enabled &&
          context.mounted) ||
      _excludedPaths.contains(context.routeData.path)) {
    ScaffoldMessenger.of(context).clearMaterialBanners();
  }
}

void showFCMMaterialBanner(BuildContext context, RemoteMessage message) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      backgroundColor: Theme.of(context).colorScheme.tertiaryContainer,
      dividerColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 16.0),
      content: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: message.notification?.title ?? "",
                style: Theme.of(context).textTheme.titleMedium),
            const TextSpan(text: "\n"),
            TextSpan(text: message.notification?.body ?? ""),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () => ScaffoldMessenger.of(context).clearMaterialBanners(),
        ),
      ],
    ),
  );
}
