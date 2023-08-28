// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beacon_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BeaconEntity _$BeaconEntityFromJson(Map<String, dynamic> json) {
  return _BeaconEntity.fromJson(json);
}

/// @nodoc
mixin _$BeaconEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  BeaconProximity get proximity => throw _privateConstructorUsedError;
  String get hwid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BeaconEntityCopyWith<BeaconEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BeaconEntityCopyWith<$Res> {
  factory $BeaconEntityCopyWith(
          BeaconEntity value, $Res Function(BeaconEntity) then) =
      _$BeaconEntityCopyWithImpl<$Res, BeaconEntity>;
  @useResult
  $Res call({String id, String name, BeaconProximity proximity, String hwid});
}

/// @nodoc
class _$BeaconEntityCopyWithImpl<$Res, $Val extends BeaconEntity>
    implements $BeaconEntityCopyWith<$Res> {
  _$BeaconEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? proximity = null,
    Object? hwid = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      proximity: null == proximity
          ? _value.proximity
          : proximity // ignore: cast_nullable_to_non_nullable
              as BeaconProximity,
      hwid: null == hwid
          ? _value.hwid
          : hwid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BeaconEntityCopyWith<$Res>
    implements $BeaconEntityCopyWith<$Res> {
  factory _$$_BeaconEntityCopyWith(
          _$_BeaconEntity value, $Res Function(_$_BeaconEntity) then) =
      __$$_BeaconEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, BeaconProximity proximity, String hwid});
}

/// @nodoc
class __$$_BeaconEntityCopyWithImpl<$Res>
    extends _$BeaconEntityCopyWithImpl<$Res, _$_BeaconEntity>
    implements _$$_BeaconEntityCopyWith<$Res> {
  __$$_BeaconEntityCopyWithImpl(
      _$_BeaconEntity _value, $Res Function(_$_BeaconEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? proximity = null,
    Object? hwid = null,
  }) {
    return _then(_$_BeaconEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      proximity: null == proximity
          ? _value.proximity
          : proximity // ignore: cast_nullable_to_non_nullable
              as BeaconProximity,
      hwid: null == hwid
          ? _value.hwid
          : hwid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_BeaconEntity implements _BeaconEntity {
  const _$_BeaconEntity(
      {required this.id,
      required this.name,
      required this.proximity,
      required this.hwid});

  factory _$_BeaconEntity.fromJson(Map<String, dynamic> json) =>
      _$$_BeaconEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final BeaconProximity proximity;
  @override
  final String hwid;

  @override
  String toString() {
    return 'BeaconEntity(id: $id, name: $name, proximity: $proximity, hwid: $hwid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BeaconEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.proximity, proximity) ||
                other.proximity == proximity) &&
            (identical(other.hwid, hwid) || other.hwid == hwid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, proximity, hwid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BeaconEntityCopyWith<_$_BeaconEntity> get copyWith =>
      __$$_BeaconEntityCopyWithImpl<_$_BeaconEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BeaconEntityToJson(
      this,
    );
  }
}

abstract class _BeaconEntity implements BeaconEntity {
  const factory _BeaconEntity(
      {required final String id,
      required final String name,
      required final BeaconProximity proximity,
      required final String hwid}) = _$_BeaconEntity;

  factory _BeaconEntity.fromJson(Map<String, dynamic> json) =
      _$_BeaconEntity.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  BeaconProximity get proximity;
  @override
  String get hwid;
  @override
  @JsonKey(ignore: true)
  _$$_BeaconEntityCopyWith<_$_BeaconEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
