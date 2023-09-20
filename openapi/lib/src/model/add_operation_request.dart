//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'add_operation_request.g.dart';

/// AddOperationRequest
///
/// Properties:
/// * [token] - emailに添付されているURLの末尾にクエリパラメータとして付与されているtoken
@BuiltValue()
abstract class AddOperationRequest implements Built<AddOperationRequest, AddOperationRequestBuilder> {
  /// emailに添付されているURLの末尾にクエリパラメータとして付与されているtoken
  @BuiltValueField(wireName: r'token')
  String get token;

  AddOperationRequest._();

  factory AddOperationRequest([void updates(AddOperationRequestBuilder b)]) = _$AddOperationRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AddOperationRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AddOperationRequest> get serializer => _$AddOperationRequestSerializer();
}

class _$AddOperationRequestSerializer implements PrimitiveSerializer<AddOperationRequest> {
  @override
  final Iterable<Type> types = const [AddOperationRequest, _$AddOperationRequest];

  @override
  final String wireName = r'AddOperationRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AddOperationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'token';
    yield serializers.serialize(
      object.token,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    AddOperationRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AddOperationRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.token = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AddOperationRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AddOperationRequestBuilder();
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

