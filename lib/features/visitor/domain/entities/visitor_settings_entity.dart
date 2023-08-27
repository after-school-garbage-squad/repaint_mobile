import 'package:freezed_annotation/freezed_annotation.dart';

part 'visitor_settings_entity.freezed.dart';
part 'visitor_settings_entity.g.dart';

enum VisitorNotificationType {
  spotEntry,
  eventAnnouncement,
  other,
}

@freezed
class VisitorNotifications with _$VisitorNotifications {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory VisitorNotifications({
    @Default(true) bool spotEntry,
    @Default(true) bool eventAnnouncement,
    @Default(true) bool other,
  }) = _VisitorNotifications;

  factory VisitorNotifications.fromJson(Map<String, dynamic> json) =>
      _$VisitorNotificationsFromJson(json);
}

@freezed
class VisitorSettingsEntity with _$VisitorSettingsEntity {
  @JsonSerializable()
  const factory VisitorSettingsEntity({
    @Default(VisitorNotifications()) VisitorNotifications notifications,
  }) = _VisitorSettingsEntity;

  factory VisitorSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitorSettingsEntityFromJson(json);
}
