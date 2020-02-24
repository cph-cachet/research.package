part of research_package_model;

// TODO: Documentation
class RPPredicateStepNavigationRule extends RPStepNavigationRule {
  final String _defaultStepIdentifier;
  final Map<RPResultPredicate, String> _resultPredicatesWithDestinationIdentifiers;

  RPPredicateStepNavigationRule(this._resultPredicatesWithDestinationIdentifiers, [this._defaultStepIdentifier]);

  String get defaultStepIdentifier => this._defaultStepIdentifier;

  Map<RPResultPredicate, String> get resultPredicatesWithDestinationIdentifiers =>
      this._resultPredicatesWithDestinationIdentifiers;

  @override
  String identifierForDestinationStepWithTaskResult(RPTaskResult taskResult) {
    // TODO
    // Look up the steps based on the result and return the id
    // Must be overriden

    return "dummy";
  }
}
