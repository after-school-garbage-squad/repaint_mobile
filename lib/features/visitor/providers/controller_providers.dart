import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_home_controller.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_qrcode_reader_controller.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_settings_controller.dart';
import 'package:repaint_mobile/features/visitor/providers/settings_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_providers.g.dart';

@Riverpod(dependencies: [VisitorUser])
Future<VisitorHomeController> visitorHomeController(
  VisitorHomeControllerRef ref,
) async {
  return VisitorHomeController(
    ref.watch(apiClientProvider),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    await ref.watch(visitorUserProvider.notifier),
  );
}

@Riverpod(dependencies: [VisitorSettings, VisitorUser])
VisitorSettingsController visitorSettingsController(
  VisitorSettingsControllerRef ref,
) {
  return VisitorSettingsController(
    ref.watch(visitorSettingsProvider.notifier),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    ref.watch(visitorUserProvider.notifier),
  );
}

@Riverpod()
VisitorQRCodeReaderController visitorQRCodeReaderController(
  VisitorQRCodeReaderControllerRef ref,
) {
  return const VisitorQRCodeReaderController();
}
