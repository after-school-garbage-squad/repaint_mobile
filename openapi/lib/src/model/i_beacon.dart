//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'i_beacon.g.dart';

/// iBeaconの情報
///
/// Properties:
/// * [major] - ビーコンのmajor
/// * [minor] - ビーコンのminor
/// * [beaconUuid] - ビーコンのUUID
@BuiltValue()
abstract class IBeacon implements Built<IBeacon, IBeaconBuilder> {
  /// ビーコンのmajor
  @BuiltValueField(wireName: r'major')
  int get major;

  /// ビーコンのminor
  @BuiltValueField(wireName: r'minor')
  int get minor;

  /// ビーコンのUUID
  @BuiltValueField(wireName: r'beaconUuid')
  String get beaconUuid;

  IBeacon._();

  factory IBeacon([void updates(IBeaconBuilder b)]) = _$IBeacon;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IBeaconBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IBeacon> get serializer => _$IBeaconSerializer();
}

class _$IBeaconSerializer implements PrimitiveSerializer<IBeacon> {
  @override
  final Iterable<Type> types = const [IBeacon, _$IBeacon];

  @override
  final String wireName = r'IBeacon';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IBeacon object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'major';
    yield serializers.serialize(
      object.major,
      specifiedType: const FullType(int),
    );
    yield r'minor';
    yield serializers.serialize(
      object.minor,
      specifiedType: const FullType(int),
    );
    yield r'beaconUuid';
    yield serializers.serialize(
      object.beaconUuid,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    IBeacon object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required IBeaconBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'major':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.major = valueDes;
          break;
        case r'minor':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.minor = valueDes;
          break;
        case r'beaconUuid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.beaconUuid = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IBeacon deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IBeaconBuilder();
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

