import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/introduction/providers/providers.dart';

@RoutePage()
class IntroductionStepperScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepper = ref.watch(introductionStepperProvider);
    final controller = ref.watch(introductionStepperControllerProvider);
    final steps = [
      Step(
        title: const Text("通知の許可"),
        content: const Text("Re:paintを使用するために、通知の許可をします。"),
        isActive: stepper.currentStep == 0,
      ),
      Step(
        title: const Text("位置情報の許可"),
        content: const Text("Re:paintを使用するために、位置情報の許可をします。"),
        isActive: stepper.currentStep == 1,
      ),
      Step(
        title: const Text("Bluetoothの許可"),
        content: const Text("Re:paintを使用するために、Bluetoothの許可をします。"),
        isActive: stepper.currentStep == 2,
      ),
      Step(
        title: const Text("カメラの許可"),
        content: const Text("Re:paintを使用するために、カメラの許可をします。"),
        isActive: stepper.currentStep == 3,
      ),
      Step(
        title: const Text("電源管理の設定"),
        content: const Text("Re:paintをバックグラウンドで動作させるために、電源管理の設定を変更します。"),
        isActive: stepper.currentStep == 4,
      ),
      Step(
        title: const Text("QRコードの読み取り"),
        content: const Text("QRコードを読み取ります。"),
        isActive: stepper.currentStep == 5,
      ),
    ];

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.onPostFrameCallback(steps.length);
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("初期設定"),
        leading: Row(
          children: [
            const SizedBox(width: 16.0),
            FlatIconButton(
              onPressed: context.popRoute,
              icon: Icons.chevron_left,
            ),
          ],
        ),
        leadingWidth: 64.0,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.info),
                        Text("進むを押して、初期設定を行ってください。"),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Stepper(
                      steps: steps,
                      currentStep: stepper.currentStep,
                      controlsBuilder: (context, controlsDetails) {
                        return const SizedBox(width: double.infinity);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: WideElevatedButton(
              onPressed: () {
                if (!controller.isLastStep) {
                  controller.onStepContinue();
                } else {
                  context.pushRoute(const IntroductionQRCodeReaderRoute());
                }
              },
              text: "進む",
            ),
          ),
          const BottomConstrainedPadding(),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
