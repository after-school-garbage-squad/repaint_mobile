//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/model/visitor_identification.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'visitor.g.dart';

/// イベント参加者
///
/// Properties:
/// * [visitorIdentification] 
/// * [registrationId] - スマホのプッシュ通知用のID
/// * [palettes] 
/// * [imageId] - 参加者が撮影した画像のID(ulid)
/// * [currentImageId] - 参加者が現在設定している画像のID(ulid)
@BuiltValue()
abstract class Visitor implements Built<Visitor, VisitorBuilder> {
  @BuiltValueField(wireName: r'visitorIdentification')
  VisitorIdentification get visitorIdentification;

  /// スマホのプッシュ通知用のID
  @BuiltValueField(wireName: r'registrationId')
  String get registrationId;

  @BuiltValueField(wireName: r'palettes')
  BuiltList<int> get palettes;

  /// 参加者が撮影した画像のID(ulid)
  @BuiltValueField(wireName: r'imageId')
  String? get imageId;

  /// 参加者が現在設定している画像のID(ulid)
  @BuiltValueField(wireName: r'currentImageId')
  String get currentImageId;

  Visitor._();

  factory Visitor([void updates(VisitorBuilder b)]) = _$Visitor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(VisitorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Visitor> get serializer => _$VisitorSerializer();
}

class _$VisitorSerializer implements PrimitiveSerializer<Visitor> {
  @override
  final Iterable<Type> types = const [Visitor, _$Visitor];

  @override
  final String wireName = r'Visitor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Visitor object, {
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
    if (object.imageId != null) {
      yield r'imageId';
      yield serializers.serialize(
        object.imageId,
        specifiedType: const FullType(String),
      );
    }
    yield r'currentImageId';
    yield serializers.serialize(
      object.currentImageId,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Visitor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required VisitorBuilder result,
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
        case r'imageId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.imageId = valueDes;
          break;
        case r'currentImageId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.currentImageId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Visitor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = VisitorBuilder();
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

