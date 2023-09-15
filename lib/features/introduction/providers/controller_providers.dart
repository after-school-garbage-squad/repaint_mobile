import 'package:repaint_mobile/features/introduction/application/introduction_stepper_controller.dart';
import 'package:repaint_mobile/features/introduction/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_providers.g.dart';

@Riverpod()
IntroductionStepperController introductionStepperController(
  IntroductionStepperControllerRef ref,
) {
  return IntroductionStepperController(
    ref.watch(introductionStepperProvider.notifier),
  );
}
