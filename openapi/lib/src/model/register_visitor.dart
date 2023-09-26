//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/visitor_identification.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_visitor.g.dart';

/// イベント参加者登録時のレスポンス
///
/// Properties:
/// * [visitorIdentification] 
/// * [registrationId] - スマホのプッシュ通知用のID
/// * [palettes] 
@BuiltValue()
abstract class RegisterVisitor implements Built<RegisterVisitor, RegisterVisitorBuilder> {
  @BuiltValueField(wireName: r'visitorIdentification')
  VisitorIdentification get visitorIdentification;

  /// スマホのプッシュ通知用のID
  @BuiltValueField(wireName: r'registrationId')
  String get registrationId;

  @BuiltValueField(wireName: r'palettes')
  BuiltList<int> get palettes;

  RegisterVisitor._();

  factory RegisterVisitor([void updates(RegisterVisitorBuilder b)]) = _$RegisterVisitor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterVisitorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterVisitor> get serializer => _$RegisterVisitorSerializer();
}

class _$RegisterVisitorSerializer implements PrimitiveSerializer<RegisterVisitor> {
  @override
  final Iterable<Type> types = const [RegisterVisitor, _$RegisterVisitor];

  @override
  final String wireName = r'RegisterVisitor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterVisitor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'visitorIdentification';
    yield serializers.serialize(
      object.visitorIdentification,
      specifiedType: const FullType(VisitorIdentification),
    );
    yield r'registrationId';
    yield serializers.serialize(
      object.registrationId,
      specifiedType: const FullType(String),
    );
    yield r'palettes';
    yield serializers.serialize(
      object.palettes,
      specifiedType: const FullType(BuiltList, [FullType(int)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterVisitor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterVisitorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'visitorIdentification':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(VisitorIdentification),
          ) as VisitorIdentification;
          result.visitorIdentification.replace(valueDes);
          break;
        case r'registrationId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.registrationId = valueDes;
          break;
        case r'palettes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(int)]),
          ) as BuiltList<int>;
          result.palettes.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterVisitor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterVisitorBuilder();
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

