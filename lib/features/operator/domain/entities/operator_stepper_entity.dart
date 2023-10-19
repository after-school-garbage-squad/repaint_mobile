import 'package:freezed_annotation/freezed_annotation.dart';

part 'operator_stepper_entity.freezed.dart';

part 'operator_stepper_entity.g.dart';

@freezed
class OperatorStepperEntity with _$OperatorStepperEntity {
  @JsonSerializable()
  const factory OperatorStepperEntity({
    @Default(0) int currentStep,
    @Default(0) int steps,
  }) = _OperatorStepperEntity;

  factory OperatorStepperEntity.fromJson(Map<String, dynamic> json) =>
      _$OperatorStepperEntityFromJson(json);
}
