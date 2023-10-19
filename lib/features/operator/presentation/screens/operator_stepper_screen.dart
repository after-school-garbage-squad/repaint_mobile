import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/material_banner.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/repaint_scaffold.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/snackbar.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/operator/providers/state_providers.dart';

@RoutePage()
class OperatorStepperScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepper = ref.watch(operatorStepperProvider);
    final controller = ref.watch(operatorStepperControllerProvider);
    final steps = [
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
                "位置情報は常にアクセスできるようにしてください。\n"),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: controller.onStepLocation,
              text: "位置情報へのアクセスを常に許可する",
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
              onPressed: controller.onStepBluetooth,
              text: "Bluetoothへのアクセスを許可する",
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
              onPressed: controller.onStepCamera,
              text: "カメラへのアクセスを許可する",
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

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.onPostFrameCallback(steps.length);
    });

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
      child: Column(
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
              steps: steps,
              currentStep: stepper.currentStep,
              controlsBuilder: (context, controlsDetails) =>
                  const SizedBox(width: double.infinity),
              margin: const EdgeInsets.fromLTRB(52.0, 16.0, 24.0, 16.0),
            ),
          ),
          const BottomPadding(),
        ],
      ),
    );
  }
}
