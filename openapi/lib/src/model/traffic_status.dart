//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'traffic_status.g.dart';

/// トラフィックの状態
///
/// Properties:
/// * [spotId] - スポットのパブリックID(ulid)
/// * [headCount] - そのspotにいた人数
@BuiltValue()
abstract class TrafficStatus implements Built<TrafficStatus, TrafficStatusBuilder> {
  /// スポットのパブリックID(ulid)
  @BuiltValueField(wireName: r'spotId')
  String get spotId;

  /// そのspotにいた人数
  @BuiltValueField(wireName: r'headCount')
  int get headCount;

  TrafficStatus._();

  factory TrafficStatus([void updates(TrafficStatusBuilder b)]) = _$TrafficStatus;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TrafficStatusBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TrafficStatus> get serializer => _$TrafficStatusSerializer();
}

class _$TrafficStatusSerializer implements PrimitiveSerializer<TrafficStatus> {
  @override
  final Iterable<Type> types = const [TrafficStatus, _$TrafficStatus];

  @override
  final String wireName = r'TrafficStatus';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TrafficStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'spotId';
    yield serializers.serialize(
      object.spotId,
      specifiedType: const FullType(String),
    );
    yield r'headCount';
    yield serializers.serialize(
      object.headCount,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TrafficStatus object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TrafficStatusBuilder result,
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
        case r'headCount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.headCount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TrafficStatus deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TrafficStatusBuilder();
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

