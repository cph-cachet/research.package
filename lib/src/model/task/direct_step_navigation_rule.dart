part of '../../../model.dart';

/// The [RPDirectStepNavigationRule] class can be used to unconditionally jump
/// to a destination step specified by its identifier or to finish the task early.
@JsonSerializable(
    fieldRename: FieldRename.snake, includeIfNull: false, explicitToJson: true)
class RPDirectStepNavigationRule extends RPStepNavigationRule {
  /// The identifier of the destination step to jump to
  String destinationStepIdentifier;

  RPDirectStepNavigationRule({required this.destinationStepIdentifier});

  @override
  Function get fromJsonFunction => _$RPDirectStepNavigationRuleFromJson;
  factory RPDirectStepNavigationRule.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson<RPDirectStepNavigationRule>(json);
  @override
  Map<String, dynamic> toJson() => _$RPDirectStepNavigationRuleToJson(this);
}
