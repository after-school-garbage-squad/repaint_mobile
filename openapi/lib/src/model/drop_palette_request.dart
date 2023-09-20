//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'drop_palette_request.g.dart';

/// DropPaletteRequest
///
/// Properties:
/// * [spotId] - スポットのパブリックID(ulid)
@BuiltValue()
abstract class DropPaletteRequest implements Built<DropPaletteRequest, DropPaletteRequestBuilder> {
  /// スポットのパブリックID(ulid)
  @BuiltValueField(wireName: r'spotId')
  String get spotId;

  DropPaletteRequest._();

  factory DropPaletteRequest([void updates(DropPaletteRequestBuilder b)]) = _$DropPaletteRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DropPaletteRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DropPaletteRequest> get serializer => _$DropPaletteRequestSerializer();
}

class _$DropPaletteRequestSerializer implements PrimitiveSerializer<DropPaletteRequest> {
  @override
  final Iterable<Type> types = const [DropPaletteRequest, _$DropPaletteRequest];

  @override
  final String wireName = r'DropPaletteRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DropPaletteRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'spotId';
    yield serializers.serialize(
      object.spotId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    DropPaletteRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DropPaletteRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'spotId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.spotId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DropPaletteRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DropPaletteRequestBuilder();
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

