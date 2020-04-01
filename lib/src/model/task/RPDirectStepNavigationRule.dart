part of research_package_model;

/// The [RPDirectStepNavigationRule] class can be used to unconditionally jump to a destination step specified by its identifier or to finish the task early.
class RPDirectStepNavigationRule extends RPStepNavigationRule {
  String _destinationStepIdentifier;

  RPDirectStepNavigationRule(this._destinationStepIdentifier);

  /// The identifier of the destination step to jump to
  String get destinationStepIdentifier => this._destinationStepIdentifier;
}
