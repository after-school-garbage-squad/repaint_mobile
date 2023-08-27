// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorNotifications _$$_VisitorNotificationsFromJson(
        Map<String, dynamic> json) =>
    _$_VisitorNotifications(
      spotEntry: json['spot_entry'] as bool? ?? true,
      eventAnnouncement: json['event_announcement'] as bool? ?? true,
      other: json['other'] as bool? ?? true,
    );

Map<String, dynamic> _$$_VisitorNotificationsToJson(
        _$_VisitorNotifications instance) =>
    <String, dynamic>{
      'spot_entry': instance.spotEntry,
      'event_announcement': instance.eventAnnouncement,
      'other': instance.other,
    };

_$_VisitorSettingsEntity _$$_VisitorSettingsEntityFromJson(
        Map<String, dynamic> json) =>
    _$_VisitorSettingsEntity(
      notifications: json['notifications'] == null
          ? const VisitorNotifications()
          : VisitorNotifications.fromJson(
              json['notifications'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_VisitorSettingsEntityToJson(
        _$_VisitorSettingsEntity instance) =>
    <String, dynamic>{
      'notifications': instance.notifications.toJson(),
    };
