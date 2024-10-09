part of '../../../model.dart';

/// Reorganizes the survey steps and removes all steps that arent specified by the [reorderingMap].
/// The survey will then go to the specified step
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class RPStepReorganizerRule extends RPStepNavigationRule {
  /// Those steps will be removed which are not selected
  Map<int, String> reorderingMap;

  RPStepReorganizerRule({required this.reorderingMap});

  @override
  Function get fromJsonFunction => _$RPStepReorganizerRuleFromJson;
  factory RPStepReorganizerRule.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson<RPStepReorganizerRule>(json);
  @override
  Map<String, dynamic> toJson() => _$RPStepReorganizerRuleToJson(this);
}
