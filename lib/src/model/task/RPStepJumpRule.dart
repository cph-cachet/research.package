part of '../../../model.dart';

/// A navigation rule which maps from an answer to a step.
/// If an answer value is specified then the survey jumps to that question
/// if chosen. E.g.
/// ```
/// answerMap: {
///    3: instructionStepD.identifier,
///    2: instructionStepC.identifier,
///    1: instructionStepB.identifier,
///    0: instructionStepA.identifier
///  }
/// ```
/// If answer value 2 is taken then the survey will jump to `instructionStepC`
/// and continue from there.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPStepJumpRule extends RPStepNavigationRule {
  /// A map of `answer-value -> step-id` linking the possible values of the answer to step.
  /// If a specific value is chosen, the survey jumps to the targeted next step.
  /// E.g. :
  /// ```
  /// answerMap: {
  ///    3: instructionStepD.identifier,
  ///    2: instructionStepC.identifier,
  ///    1: instructionStepB.identifier,
  ///    0: instructionStepA.identifier
  ///  }
  /// ```
  Map<int, String> answerMap;

  RPStepJumpRule({required this.answerMap});

  @override
  Function get fromJsonFunction => _$RPStepJumpRuleFromJson;
  factory RPStepJumpRule.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPStepJumpRule;
  @override
  Map<String, dynamic> toJson() => _$RPStepJumpRuleToJson(this);
}
