//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'controll_traffic_request.g.dart';

/// ControllTrafficRequest
///
/// Properties:
/// * [from] - スポットのパブリックID(ulid)
/// * [to] - スポットのパブリックID(ulid)
@BuiltValue()
abstract class ControllTrafficRequest implements Built<ControllTrafficRequest, ControllTrafficRequestBuilder> {
  /// スポットのパブリックID(ulid)
  @BuiltValueField(wireName: r'from')
  String? get from;

  /// スポットのパブリックID(ulid)
  @BuiltValueField(wireName: r'to')
  String get to;

  ControllTrafficRequest._();

  factory ControllTrafficRequest([void updates(ControllTrafficRequestBuilder b)]) = _$ControllTrafficRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ControllTrafficRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ControllTrafficRequest> get serializer => _$ControllTrafficRequestSerializer();
}

class _$ControllTrafficRequestSerializer implements PrimitiveSerializer<ControllTrafficRequest> {
  @override
  final Iterable<Type> types = const [ControllTrafficRequest, _$ControllTrafficRequest];

  @override
  final String wireName = r'ControllTrafficRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ControllTrafficRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.from != null) {
      yield r'from';
      yield serializers.serialize(
        object.from,
        specifiedType: const FullType(String),
      );
    }
    yield r'to';
    yield serializers.serialize(
      object.to,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ControllTrafficRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ControllTrafficRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'from':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.from = valueDes;
          break;
        case r'to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.to = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ControllTrafficRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ControllTrafficRequestBuilder();
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

