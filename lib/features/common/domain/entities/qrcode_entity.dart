import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';

part 'qrcode_entity.freezed.dart';
part 'qrcode_entity.g.dart';

enum QRCodeType {
  visitor,
  spot,
  event,
}

@freezed
class VisitorQRCodeEntity with _$VisitorQRCodeEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory VisitorQRCodeEntity({
    @Default(null) String? eventId,
    @Default(null) String? userId,
  }) = _VisitorQRCodeEntity;

  factory VisitorQRCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$VisitorQRCodeEntityFromJson(json);
}

@freezed
class SpotQRCodeEntity with _$SpotQRCodeEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory SpotQRCodeEntity({
    @Default(null) String? eventId,
    @Default(null) String? spotId,
  }) = _SpotQRCodeEntity;

  factory SpotQRCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$SpotQRCodeEntityFromJson(json);
}

@freezed
class EventQRCodeEntity with _$EventQRCodeEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory EventQRCodeEntity({
    @Default(null) String? eventId,
  }) = _EventQRCodeEntity;

  factory EventQRCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$EventQRCodeEntityFromJson(json);
}

T? parseQRCode<T>(String? text) {
  final logger = Logger("parseQRCode");
  if (text == null) return null;
  final uri = Uri.tryParse(text);
  if (T == EventQRCodeEntity) {
    final input =
        uri?.queryParameters ?? jsonDecode(text) as Map<String, dynamic>;
    logger.info("qrcode: $text");
    return EventQRCodeEntity.fromJson(input) as T;
  } else if (uri == null) {
    final data = jsonDecode(text) as Map<String, dynamic>;
    logger.info("qrcode: $data");
    if (T == VisitorQRCodeEntity &&
        data.containsKey("event_id") &&
        data.containsKey("user_id")) {
      return VisitorQRCodeEntity.fromJson(data) as T;
    } else if (T == SpotQRCodeEntity &&
        data.containsKey("event_id") &&
        data.containsKey("spot_id")) {
      return SpotQRCodeEntity.fromJson(data) as T;
    }
  }

  return null;
}
