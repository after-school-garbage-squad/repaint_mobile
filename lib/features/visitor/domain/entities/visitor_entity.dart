import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/visitor/domain/entities/visitor_settings_entity.dart';

part 'visitor_entity.freezed.dart';
part 'visitor_entity.g.dart';

@freezed
class VisitorEntity with _$VisitorEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory VisitorEntity({
    @Default(null) VisitorIdentification? visitorIdentification,
    @Default("") String registrationId,
    @Default([]) List<int> palettes,
    @Default(VisitorSettingsEntity()) VisitorSettingsEntity settings,
  }) = _VisitorEntity;

  factory VisitorEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitorEntityFromJson(json);
}
