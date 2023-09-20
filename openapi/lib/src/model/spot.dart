//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/i_beacon.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'spot.g.dart';

/// スポット
///
/// Properties:
/// * [spotID] - スポットのパブリックID(ulid)
/// * [name] - スポット名
/// * [isPick] - pickableなスポットかどうか
/// * [bonus] - スポットのステータスがボーナスかどうか
/// * [iBeacon] 
/// * [hwId] - ビーコンのハードウェアID
/// * [serviceUuid] - ビーコンのサービスUUID
@BuiltValue()
abstract class Spot implements Built<Spot, SpotBuilder> {
  /// スポットのパブリックID(ulid)
  @BuiltValueField(wireName: r'spotID')
  String? get spotID;

  /// スポット名
  @BuiltValueField(wireName: r'name')
  String get name;

  /// pickableなスポットかどうか
  @BuiltValueField(wireName: r'isPick')
  bool get isPick;

  /// スポットのステータスがボーナスかどうか
  @BuiltValueField(wireName: r'bonus')
  bool get bonus;

  @BuiltValueField(wireName: r'iBeacon')
  IBeacon get iBeacon;

  /// ビーコンのハードウェアID
  @BuiltValueField(wireName: r'hwId')
  String get hwId;

  /// ビーコンのサービスUUID
  @BuiltValueField(wireName: r'serviceUuid')
  String get serviceUuid;

  Spot._();

  factory Spot([void updates(SpotBuilder b)]) = _$Spot;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SpotBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Spot> get serializer => _$SpotSerializer();
}

class _$SpotSerializer implements PrimitiveSerializer<Spot> {
  @override
  final Iterable<Type> types = const [Spot, _$Spot];

  @override
  final String wireName = r'Spot';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Spot object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.spotID != null) {
      yield r'spotID';
      yield serializers.serialize(
        object.spotID,
        specifiedType: const FullType(String),
      );
    }
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'isPick';
    yield serializers.serialize(
      object.isPick,
      specifiedType: const FullType(bool),
    );
    yield r'bonus';
    yield serializers.serialize(
      object.bonus,
      specifiedType: const FullType(bool),
    );
    yield r'iBeacon';
    yield serializers.serialize(
      object.iBeacon,
      specifiedType: const FullType(IBeacon),
    );
    yield r'hwId';
    yield serializers.serialize(
      object.hwId,
      specifiedType: const FullType(String),
    );
    yield r'serviceUuid';
    yield serializers.serialize(
      object.serviceUuid,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Spot object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SpotBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'spotID':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.spotID = valueDes;
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
        case r'bonus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.bonus = valueDes;
          break;
        case r'iBeacon':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(IBeacon),
          ) as IBeacon;
          result.iBeacon.replace(valueDes);
          break;
        case r'hwId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.hwId = valueDes;
          break;
        case r'serviceUuid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.serviceUuid = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Spot deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SpotBuilder();
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

