//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/register_visitor.dart';
import 'package:openapi/src/model/event.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'join_event200_response.g.dart';

/// JoinEvent200Response
///
/// Properties:
/// * [visitor] 
/// * [event] 
@BuiltValue()
abstract class JoinEvent200Response implements Built<JoinEvent200Response, JoinEvent200ResponseBuilder> {
  @BuiltValueField(wireName: r'visitor')
  RegisterVisitor get visitor;

  @BuiltValueField(wireName: r'event')
  Event get event;

  JoinEvent200Response._();

  factory JoinEvent200Response([void updates(JoinEvent200ResponseBuilder b)]) = _$JoinEvent200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JoinEvent200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JoinEvent200Response> get serializer => _$JoinEvent200ResponseSerializer();
}

class _$JoinEvent200ResponseSerializer implements PrimitiveSerializer<JoinEvent200Response> {
  @override
  final Iterable<Type> types = const [JoinEvent200Response, _$JoinEvent200Response];

  @override
  final String wireName = r'JoinEvent200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JoinEvent200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'visitor';
    yield serializers.serialize(
      object.visitor,
      specifiedType: const FullType(RegisterVisitor),
    );
    yield r'event';
    yield serializers.serialize(
      object.event,
      specifiedType: const FullType(Event),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    JoinEvent200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JoinEvent200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'visitor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RegisterVisitor),
          ) as RegisterVisitor;
          result.visitor.replace(valueDes);
          break;
        case r'event':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Event),
          ) as Event;
          result.event.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JoinEvent200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JoinEvent200ResponseBuilder();
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

