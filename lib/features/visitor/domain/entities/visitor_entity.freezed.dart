// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorEntity _$VisitorEntityFromJson(Map<String, dynamic> json) {
  return _VisitorEntity.fromJson(json);
}

/// @nodoc
mixin _$VisitorEntity {
  VisitorSettingsEntity get settings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorEntityCopyWith<VisitorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorEntityCopyWith<$Res> {
  factory $VisitorEntityCopyWith(
          VisitorEntity value, $Res Function(VisitorEntity) then) =
      _$VisitorEntityCopyWithImpl<$Res, VisitorEntity>;
  @useResult
  $Res call({VisitorSettingsEntity settings});

  $VisitorSettingsEntityCopyWith<$Res> get settings;
}

/// @nodoc
class _$VisitorEntityCopyWithImpl<$Res, $Val extends VisitorEntity>
    implements $VisitorEntityCopyWith<$Res> {
  _$VisitorEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
  }) {
    return _then(_value.copyWith(
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as VisitorSettingsEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitorSettingsEntityCopyWith<$Res> get settings {
    return $VisitorSettingsEntityCopyWith<$Res>(_value.settings, (value) {
      return _then(_value.copyWith(settings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VisitorEntityCopyWith<$Res>
    implements $VisitorEntityCopyWith<$Res> {
  factory _$$_VisitorEntityCopyWith(
          _$_VisitorEntity value, $Res Function(_$_VisitorEntity) then) =
      __$$_VisitorEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VisitorSettingsEntity settings});

  @override
  $VisitorSettingsEntityCopyWith<$Res> get settings;
}

/// @nodoc
class __$$_VisitorEntityCopyWithImpl<$Res>
    extends _$VisitorEntityCopyWithImpl<$Res, _$_VisitorEntity>
    implements _$$_VisitorEntityCopyWith<$Res> {
  __$$_VisitorEntityCopyWithImpl(
      _$_VisitorEntity _value, $Res Function(_$_VisitorEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
  }) {
    return _then(_$_VisitorEntity(
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as VisitorSettingsEntity,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_VisitorEntity implements _VisitorEntity {
  const _$_VisitorEntity({this.settings = const VisitorSettingsEntity()});

  factory _$_VisitorEntity.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorEntityFromJson(json);

  @override
  @JsonKey()
  final VisitorSettingsEntity settings;

  @override
  String toString() {
    return 'VisitorEntity(settings: $settings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorEntity &&
            (identical(other.settings, settings) ||
                other.settings == settings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, settings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitorEntityCopyWith<_$_VisitorEntity> get copyWith =>
      __$$_VisitorEntityCopyWithImpl<_$_VisitorEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorEntityToJson(
      this,
    );
  }
}

abstract class _VisitorEntity implements VisitorEntity {
  const factory _VisitorEntity({final VisitorSettingsEntity settings}) =
      _$_VisitorEntity;

  factory _VisitorEntity.fromJson(Map<String, dynamic> json) =
      _$_VisitorEntity.fromJson;

  @override
  VisitorSettingsEntity get settings;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorEntityCopyWith<_$_VisitorEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
