//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/i_beacon.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_spot_request.g.dart';

/// RegisterSpotRequest
///
/// Properties:
/// * [name] - スポット名
/// * [iBeacon] 
/// * [hwId] - ビーコンのハードウェアID
/// * [serviceUuid] - ビーコンのサービスUUID
@BuiltValue()
abstract class RegisterSpotRequest implements Built<RegisterSpotRequest, RegisterSpotRequestBuilder> {
  /// スポット名
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'iBeacon')
  IBeacon get iBeacon;

  /// ビーコンのハードウェアID
  @BuiltValueField(wireName: r'hwId')
  String get hwId;

  /// ビーコンのサービスUUID
  @BuiltValueField(wireName: r'serviceUuid')
  String get serviceUuid;

  RegisterSpotRequest._();

  factory RegisterSpotRequest([void updates(RegisterSpotRequestBuilder b)]) = _$RegisterSpotRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterSpotRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterSpotRequest> get serializer => _$RegisterSpotRequestSerializer();
}

class _$RegisterSpotRequestSerializer implements PrimitiveSerializer<RegisterSpotRequest> {
  @override
  final Iterable<Type> types = const [RegisterSpotRequest, _$RegisterSpotRequest];

  @override
  final String wireName = r'RegisterSpotRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterSpotRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
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
    RegisterSpotRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterSpotRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
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
  RegisterSpotRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterSpotRequestBuilder();
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

