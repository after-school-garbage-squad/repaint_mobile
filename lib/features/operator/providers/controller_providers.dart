import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/operator/application/operator_beacon_list_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_beacon_settings_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_camera_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_camera_preview_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_home_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_qrcode_reader_controller.dart';
import 'package:repaint_mobile/features/operator/application/operator_settings_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_providers.g.dart';

@Riverpod()
OperatorBeaconListController operatorBeaconListController(
  OperatorBeaconListControllerRef ref,
) {
  return const OperatorBeaconListController();
}

@Riverpod()
OperatorBeaconSettingsController operatorBeaconSettingsController(
  OperatorBeaconSettingsControllerRef ref,
) {
  return const OperatorBeaconSettingsController();
}

@Riverpod(dependencies: [])
Future<OperatorCameraPreviewController> operatorCameraPreviewController(
  OperatorCameraPreviewControllerRef ref,
) async {
  return OperatorCameraPreviewController(
    ref.watch(apiClientProvider),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    await ref.watch(operatorUserProvider.future),
  );
}

@Riverpod()
OperatorCameraController operatorCameraController(
  OperatorCameraControllerRef ref,
) {
  return const OperatorCameraController();
}

@Riverpod()
OperatorHomeController operatorHomeController(
  OperatorHomeControllerRef ref,
) {
  return const OperatorHomeController();
}

@Riverpod()
OperatorQRCodeReaderController operatorQRCodeReaderController(
  OperatorQRCodeReaderControllerRef ref,
) {
  return const OperatorQRCodeReaderController();
}

@Riverpod(dependencies: [])
OperatorSettingsController operatorSettingsController(
  OperatorSettingsControllerRef ref,
) {
  return OperatorSettingsController(
    ref.watch(auth0Provider),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    ref.watch(operatorUserProvider.notifier),
  );
}
