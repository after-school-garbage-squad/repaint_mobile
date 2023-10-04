import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/operator/application/operator_beacon_list_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_beacon_settings_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_camera_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_camera_preview_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_event_list_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_home_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_qrcode_reader_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_settings_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_providers.g.dart';

@Riverpod()
OperatorBeaconListController operatorBeaconListController(
  OperatorBeaconListControllerRef ref,
) {
  return OperatorBeaconListController(ref.watch(beaconsProvider.notifier));
}

@Riverpod(dependencies: [OperatorUser])
Future<OperatorBeaconSettingsController> operatorBeaconSettingsController(
  OperatorBeaconSettingsControllerRef ref,
) async {
  return OperatorBeaconSettingsController(
    ref.watch(apiClientProvider),
    await ref.watch(operatorUserProvider.future),
  );
}

@Riverpod(dependencies: [])
OperatorCameraPreviewController operatorCameraPreviewController(
  OperatorCameraPreviewControllerRef ref,
) {
  return const OperatorCameraPreviewController();
}

@Riverpod()
OperatorCameraController operatorCameraController(
  OperatorCameraControllerRef ref,
) {
  return const OperatorCameraController();
}

@Riverpod(dependencies: [OperatorUser])
Future<OperatorEventListController> operatorEventListController(
  OperatorEventListControllerRef ref,
) async {
  return OperatorEventListController(
    await ref.watch(operatorUserProvider.notifier),
  );
}

@Riverpod(dependencies: [OperatorUser])
Future<OperatorHomeController> operatorHomeController(
  OperatorHomeControllerRef ref,
) async {
  return OperatorHomeController(await ref.watch(operatorUserProvider.future));
}

@Riverpod(dependencies: [OperatorUser])
Future<OperatorQRCodeReaderController> operatorQRCodeReaderController(
  OperatorQRCodeReaderControllerRef ref,
) async {
  return OperatorQRCodeReaderController(
    ref.watch(apiClientProvider),
    await ref.watch(operatorUserProvider.future),
  );
}

@Riverpod(dependencies: [OperatorUser])
OperatorSettingsController operatorSettingsController(
  OperatorSettingsControllerRef ref,
) {
  return OperatorSettingsController(
    ref.watch(auth0Provider),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    ref.watch(operatorUserProvider.notifier),
  );
}
