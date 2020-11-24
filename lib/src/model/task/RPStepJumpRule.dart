part of research_package_model;

class RPStepJumpRule extends RPStepNavigationRule {
  String _jumpStepId;
  RPResultSelector _resultSelector;
  Map<dynamic, String> _answerMap;

  RPStepJumpRule(String reorganizerStepId, Map<dynamic, String> answerMap) {
    this._jumpStepId = reorganizerStepId;
    _resultSelector = RPResultSelector.forStepId(reorganizerStepId);
    this._answerMap = answerMap;
  }

  get resultSelector => this._resultSelector;
}
