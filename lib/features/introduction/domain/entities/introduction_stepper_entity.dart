import 'package:freezed_annotation/freezed_annotation.dart';

part 'introduction_stepper_entity.freezed.dart';
part 'introduction_stepper_entity.g.dart';

@freezed
class IntroductionStepperEntity with _$IntroductionStepperEntity {
  @JsonSerializable()
  const factory IntroductionStepperEntity({
    @Default(0) int currentStep,
    @Default(0) int steps,
  }) = _IntroductionStepperEntity;

  factory IntroductionStepperEntity.fromJson(Map<String, dynamic> json) =>
      _$IntroductionStepperEntityFromJson(json);
}
