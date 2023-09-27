import 'package:repaint_mobile/features/visitor/application/visitor_home_controller.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_qrcode_reader_controller.dart';
import 'package:repaint_mobile/features/visitor/application/visitor_settings_controller.dart';
import 'package:repaint_mobile/features/visitor/providers/settings_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_providers.g.dart';

@Riverpod()
VisitorHomeController visitorHomeController(
  VisitorHomeControllerRef ref,
) {
  return const VisitorHomeController();
}

@Riverpod(dependencies: [VisitorSettings])
VisitorSettingsController visitorSettingsController(
  VisitorSettingsControllerRef ref,
) {
  return VisitorSettingsController(
    ref.watch(visitorSettingsProvider.notifier),
  );
}

@Riverpod()
VisitorQRCodeReaderController visitorQRCodeReaderController(
  VisitorQRCodeReaderControllerRef ref,
) {
  return const VisitorQRCodeReaderController();
}
