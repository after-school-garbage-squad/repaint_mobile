//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'check_visitor_image_request.g.dart';

/// CheckVisitorImageRequest
///
/// Properties:
/// * [imageId] - 参加者のパブリックID(ulid)
@BuiltValue()
abstract class CheckVisitorImageRequest implements Built<CheckVisitorImageRequest, CheckVisitorImageRequestBuilder> {
  /// 参加者のパブリックID(ulid)
  @BuiltValueField(wireName: r'imageId')
  String? get imageId;

  CheckVisitorImageRequest._();

  factory CheckVisitorImageRequest([void updates(CheckVisitorImageRequestBuilder b)]) = _$CheckVisitorImageRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckVisitorImageRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckVisitorImageRequest> get serializer => _$CheckVisitorImageRequestSerializer();
}

class _$CheckVisitorImageRequestSerializer implements PrimitiveSerializer<CheckVisitorImageRequest> {
  @override
  final Iterable<Type> types = const [CheckVisitorImageRequest, _$CheckVisitorImageRequest];

  @override
  final String wireName = r'CheckVisitorImageRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckVisitorImageRequest object, {
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
    CheckVisitorImageRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckVisitorImageRequestBuilder result,
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
  CheckVisitorImageRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckVisitorImageRequestBuilder();
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

