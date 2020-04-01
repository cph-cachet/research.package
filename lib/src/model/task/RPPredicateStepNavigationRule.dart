part of research_package_model;

/// A navigation rule which based on predicate(s)'s ([RPResultPredicate]) result(s).
///
/// By using [RPPredicateStepNavigationRule] different questions can be shown based on the result of previously answered questions.
/// What the [RPPredicateStepNavigationRule] does is that it checks the predicate [RPResultPredicate] and if it's true, puts the
/// destination step as next in the sequence. (Destination step identifiers are declared in the [resultPredicatesWithDestinationIdentifiers])
class RPPredicateStepNavigationRule extends RPStepNavigationRule {
  final String _defaultStepIdentifier;
  final Map<RPResultPredicate, String> _resultPredicatesWithDestinationIdentifiers;

  RPPredicateStepNavigationRule(this._resultPredicatesWithDestinationIdentifiers, [this._defaultStepIdentifier]);

  String get defaultStepIdentifier => this._defaultStepIdentifier;

  /// A dictionary of result predicates and their associated destination step identifiers.
  /// If the predicate proves to be true, the destination identifier's step will be pushed as next in the step sequence.
  /// A navigation rule can have multiple result predicates and based on these different predicates the task jumps to
  /// different destination steps.
  Map<RPResultPredicate, String> get resultPredicatesWithDestinationIdentifiers =>
      this._resultPredicatesWithDestinationIdentifiers;
}
