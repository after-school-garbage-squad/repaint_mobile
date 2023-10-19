import 'package:freezed_annotation/freezed_annotation.dart';

part 'beacon_entity.freezed.dart';
part 'beacon_entity.g.dart';

enum BeaconProximity {
  @JsonValue('immediate')
  immediate,
  @JsonValue('near')
  near,
  @JsonValue('far')
  far,
  @JsonValue('unknown')
  unknown,
}

extension BeaconProximityExtension on BeaconProximity {
  String get name {
    switch (this) {
      case BeaconProximity.immediate:
        return 'かなり近い';
      case BeaconProximity.near:
        return '近い';
      case BeaconProximity.far:
        return '遠い';
      case BeaconProximity.unknown:
        return '不明';
    }
  }
}

@freezed
class BeaconEntity with _$BeaconEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory BeaconEntity({
    required String id,
    required String name,
    required BeaconProximity proximity,
    required String hwid,
  }) = _BeaconEntity;

  factory BeaconEntity.fromJson(Map<String, dynamic> json) =>
      _$BeaconEntityFromJson(json);
}
