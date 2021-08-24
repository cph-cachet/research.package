part of research_package_model;

/// Reorganizes the survey steps and removes all steps that arent specified by the [reorderingMap].
/// The survey will then go to the specified step
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
