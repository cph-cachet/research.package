part of '../../../model.dart';

/// Super class of the navigation rules. Do not use this type, only sub-classes.
/// Extend this to create a custom navigation rule.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPStepNavigationRule extends Serializable {
  RPStepNavigationRule();

  @override
  Function get fromJsonFunction => _$RPStepNavigationRuleFromJson;
  factory RPStepNavigationRule.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPStepNavigationRule;
  @override
  Map<String, dynamic> toJson() => _$RPStepNavigationRuleToJson(this);
}
