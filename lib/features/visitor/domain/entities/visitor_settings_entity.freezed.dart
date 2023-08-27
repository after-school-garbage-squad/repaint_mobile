// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visitor_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VisitorNotifications _$VisitorNotificationsFromJson(Map<String, dynamic> json) {
  return _VisitorNotifications.fromJson(json);
}

/// @nodoc
mixin _$VisitorNotifications {
  bool get spotEntry => throw _privateConstructorUsedError;
  bool get eventAnnouncement => throw _privateConstructorUsedError;
  bool get other => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorNotificationsCopyWith<VisitorNotifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorNotificationsCopyWith<$Res> {
  factory $VisitorNotificationsCopyWith(VisitorNotifications value,
          $Res Function(VisitorNotifications) then) =
      _$VisitorNotificationsCopyWithImpl<$Res, VisitorNotifications>;
  @useResult
  $Res call({bool spotEntry, bool eventAnnouncement, bool other});
}

/// @nodoc
class _$VisitorNotificationsCopyWithImpl<$Res,
        $Val extends VisitorNotifications>
    implements $VisitorNotificationsCopyWith<$Res> {
  _$VisitorNotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotEntry = null,
    Object? eventAnnouncement = null,
    Object? other = null,
  }) {
    return _then(_value.copyWith(
      spotEntry: null == spotEntry
          ? _value.spotEntry
          : spotEntry // ignore: cast_nullable_to_non_nullable
              as bool,
      eventAnnouncement: null == eventAnnouncement
          ? _value.eventAnnouncement
          : eventAnnouncement // ignore: cast_nullable_to_non_nullable
              as bool,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VisitorNotificationsCopyWith<$Res>
    implements $VisitorNotificationsCopyWith<$Res> {
  factory _$$_VisitorNotificationsCopyWith(_$_VisitorNotifications value,
          $Res Function(_$_VisitorNotifications) then) =
      __$$_VisitorNotificationsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool spotEntry, bool eventAnnouncement, bool other});
}

/// @nodoc
class __$$_VisitorNotificationsCopyWithImpl<$Res>
    extends _$VisitorNotificationsCopyWithImpl<$Res, _$_VisitorNotifications>
    implements _$$_VisitorNotificationsCopyWith<$Res> {
  __$$_VisitorNotificationsCopyWithImpl(_$_VisitorNotifications _value,
      $Res Function(_$_VisitorNotifications) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? spotEntry = null,
    Object? eventAnnouncement = null,
    Object? other = null,
  }) {
    return _then(_$_VisitorNotifications(
      spotEntry: null == spotEntry
          ? _value.spotEntry
          : spotEntry // ignore: cast_nullable_to_non_nullable
              as bool,
      eventAnnouncement: null == eventAnnouncement
          ? _value.eventAnnouncement
          : eventAnnouncement // ignore: cast_nullable_to_non_nullable
              as bool,
      other: null == other
          ? _value.other
          : other // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _$_VisitorNotifications implements _VisitorNotifications {
  const _$_VisitorNotifications(
      {this.spotEntry = true,
      this.eventAnnouncement = true,
      this.other = true});

  factory _$_VisitorNotifications.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorNotificationsFromJson(json);

  @override
  @JsonKey()
  final bool spotEntry;
  @override
  @JsonKey()
  final bool eventAnnouncement;
  @override
  @JsonKey()
  final bool other;

  @override
  String toString() {
    return 'VisitorNotifications(spotEntry: $spotEntry, eventAnnouncement: $eventAnnouncement, other: $other)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorNotifications &&
            (identical(other.spotEntry, spotEntry) ||
                other.spotEntry == spotEntry) &&
            (identical(other.eventAnnouncement, eventAnnouncement) ||
                other.eventAnnouncement == eventAnnouncement) &&
            (identical(other.other, this.other) || other.other == this.other));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, spotEntry, eventAnnouncement, other);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitorNotificationsCopyWith<_$_VisitorNotifications> get copyWith =>
      __$$_VisitorNotificationsCopyWithImpl<_$_VisitorNotifications>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorNotificationsToJson(
      this,
    );
  }
}

abstract class _VisitorNotifications implements VisitorNotifications {
  const factory _VisitorNotifications(
      {final bool spotEntry,
      final bool eventAnnouncement,
      final bool other}) = _$_VisitorNotifications;

  factory _VisitorNotifications.fromJson(Map<String, dynamic> json) =
      _$_VisitorNotifications.fromJson;

  @override
  bool get spotEntry;
  @override
  bool get eventAnnouncement;
  @override
  bool get other;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorNotificationsCopyWith<_$_VisitorNotifications> get copyWith =>
      throw _privateConstructorUsedError;
}

VisitorSettingsEntity _$VisitorSettingsEntityFromJson(
    Map<String, dynamic> json) {
  return _VisitorSettingsEntity.fromJson(json);
}

/// @nodoc
mixin _$VisitorSettingsEntity {
  VisitorNotifications get notifications => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VisitorSettingsEntityCopyWith<VisitorSettingsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitorSettingsEntityCopyWith<$Res> {
  factory $VisitorSettingsEntityCopyWith(VisitorSettingsEntity value,
          $Res Function(VisitorSettingsEntity) then) =
      _$VisitorSettingsEntityCopyWithImpl<$Res, VisitorSettingsEntity>;
  @useResult
  $Res call({VisitorNotifications notifications});

  $VisitorNotificationsCopyWith<$Res> get notifications;
}

/// @nodoc
class _$VisitorSettingsEntityCopyWithImpl<$Res,
        $Val extends VisitorSettingsEntity>
    implements $VisitorSettingsEntityCopyWith<$Res> {
  _$VisitorSettingsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as VisitorNotifications,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $VisitorNotificationsCopyWith<$Res> get notifications {
    return $VisitorNotificationsCopyWith<$Res>(_value.notifications, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_VisitorSettingsEntityCopyWith<$Res>
    implements $VisitorSettingsEntityCopyWith<$Res> {
  factory _$$_VisitorSettingsEntityCopyWith(_$_VisitorSettingsEntity value,
          $Res Function(_$_VisitorSettingsEntity) then) =
      __$$_VisitorSettingsEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({VisitorNotifications notifications});

  @override
  $VisitorNotificationsCopyWith<$Res> get notifications;
}

/// @nodoc
class __$$_VisitorSettingsEntityCopyWithImpl<$Res>
    extends _$VisitorSettingsEntityCopyWithImpl<$Res, _$_VisitorSettingsEntity>
    implements _$$_VisitorSettingsEntityCopyWith<$Res> {
  __$$_VisitorSettingsEntityCopyWithImpl(_$_VisitorSettingsEntity _value,
      $Res Function(_$_VisitorSettingsEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
  }) {
    return _then(_$_VisitorSettingsEntity(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as VisitorNotifications,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$_VisitorSettingsEntity implements _VisitorSettingsEntity {
  const _$_VisitorSettingsEntity(
      {this.notifications = const VisitorNotifications()});

  factory _$_VisitorSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$$_VisitorSettingsEntityFromJson(json);

  @override
  @JsonKey()
  final VisitorNotifications notifications;

  @override
  String toString() {
    return 'VisitorSettingsEntity(notifications: $notifications)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VisitorSettingsEntity &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, notifications);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VisitorSettingsEntityCopyWith<_$_VisitorSettingsEntity> get copyWith =>
      __$$_VisitorSettingsEntityCopyWithImpl<_$_VisitorSettingsEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_VisitorSettingsEntityToJson(
      this,
    );
  }
}

abstract class _VisitorSettingsEntity implements VisitorSettingsEntity {
  const factory _VisitorSettingsEntity(
      {final VisitorNotifications notifications}) = _$_VisitorSettingsEntity;

  factory _VisitorSettingsEntity.fromJson(Map<String, dynamic> json) =
      _$_VisitorSettingsEntity.fromJson;

  @override
  VisitorNotifications get notifications;
  @override
  @JsonKey(ignore: true)
  _$$_VisitorSettingsEntityCopyWith<_$_VisitorSettingsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
