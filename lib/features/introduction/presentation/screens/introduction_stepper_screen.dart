import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:repaint_mobile/config/guards.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/introduction/application/introduction_stepper_controller.dart';
import 'package:repaint_mobile/features/introduction/domain/entities/introduction_stepper_entity.dart';

@RoutePage()
class IntroductionStepperScreen extends ConsumerWidget {
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
    IntroductionStepperController controller,
    IntroductionStepperEntity stepper,
  ) async {
    final permissions = await getPermissionStatuses();
    if (kDebugMode) {
      print(permissions);
    }

    return context.mounted
        ? [
            Step(
              state: stepper.currentStep == 0
                  ? StepState.editing
                  : StepState.complete,
              title: const Text("通知の許可"),
              subtitle: const Text("任意"),
              content: Column(
                children: [
                  const Text(
                    "Re:paintから通知を送信するために必要です。\n"
                    "通知を希望しない場合は無効化できます。\n"
                    "通知設定は後から変更できます。",
                  ),
                  const SizedBox(height: 12.0),
                  if (permissions[Permission.notification]?.isGranted ==
                      true) ...[
                    WideElevatedButton(
                      onPressed: controller.onStepNotificationDeny,
                      text: "続ける",
                    ),
                  ] else ...[
                    WideElevatedButton(
                      onPressed: controller.onStepNotificationPermit,
                      text: "通知を許可する",
                    ),
                    const SizedBox(height: 12.0),
                    WideElevatedButton(
                      onPressed: controller.onStepNotificationDeny,
                      text: "通知を許可しない",
                      colors: WideElevatedButtonColors(
                        backgroundColor: Colors.white,
                        textColor: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ],
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
              title: const Text("位置情報の許可"),
              subtitle: const Text("必須"),
              content: Column(
                children: [
                  const Text("スポットに接続するために、位置情報の権限が必要です。\n"
                      "位置情報はオンにして、常に利用できるようにしてください。"),
                  const SizedBox(height: 12.0),
                  WideElevatedButton(
                    onPressed: controller.onStepLocation,
                    text: permissions[Permission.location]?.isGranted == true &&
                            permissions[Permission.locationWhenInUse]
                                    ?.isGranted ==
                                true &&
                            permissions[Permission.locationAlways]?.isGranted ==
                                true
                        ? "続ける"
                        : "位置情報へのアクセスを許可する",
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
              title: const Text("Bluetoothの許可"),
              subtitle: const Text("必須"),
              content: Column(
                children: [
                  Text("スポットに接続するために、Bluetoothの権限が必要です。\n"
                      "${Platform.isAndroid ? "また、電池の最適化をオフにしてください。" : ""}"),
                  const SizedBox(height: 12.0),
                  WideElevatedButton(
                    onPressed: controller.onStepBluetooth,
                    text:
                        permissions[Permission.bluetooth]?.isGranted == true &&
                                (Platform.isIOS ||
                                    permissions[Permission.bluetoothScan]
                                            ?.isGranted ==
                                        true) &&
                                (Platform.isIOS ||
                                    permissions[Permission
                                                .ignoreBatteryOptimizations]
                                            ?.isGranted ==
                                        true)
                            ? "続ける"
                            : "Bluetoothへのアクセスを許可する",
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
              title: const Text("カメラへのアクセスの許可"),
              subtitle: const Text("必須"),
              content: Column(
                children: [
                  const Text("QRコードを読み取るためにカメラの権限が必要です。"),
                  const SizedBox(height: 12.0),
                  WideElevatedButton(
                    onPressed: controller.onStepCamera,
                    text: permissions[Permission.camera]?.isGranted == true
                        ? "続ける"
                        : "カメラへのアクセスを許可する",
                  ),
                ],
              ),
              isActive: stepper.currentStep >= 3,
            ),
            Step(
              state: stepper.currentStep == 4
                  ? StepState.editing
                  : stepper.currentStep > 4
                      ? StepState.complete
                      : StepState.disabled,
              title: const Text("イベントへの参加"),
              subtitle: const Text("必須"),
              content: Column(
                children: [
                  const Text("イベント参加用QRコードを読み取ってください。"),
                  const SizedBox(height: 12.0),
                  WideElevatedButton(
                    onPressed: () => controller.onStepEvent(context),
                    text: "QRコードを読み取る",
                  ),
                ],
              ),
              isActive: stepper.currentStep >= 4,
            ),
          ]
        : [];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepper = ref.watch(introductionStepperProvider);
    final controller = ref.watch(introductionStepperControllerProvider);

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
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Topic(
                    icon: Icons.info,
                    text: "ボタンを押して、イベント参加に必要な設定を行ってください。",
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
