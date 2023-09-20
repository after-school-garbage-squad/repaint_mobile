//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_default_image_request.g.dart';

/// RegisterDefaultImageRequest
///
/// Properties:
/// * [imageId] - イベントのデフォルト画像のID(ulid)
@BuiltValue()
abstract class RegisterDefaultImageRequest implements Built<RegisterDefaultImageRequest, RegisterDefaultImageRequestBuilder> {
  /// イベントのデフォルト画像のID(ulid)
  @BuiltValueField(wireName: r'imageId')
  String get imageId;

  RegisterDefaultImageRequest._();

  factory RegisterDefaultImageRequest([void updates(RegisterDefaultImageRequestBuilder b)]) = _$RegisterDefaultImageRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterDefaultImageRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterDefaultImageRequest> get serializer => _$RegisterDefaultImageRequestSerializer();
}

class _$RegisterDefaultImageRequestSerializer implements PrimitiveSerializer<RegisterDefaultImageRequest> {
  @override
  final Iterable<Type> types = const [RegisterDefaultImageRequest, _$RegisterDefaultImageRequest];

  @override
  final String wireName = r'RegisterDefaultImageRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterDefaultImageRequest object, {
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
    RegisterDefaultImageRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterDefaultImageRequestBuilder result,
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
  RegisterDefaultImageRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterDefaultImageRequestBuilder();
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

