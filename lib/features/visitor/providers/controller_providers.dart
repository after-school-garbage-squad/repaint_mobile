import 'package:repaint_mobile/features/visitor/application/visitor_settings_controller.dart';
import 'package:repaint_mobile/features/visitor/providers/settings_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'controller_providers.g.dart';

@Riverpod(dependencies: [])
VisitorSettingsController visitorSettingsController(
  VisitorSettingsControllerRef ref,
) {
  return VisitorSettingsController(ref.watch(visitorSettingsProvider.notifier));
}
