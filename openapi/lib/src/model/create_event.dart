//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:openapi/src/model/contact.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'create_event.g.dart';

/// イベント作成時のレスポンス
///
/// Properties:
/// * [eventId] - イベントのパブリックID(ulid)
/// * [name] - イベント名
/// * [hpUrl] - イベントのホームページのURL
/// * [contact] 
@BuiltValue()
abstract class CreateEvent implements Built<CreateEvent, CreateEventBuilder> {
  /// イベントのパブリックID(ulid)
  @BuiltValueField(wireName: r'eventId')
  String get eventId;

  /// イベント名
  @BuiltValueField(wireName: r'name')
  String get name;

  /// イベントのホームページのURL
  @BuiltValueField(wireName: r'hpUrl')
  String get hpUrl;

  @BuiltValueField(wireName: r'contact')
  Contact get contact;

  CreateEvent._();

  factory CreateEvent([void updates(CreateEventBuilder b)]) = _$CreateEvent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CreateEventBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CreateEvent> get serializer => _$CreateEventSerializer();
}

class _$CreateEventSerializer implements PrimitiveSerializer<CreateEvent> {
  @override
  final Iterable<Type> types = const [CreateEvent, _$CreateEvent];

  @override
  final String wireName = r'CreateEvent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CreateEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'eventId';
    yield serializers.serialize(
      object.eventId,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'hpUrl';
    yield serializers.serialize(
      object.hpUrl,
      specifiedType: const FullType(String),
    );
    yield r'contact';
    yield serializers.serialize(
      object.contact,
      specifiedType: const FullType(Contact),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CreateEvent object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CreateEventBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'eventId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.eventId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'hpUrl':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.hpUrl = valueDes;
          break;
        case r'contact':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Contact),
          ) as Contact;
          result.contact.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CreateEvent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CreateEventBuilder();
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

