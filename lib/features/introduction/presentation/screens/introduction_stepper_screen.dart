import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repaint_mobile/config/app_router.dart';
import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/bottom_constrained_padding.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/flat_icon_button.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/topic.dart';
import 'package:repaint_mobile/features/common/presentation/widgets/wide_elevated_button.dart';
import 'package:repaint_mobile/features/introduction/providers/providers.dart';

@RoutePage()
class IntroductionStepperScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stepper = ref.watch(introductionStepperProvider);
    final controller = ref.watch(introductionStepperControllerProvider);
    final logger = ref.watch(loggerProvider);
    final steps = [
      Step(
        state:
            stepper.currentStep == 0 ? StepState.editing : StepState.complete,
        title: const Text("通知の許可"),
        subtitle: const Text("任意"),
        content: Column(
          children: [
            const Text(
              "Re:paintから通知を送信するために必要です。\n通知設定は後から変更できます。",
            ),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: controller.onStepNotification,
              text: "通知を許可する",
            ),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: controller.onStepNotification,
              text: "通知を許可しない",
              colors: WideElevatedButtonColors(
                backgroundColor: Colors.white,
                textColor: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ],
        ),
        isActive: stepper.currentStep >= 0,
      ),
      // TODO: 位置情報の許可周りのUIと挙動を改善する
      Step(
        state: stepper.currentStep == 1
            ? StepState.editing
            : stepper.currentStep > 1
                ? StepState.complete
                : StepState.disabled,
        title: const Text("スポットへの接続設定"),
        subtitle: const Text("必須"),
        content: Column(
          children: [
            Text(
              "スポットに接続するために、Bluetoothと位置情報の権限が必要です。\n"
              "${Platform.isAndroid ? "また、電池の最適化をオフにしてください。" : ""}",
            ),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: controller.onStepBeacon,
              text: "スポットへの接続を許可する",
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
        title: const Text("イベントへの参加設定"),
        subtitle: const Text("必須"),
        content: Column(
          children: [
            const Text("イベント参加用QRコードを読み取るためにカメラの権限が必要です。"),
            const SizedBox(height: 12.0),
            WideElevatedButton(
              onPressed: () {
                controller.onStepEvent(() {
                  logger.d("イベントへの参加を許可しました");
                  context.pushRoute(const IntroductionQRCodeReaderRoute());
                });
              },
              text: "QRコードを読み取る",
            ),
          ],
        ),
        isActive: stepper.currentStep >= 2,
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Topic(
              icon: Icons.info,
              text: "アプリに必要な初期設定を行ってください。",
              color: Theme.of(context).colorScheme.tertiaryContainer,
            ),
          ),
          Expanded(
            child: Stepper(
              steps: steps,
              currentStep: stepper.currentStep,
              controlsBuilder: (context, controlsDetails) {
                return const SizedBox(width: double.infinity);
              },
              connectorThickness: 3.0,
              margin: const EdgeInsets.fromLTRB(52.0, 16.0, 24.0, 16.0),
            ),
          ),
          const BottomConstrainedPadding(),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
