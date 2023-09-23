import 'package:fpdart/fpdart.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/common/infrastructures/entities/result.dart';
import 'package:repaint_mobile/features/visitor/domain/entities/visitor_settings_entity.dart';

abstract class VisitorRepositoryInterface {
  Future<void> setSettings(VisitorSettingsEntity settings);

  Future<VisitorSettingsEntity> getSettings();

  Future<Either<Failure, Success<RegisterVisitor>>> joinEvent(
    String eventID,
    JoinEventRequest joinEventRequest,
  );
}
