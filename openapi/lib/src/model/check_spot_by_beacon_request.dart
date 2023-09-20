//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'check_spot_by_beacon_request.g.dart';

/// CheckSpotByBeaconRequest
///
/// Properties:
/// * [hwId] - ビーコンのハードウェアID
@BuiltValue()
abstract class CheckSpotByBeaconRequest implements Built<CheckSpotByBeaconRequest, CheckSpotByBeaconRequestBuilder> {
  /// ビーコンのハードウェアID
  @BuiltValueField(wireName: r'hwId')
  String get hwId;

  CheckSpotByBeaconRequest._();

  factory CheckSpotByBeaconRequest([void updates(CheckSpotByBeaconRequestBuilder b)]) = _$CheckSpotByBeaconRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckSpotByBeaconRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckSpotByBeaconRequest> get serializer => _$CheckSpotByBeaconRequestSerializer();
}

class _$CheckSpotByBeaconRequestSerializer implements PrimitiveSerializer<CheckSpotByBeaconRequest> {
  @override
  final Iterable<Type> types = const [CheckSpotByBeaconRequest, _$CheckSpotByBeaconRequest];

  @override
  final String wireName = r'CheckSpotByBeaconRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckSpotByBeaconRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'hwId';
    yield serializers.serialize(
      object.hwId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckSpotByBeaconRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckSpotByBeaconRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'hwId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.hwId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckSpotByBeaconRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckSpotByBeaconRequestBuilder();
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

