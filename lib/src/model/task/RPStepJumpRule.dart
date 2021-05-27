part of research_package_model;

class RPStepJumpRule extends RPStepNavigationRule {
  String reorganizerStepId;
  late RPResultSelector _resultSelector;
  Map<dynamic, String> answerMap;

  RPStepJumpRule({required this.reorganizerStepId, required this.answerMap}) {
    _resultSelector = RPResultSelector.forStepId(reorganizerStepId);
  }

  get resultSelector => this._resultSelector;
}
