part of research_package_model;

/// The [RPDirectStepNavigationRule] class can be used to unconditionally jump
/// to a destination step specified by its identifier or to finish the task early.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPDirectStepNavigationRule extends RPStepNavigationRule {
  /// The identifier of the destination step to jump to
  String destinationStepIdentifier;

  RPDirectStepNavigationRule({required this.destinationStepIdentifier});

  Function get fromJsonFunction => _$RPDirectStepNavigationRuleFromJson;
  factory RPDirectStepNavigationRule.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPDirectStepNavigationRule;
  Map<String, dynamic> toJson() => _$RPDirectStepNavigationRuleToJson(this);
}
