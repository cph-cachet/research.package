part of research_package_model;

// TODO: Documentation
class RPPredicateStepNavigationRule extends RPStepNavigationRule {
  final List<RPResultPredicate> _resultPredicates;
  final List<String> _destinationStepIdentifiers;
  final String _defaultStepIdentifier;

  RPPredicateStepNavigationRule(this._destinationStepIdentifiers, this._resultPredicates,
      [this._defaultStepIdentifier]);

  List<RPResultPredicate> get resultPredicates => this._resultPredicates;
  List<String> get destinationStepIdentifiers => this._destinationStepIdentifiers;
  String get defaultStepIdentifier => this._defaultStepIdentifier;

  @override
  String identifierForDestinationStepWithTaskResult(RPTaskResult taskResult) {
    // TODO
    // Look up the steps based on the result and return the id
    // Must be overriden

    return "dummy";
  }
}
