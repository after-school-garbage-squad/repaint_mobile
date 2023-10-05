import 'package:freezed_annotation/freezed_annotation.dart';

part 'qrcode_entity.freezed.dart';

part 'qrcode_entity.g.dart';

@freezed
class VisitorQRCodeEntity with _$VisitorQRCodeEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory VisitorQRCodeEntity({
    @Default("") String eventId,
    @Default("") String userId,
  }) = _VisitorQRCodeEntity;

  factory VisitorQRCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitorQRCodeEntityFromJson(json);
}

@freezed
class SpotQRCodeEntity with _$SpotQRCodeEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory SpotQRCodeEntity({
    @Default("") String eventId,
    @Default("") String spotId,
  }) = _SpotQRCodeEntity;

  factory SpotQRCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$SpotQRCodeEntityFromJson(json);
}
