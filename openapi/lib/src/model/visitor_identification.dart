//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visitor_identification.g.dart';

/// 参加者の識別子
///
/// Properties:
/// * [eventId] - イベントのパブリックID(ulid)
/// * [visitorId] - 参加者のパブリックID(ulid)
@BuiltValue()
abstract class VisitorIdentification implements Built<VisitorIdentification, VisitorIdentificationBuilder> {
  /// イベントのパブリックID(ulid)
  @BuiltValueField(wireName: r'eventId')
  String get eventId;

  /// 参加者のパブリックID(ulid)
  @BuiltValueField(wireName: r'visitorId')
  String get visitorId;

  VisitorIdentification._();

  factory VisitorIdentification([void updates(VisitorIdentificationBuilder b)]) = _$VisitorIdentification;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VisitorIdentificationBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<VisitorIdentification> get serializer => _$VisitorIdentificationSerializer();
}

class _$VisitorIdentificationSerializer implements PrimitiveSerializer<VisitorIdentification> {
  @override
  final Iterable<Type> types = const [VisitorIdentification, _$VisitorIdentification];

  @override
  final String wireName = r'VisitorIdentification';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    VisitorIdentification object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'eventId';
    yield serializers.serialize(
      object.eventId,
      specifiedType: const FullType(String),
    );
    yield r'visitorId';
    yield serializers.serialize(
      object.visitorId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    VisitorIdentification object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VisitorIdentificationBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'eventId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.eventId = valueDes;
          break;
        case r'visitorId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.visitorId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  VisitorIdentification deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VisitorIdentificationBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}

