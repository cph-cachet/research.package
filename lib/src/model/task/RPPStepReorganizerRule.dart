part of research_package_model;

/// A navigation rule which based on predicate(s)'s ([RPResultPredicate]) result(s).
///
/// By using [RPPredicateStepNavigationRule] different questions can be shown
/// based on the result of previously answered questions.
/// The [RPPredicateStepNavigationRule] checks the predicate [RPResultPredicate]
/// and if it's true, puts the destination step as next in the sequence.
/// (Destination step identifiers are declared in the [resultPredicatesWithDestinationIdentifiers])
class RPStepReorganizerRule extends RPStepNavigationRule {
  late RPResultSelector _resultSelector;

  /// Those steps will be removed which are not selected
  Map<dynamic, String> reorderingMap;

  RPStepReorganizerRule(
      {required String reorganizerStepId, required this.reorderingMap}) {
    _resultSelector = RPResultSelector.forStepId(reorganizerStepId);
  }

  get resultSelector => this._resultSelector;
}
