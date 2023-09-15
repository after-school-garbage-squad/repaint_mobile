import 'package:repaint_mobile/features/common/providers/util_providers.dart';
import 'package:repaint_mobile/features/introduction/domain/entities/introduction_stepper_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@Riverpod()
class IntroductionStepper extends _$IntroductionStepper {
  @override
  IntroductionStepperEntity build() {
    ref.read(loggerProvider).d('IntroductionStepper initialized');
    return const IntroductionStepperEntity();
  }

  void setSteps(int steps) {
    state = state.copyWith(steps: steps);
  }

  void previous() {
    state = state.copyWith(currentStep: state.currentStep - 1);
  }

  void next() {
    state = state.copyWith(currentStep: state.currentStep + 1);
  }

  void jumpTo(int step) {
    state = state.copyWith(currentStep: step);
  }
}
