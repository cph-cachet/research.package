part of research_package_model;

// TODO: Documentation
class RPDirectStepNavigationRule extends RPStepNavigationRule {
  String _destinationStepIdentifier;

  RPDirectStepNavigationRule(this._destinationStepIdentifier);

  String get destinationStepIdentifier => this._destinationStepIdentifier;

  @override
  String identifierForDestinationStepWithTaskResult(RPTaskResult taskResult) {
    // TODO
    // Look up the steps based on the result and return the id
    // Must be overriden

    return "dummy";
  }
}
