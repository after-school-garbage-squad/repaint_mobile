//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/visitor.dart';
import 'package:openapi/src/model/event.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'initialize_visitor200_response.g.dart';

/// InitializeVisitor200Response
///
/// Properties:
/// * [visitor] 
/// * [event] 
@BuiltValue()
abstract class InitializeVisitor200Response implements Built<InitializeVisitor200Response, InitializeVisitor200ResponseBuilder> {
  @BuiltValueField(wireName: r'visitor')
  Visitor get visitor;

  @BuiltValueField(wireName: r'event')
  Event get event;

  InitializeVisitor200Response._();

  factory InitializeVisitor200Response([void updates(InitializeVisitor200ResponseBuilder b)]) = _$InitializeVisitor200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InitializeVisitor200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InitializeVisitor200Response> get serializer => _$InitializeVisitor200ResponseSerializer();
}

class _$InitializeVisitor200ResponseSerializer implements PrimitiveSerializer<InitializeVisitor200Response> {
  @override
  final Iterable<Type> types = const [InitializeVisitor200Response, _$InitializeVisitor200Response];

  @override
  final String wireName = r'InitializeVisitor200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InitializeVisitor200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'visitor';
    yield serializers.serialize(
      object.visitor,
      specifiedType: const FullType(Visitor),
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
    InitializeVisitor200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InitializeVisitor200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'visitor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Visitor),
          ) as Visitor;
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
  InitializeVisitor200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InitializeVisitor200ResponseBuilder();
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

