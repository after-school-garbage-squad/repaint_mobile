import "dart:io";

import "package:app_settings/app_settings.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:permission_handler/permission_handler.dart";
import "package:repaint_mobile/config/guards.dart";
import "package:repaint_mobile/config/providers.dart";
import "package:repaint_mobile/features/common/presentation/widgets/app_dialog.dart";
import "package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart";
import "package:repaint_mobile/features/common/presentation/widgets/material_banner.dart";
import "package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart";
import "package:repaint_mobile/features/common/presentation/widgets/snackbar.dart";
import "package:repaint_mobile/features/common/presentation/widgets/topic.dart";
import "package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart";
import "package:repaint_mobile/features/operator/application/operator_stepper_controller.dart";
import "package:repaint_mobile/features/operator/domain/entities/operator_stepper_entity.dart";
import "package:repaint_mobile/features/operator/providers/state_providers.dart";

@RoutePage()
class OperatorStepperScreen extends ConsumerWidget {
  Future<Map<Permission, PermissionStatus>> getPermissionStatuses() async {
    final permissions = [
      Permission.notification,
      ...PermissionGuard.permissions,
    ];
    final List<PermissionStatus> statuses = [];

    await Future.forEach(
      permissions.map((permission) => permission.status),
      (element) async => statuses.add(await element),
    );

    return Map.fromIterables(permissions, statuses);
  }

