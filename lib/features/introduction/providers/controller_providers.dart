import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/introduction/application/introduction_qrcode_scanner_controller.dart';
import 'package:repaint_mobile/features/introduction/application/introduction_stepper_controller.dart';
import 'package:repaint_mobile/features/introduction/providers/providers.dart';
import 'package:repaint_mobile/features/visitor/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_providers.g.dart';

@Riverpod()
Future<IntroductionQRCodeReaderController> introductionQRCodeReaderController(
  IntroductionQRCodeReaderControllerRef ref,
) async {
  return IntroductionQRCodeReaderController(
    await ref.watch(visitorRepositoryProvider.future),
    ref.watch(userProvider.notifier),
    ref.watch(loggerProvider),
  );
}

@Riverpod()
IntroductionStepperController introductionStepperController(
  IntroductionStepperControllerRef ref,
) {
  return IntroductionStepperController(
    ref.watch(introductionStepperProvider.notifier),
  );
}
