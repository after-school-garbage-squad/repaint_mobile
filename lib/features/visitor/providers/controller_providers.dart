import 'package:repaint_mobile/config/providers.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_home_controller.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_images_controller.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_qrcode_reader_controller.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_settings_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_providers.g.dart';

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<VisitorHomeController> visitorHomeController(
  VisitorHomeControllerRef ref,
) async {
  return VisitorHomeController(
    ref.watch(apiClientProvider),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    await ref.watch(visitorUserProvider.notifier),
  );
}

@Riverpod(dependencies: [VisitorUser, apiClient])
VisitorSettingsController visitorSettingsController(
  VisitorSettingsControllerRef ref,
) {
  return VisitorSettingsController(
    ref.watch(apiClientProvider),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    ref.watch(visitorUserProvider.notifier),
  );
}

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<VisitorQRCodeReaderController> visitorQRCodeReaderController(
  VisitorQRCodeReaderControllerRef ref,
) async {
  return VisitorQRCodeReaderController(
    ref.watch(apiClientProvider),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    await ref.watch(visitorUserProvider.future),
  );
}

@Riverpod(dependencies: [VisitorUser, apiClient])
Future<VisitorImagesController> visitorImagesController(
  VisitorImagesControllerRef ref,
) async {
  return VisitorImagesController(
    ref.watch(apiClientProvider),
    // ignore: avoid_manual_providers_as_generated_provider_dependency
    await ref.watch(visitorUserProvider.future),
  );
}
