import 'package:repaint_mobile/features/visitor/domain/entities/visitor_settings_entity.dart';

abstract class VisitorRepositoryInterface {
  Future<void> setSettings(VisitorSettingsEntity settings);

  Future<VisitorSettingsEntity> getSettings();
}