  Future<List<Step>> getSteps(
    BuildContext context,
    WidgetRef ref,
    OperatorStepperController controller,
    OperatorStepperEntity stepper,
  ) async {
    final permissions = await getPermissionStatuses();
    if (kDebugMode) {
      print(permissions);
    }

    return [
      Step(
        state: stepper.currentStep == 0
            ? StepState.editing
            : stepper.currentStep > 0
                ? StepState.complete
                : StepState.disabled,
        title: const Text("位置情報の許可"),
        subtitle: const Text("必須"),
        content: Column(
          children: [
            const Text("スポットに接続するために、位置情報の権限が必要です。\n"
                "位置情報はオンにして、常に利用できるようにしてください。"),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: () => controller.onStepLocation(context),
              text: permissions[Permission.location]?.isGranted == true &&
                      permissions[Permission.locationWhenInUse]?.isGranted ==
                          true &&
                      permissions[Permission.locationAlways]?.isGranted == true
                  ? "続ける"
                  : "位置情報へのアクセスを許可する",
            ),
          ],
        ),
        isActive: stepper.currentStep >= 0,
      ),
      Step(
        state: stepper.currentStep == 1
            ? StepState.editing
            : stepper.currentStep > 1
                ? StepState.complete
                : StepState.disabled,
        title: const Text("Bluetoothの許可"),
        subtitle: const Text("必須"),
        content: Column(
          children: [
            Text("スポットに接続するために、Bluetoothの権限が必要です。\n"
                "${Platform.isAndroid ? "また、電池の最適化をオフにしてください。" : ""}"),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: () => controller.onStepBluetooth(context),
              text: permissions[Permission.bluetooth]?.isGranted == true &&
                      (Platform.isIOS ||
                          permissions[Permission.bluetoothScan]?.isGranted ==
                              true) &&
                      (Platform.isIOS ||
                          permissions[Permission.ignoreBatteryOptimizations]
                                  ?.isGranted ==
                              true)
                  ? "続ける"
                  : "Bluetoothへのアクセスを許可する",
            ),
          ],
        ),
        isActive: stepper.currentStep >= 1,
      ),
      Step(
        state: stepper.currentStep == 2
            ? StepState.editing
            : stepper.currentStep > 2
                ? StepState.complete
                : StepState.disabled,
        title: const Text("カメラへのアクセスの許可"),
        subtitle: const Text("必須"),
        content: Column(
          children: [
            const Text("QRコードを読み取るためにカメラの権限が必要です。"),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: () => controller.onStepCamera(context),
              text: permissions[Permission.camera]?.isGranted == true
                  ? "続ける"
                  : "カメラへのアクセスを許可する",
            ),
          ],
        ),
        isActive: stepper.currentStep >= 2,
      ),
      Step(
        state: stepper.currentStep == 3
            ? StepState.editing
            : stepper.currentStep > 3
                ? StepState.complete
                : StepState.disabled,
        title: const Text("アカウントのログイン"),
        subtitle: const Text("必須"),
        content: Column(
          children: [
            const Text("イベントの運営を行うには運営者としてログインが必要です。\n"
                "運営者のアカウントは、コンソール画面から行ってください。"),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: () => controller.onStepEvent(context),
              text: "運営者としてログイン",
            ),
          ],
        ),
        isActive: stepper.currentStep >= 3,
      ),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepper = ref.watch(operatorStepperProvider);
    final controller = ref.watch(operatorStepperControllerProvider);

    ref.listen(
      networkErrorProvider,
      (previous, next) => showNetworkErrorSnackBar(context, next),
    );

    ref.listen(
      bluetoothServiceProvider,
      (previous, next) => showBluetoothErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    ref.listen(
      locationServiceProvider,
      (previous, next) => showLocationErrorMaterialBanner(
        context,
        previous?.value,
        next.value,
      ),
    );

    return RepaintScaffold(
      title: "初期設定",
      padding: EdgeInsets.zero,
      child: FutureBuilder(
        future: getSteps(context, ref, controller, stepper),
        builder: (context, AsyncSnapshot<List<Step>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Topic(
                    icon: Icons.info,
                    text: "ボタンを押して、イベント管理に必要な初期設定を行ってください。",
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                ),
                Expanded(
                  child: Stepper(
                    steps: snapshot.data!,
                    currentStep: stepper.currentStep,
                    controlsBuilder: (context, controlsDetails) =>
                        const SizedBox(width: double.infinity),
                    margin: const EdgeInsets.fromLTRB(52.0, 16.0, 24.0, 16.0),
                  ),
                ),
                const BottomPadding(),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class PermissionDeniedDialog extends StatelessWidget {
  const PermissionDeniedDialog({
    super.key,
    required this.permission,
  });

  final Permission permission;

  String getTitle() {
    switch (permission) {
      case Permission.notification:
        return "通知";
      case Permission.location:
      case Permission.locationAlways:
      case Permission.locationWhenInUse:
        return "位置情報";
      case Permission.bluetooth:
      case Permission.bluetoothScan:
        return "Bluetooth";
      case Permission.ignoreBatteryOptimizations:
        return "電池の最適化";
      case Permission.camera:
        return "カメラ";
      default:
        return "";
    }
  }

  AppSettingsType getAppSettingsType() {
    switch (permission) {
      case Permission.notification:
        return AppSettingsType.notification;
      case Permission.location:
      case Permission.locationAlways:
      case Permission.locationWhenInUse:
        return AppSettingsType.location;
      case Permission.bluetooth:
      case Permission.bluetoothScan:
        return AppSettingsType.bluetooth;
      case Permission.ignoreBatteryOptimizations:
        return AppSettingsType.batteryOptimization;
      default:
        return AppSettingsType.settings;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      automaticallyImplyLeading: false,
      children: [
        const Spacer(),
        const Icon(Icons.warning, color: Colors.orange, size: 48.0),
        const SizedBox(height: 12.0),
        Text("${getTitle()}の許可が必要です"),
        const SizedBox(height: 12.0),
        const Text("設定から許可をお願いいたします"),
        const SizedBox(height: 12.0),
        WideElevatedButton(
          onPressed: () =>
              AppSettings.openAppSettings(type: getAppSettingsType()),
          text: "設定を開く",
        ),
        const SizedBox(height: 12.0),
        WideElevatedButton(
          onPressed: context.popRoute,
          text: "キャンセル",
          colors: const WideElevatedButtonColors(
            backgroundColor: Colors.white,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
