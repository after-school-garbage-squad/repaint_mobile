//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'update_spot_request.g.dart';

/// UpdateSpotRequest
///
/// Properties:
/// * [spotId] - スポットのパブリックID(ulid)
/// * [name] - スポット名
/// * [isPick] - pickableなスポットかどうか
@BuiltValue()
abstract class UpdateSpotRequest implements Built<UpdateSpotRequest, UpdateSpotRequestBuilder> {
  /// スポットのパブリックID(ulid)
  @BuiltValueField(wireName: r'spotId')
  String get spotId;

  /// スポット名
  @BuiltValueField(wireName: r'name')
  String? get name;

  /// pickableなスポットかどうか
  @BuiltValueField(wireName: r'isPick')
  bool? get isPick;

  UpdateSpotRequest._();

  factory UpdateSpotRequest([void updates(UpdateSpotRequestBuilder b)]) = _$UpdateSpotRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(UpdateSpotRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<UpdateSpotRequest> get serializer => _$UpdateSpotRequestSerializer();
}

class _$UpdateSpotRequestSerializer implements PrimitiveSerializer<UpdateSpotRequest> {
  @override
  final Iterable<Type> types = const [UpdateSpotRequest, _$UpdateSpotRequest];

  @override
  final String wireName = r'UpdateSpotRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    UpdateSpotRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'spotId';
    yield serializers.serialize(
      object.spotId,
      specifiedType: const FullType(String),
    );
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.isPick != null) {
      yield r'isPick';
      yield serializers.serialize(
        object.isPick,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    UpdateSpotRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required UpdateSpotRequestBuilder result,
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'isPick':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPick = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  UpdateSpotRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = UpdateSpotRequestBuilder();
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

