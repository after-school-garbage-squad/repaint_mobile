//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'get_current_image200_response.g.dart';

/// GetCurrentImage200Response
///
/// Properties:
/// * [imageId] - 参加者が現在設定している画像のID(ulid)
@BuiltValue()
abstract class GetCurrentImage200Response implements Built<GetCurrentImage200Response, GetCurrentImage200ResponseBuilder> {
  /// 参加者が現在設定している画像のID(ulid)
  @BuiltValueField(wireName: r'imageId')
  String get imageId;

  GetCurrentImage200Response._();

  factory GetCurrentImage200Response([void updates(GetCurrentImage200ResponseBuilder b)]) = _$GetCurrentImage200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(GetCurrentImage200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<GetCurrentImage200Response> get serializer => _$GetCurrentImage200ResponseSerializer();
}

class _$GetCurrentImage200ResponseSerializer implements PrimitiveSerializer<GetCurrentImage200Response> {
  @override
  final Iterable<Type> types = const [GetCurrentImage200Response, _$GetCurrentImage200Response];

  @override
  final String wireName = r'GetCurrentImage200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    GetCurrentImage200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'imageId';
    yield serializers.serialize(
      object.imageId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    GetCurrentImage200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required GetCurrentImage200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'imageId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.imageId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  GetCurrentImage200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = GetCurrentImage200ResponseBuilder();
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

