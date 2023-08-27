// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_VisitorEntity _$$_VisitorEntityFromJson(Map<String, dynamic> json) =>
    _$_VisitorEntity(
      settings: json['settings'] == null
          ? const VisitorSettingsEntity()
          : VisitorSettingsEntity.fromJson(
              json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_VisitorEntityToJson(_$_VisitorEntity instance) =>
    <String, dynamic>{
      'settings': instance.settings.toJson(),
    };
