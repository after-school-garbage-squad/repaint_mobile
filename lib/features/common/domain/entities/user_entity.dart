import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

enum UserType {
  @JsonValue('visitor')
  visitor,
  @JsonValue('operator')
  operator,
  @JsonValue('unknown')
  unknown,
}

@freezed
class UserEntity with _$UserEntity {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory UserEntity({
    @Default(UserType.unknown) UserType type,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
