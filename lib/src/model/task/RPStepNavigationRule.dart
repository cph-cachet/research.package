part of research_package_model;

/// Super class of the navigation rules. Do not use this type, only sub-classes.
/// Extend this to create a custom navigation rule.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPStepNavigationRule extends Serializable {
  RPStepNavigationRule();

  Function get fromJsonFunction => _$RPStepNavigationRuleFromJson;
  factory RPStepNavigationRule.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPStepNavigationRule;
  Map<String, dynamic> toJson() => _$RPStepNavigationRuleToJson(this);
}
