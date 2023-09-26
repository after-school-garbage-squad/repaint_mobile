//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'join_event_request.g.dart';

/// JoinEventRequest
///
/// Properties:
/// * [registrationId] - スマホのプッシュ通知用のID
@BuiltValue()
abstract class JoinEventRequest implements Built<JoinEventRequest, JoinEventRequestBuilder> {
  /// スマホのプッシュ通知用のID
  @BuiltValueField(wireName: r'registrationId')
  String get registrationId;

  JoinEventRequest._();

  factory JoinEventRequest([void updates(JoinEventRequestBuilder b)]) = _$JoinEventRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JoinEventRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JoinEventRequest> get serializer => _$JoinEventRequestSerializer();
}

class _$JoinEventRequestSerializer implements PrimitiveSerializer<JoinEventRequest> {
  @override
  final Iterable<Type> types = const [JoinEventRequest, _$JoinEventRequest];

  @override
  final String wireName = r'JoinEventRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JoinEventRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'registrationId';
    yield serializers.serialize(
      object.registrationId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    JoinEventRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JoinEventRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'registrationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.registrationId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JoinEventRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JoinEventRequestBuilder();
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

