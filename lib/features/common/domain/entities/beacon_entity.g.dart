// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beacon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BeaconEntity _$$_BeaconEntityFromJson(Map<String, dynamic> json) =>
    _$_BeaconEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      proximity: $enumDecode(_$BeaconProximityEnumMap, json['proximity']),
      hwid: json['hwid'] as String,
    );

Map<String, dynamic> _$$_BeaconEntityToJson(_$_BeaconEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'proximity': _$BeaconProximityEnumMap[instance.proximity]!,
      'hwid': instance.hwid,
    };

const _$BeaconProximityEnumMap = {
  BeaconProximity.immediate: 'immediate',
  BeaconProximity.near: 'near',
  BeaconProximity.far: 'far',
  BeaconProximity.unknown: 'unknown',
};
