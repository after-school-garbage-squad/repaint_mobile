//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'send_email_request.g.dart';

/// SendEmailRequest
///
/// Properties:
/// * [email] - 追加する管理者のメールアドレス
@BuiltValue()
abstract class SendEmailRequest implements Built<SendEmailRequest, SendEmailRequestBuilder> {
  /// 追加する管理者のメールアドレス
  @BuiltValueField(wireName: r'email')
  String get email;

  SendEmailRequest._();

  factory SendEmailRequest([void updates(SendEmailRequestBuilder b)]) = _$SendEmailRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SendEmailRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SendEmailRequest> get serializer => _$SendEmailRequestSerializer();
}

class _$SendEmailRequestSerializer implements PrimitiveSerializer<SendEmailRequest> {
  @override
  final Iterable<Type> types = const [SendEmailRequest, _$SendEmailRequest];

  @override
  final String wireName = r'SendEmailRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SendEmailRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'email';
    yield serializers.serialize(
      object.email,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    SendEmailRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SendEmailRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SendEmailRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SendEmailRequestBuilder();
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

