import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

@freezed
class EventQRCodeEntity with _$EventQRCodeEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory EventQRCodeEntity({
    @Default("") String eventId,
  }) = _EventQRCodeEntity;

  factory EventQRCodeEntity.fromJson(Map<String, dynamic> json) =>
      _$EventQRCodeEntityFromJson(json);
}

T? parseQRCode<T>(String? text) {
  if (text == null) return null;
  final uri = Uri.tryParse(text);
  if (T == EventQRCodeEntity && uri != null) {
    if (uri.queryParameters.containsKey("event_id") != true) return null;
    return EventQRCodeEntity.fromJson(uri.queryParameters) as T;
  } else if (uri == null) {
    final data = jsonDecode(text) as Map<String, dynamic>;
    if (T == VisitorQRCodeEntity &&
        data.containsKey("eventId") &&
        data.containsKey("userId")) {
      return VisitorQRCodeEntity.fromJson(data) as T;
    } else if (T == SpotQRCodeEntity &&
        data.containsKey("eventId") &&
        data.containsKey("spotId")) {
      return SpotQRCodeEntity.fromJson(data) as T;
    }
  }

  return null;
}
