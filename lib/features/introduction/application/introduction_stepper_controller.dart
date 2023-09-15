import 'package:repaint_mobile/features/introduction/providers/state_providers.dart';

class IntroductionStepperController {
  const IntroductionStepperController(this._stepper);

  final IntroductionStepper _stepper;

  bool get isLastStep => _stepper.state.currentStep == _stepper.state.steps - 1;

  void onPostFrameCallback(int steps) {
    _stepper.setSteps(steps);
  }

  void onStepTapped(int index) {
    _stepper.jumpTo(index);
  }

  void onStepContinue() {
    _stepper.next();
  }

  void onStepCancel() {
    _stepper.previous();
  }
}
