import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repaint_api_client/repaint_api_client.dart';
import 'package:repaint_mobile/features/visitor/domain/entities/visitor_settings_entity.dart';

part 'user_entity.freezed.dart';

part 'user_entity.g.dart';

enum UserType {
  @JsonValue('visitor')
  visitor,
  @JsonValue('operator')
  operator,
  @JsonValue('unknown')
  unknown,
}

@freezed
class CommonUserEntity with _$CommonUserEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory CommonUserEntity({
    @Default(UserType.unknown) UserType type,
  }) = _CommonUserEntity;

  factory CommonUserEntity.fromJson(Map<String, dynamic> json) =>
      _$CommonUserEntityFromJson(json);
}

@freezed
class OperatorUserEntity with _$OperatorUserEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory OperatorUserEntity({
    @Default(null) String? token,
    @Default(null) String? eventId,
  }) = _OperatorUserEntity;

  factory OperatorUserEntity.fromJson(Map<String, dynamic> json) =>
      _$OperatorUserEntityFromJson(json);
}

@freezed
class VisitorUserEntity with _$VisitorUserEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory VisitorUserEntity({
    @Default(null) RegisterVisitor? visitor,
    @Default(null) Event? event,
    @Default(null) String? imageId,
    @Default(false) bool isCompleted,
    @Default(VisitorSettingsEntity()) VisitorSettingsEntity settings,
  }) = _VisitorUserEntity;

  factory VisitorUserEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitorUserEntityFromJson(json);
}

extension RegisterVisitorX on RegisterVisitor {
  RegisterVisitor copyWith({
    VisitorIdentification? visitorIdentification,
    String? registrationId,
    List<int>? palettes,
  }) {
    return RegisterVisitor(
      visitorIdentification:
          visitorIdentification ?? this.visitorIdentification,
      registrationId: registrationId ?? this.registrationId,
      palettes: palettes ?? this.palettes,
    );
  }
}

extension VisitorIdentificationX on VisitorIdentification {
  VisitorIdentification copyWith({
    String? visitorId,
    String? eventId,
  }) {
    return VisitorIdentification(
      visitorId: visitorId ?? this.visitorId,
      eventId: eventId ?? this.eventId,
    );
  }
}
