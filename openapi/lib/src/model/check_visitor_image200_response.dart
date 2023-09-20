//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'check_visitor_image200_response.g.dart';

/// CheckVisitorImage200Response
///
/// Properties:
/// * [imageId] - 参加者が撮影した画像のID(ulid)
@BuiltValue()
abstract class CheckVisitorImage200Response implements Built<CheckVisitorImage200Response, CheckVisitorImage200ResponseBuilder> {
  /// 参加者が撮影した画像のID(ulid)
  @BuiltValueField(wireName: r'imageId')
  String? get imageId;

  CheckVisitorImage200Response._();

  factory CheckVisitorImage200Response([void updates(CheckVisitorImage200ResponseBuilder b)]) = _$CheckVisitorImage200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckVisitorImage200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckVisitorImage200Response> get serializer => _$CheckVisitorImage200ResponseSerializer();
}

class _$CheckVisitorImage200ResponseSerializer implements PrimitiveSerializer<CheckVisitorImage200Response> {
  @override
  final Iterable<Type> types = const [CheckVisitorImage200Response, _$CheckVisitorImage200Response];

  @override
  final String wireName = r'CheckVisitorImage200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckVisitorImage200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.imageId != null) {
      yield r'imageId';
      yield serializers.serialize(
        object.imageId,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckVisitorImage200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckVisitorImage200ResponseBuilder result,
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
  CheckVisitorImage200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckVisitorImage200ResponseBuilder();
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

