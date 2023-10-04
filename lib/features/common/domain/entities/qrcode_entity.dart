import 'package:freezed_annotation/freezed_annotation.dart';

part 'qrcode_entity.freezed.dart';

part 'qrcode_entity.g.dart';

@freezed
class VisitorQRCodeEntity with _$VisitorQRCodeEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory VisitorQRCodeEntity({
    eventId,
    userId,
  }) = _VisitorQRCodeEntity;

  factory VisitorQRCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitorQRCodeEntityFromJson(json);
}
