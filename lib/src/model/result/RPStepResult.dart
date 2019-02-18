part of research_package_model;

class RPStepResult<T> extends RPResult {
  Map<String, T> _results;
  RPAnswerFormat _answerFormat;

  RPStepResult(RPStep step) : super(step._identifier) {
    this._results = Map();

    if (step.runtimeType == RPQuestionStep) {
      this._answerFormat = (step as RPQuestionStep).answerFormat;
    }

    startDate = DateTime.now();
    endDate = DateTime.now();
  }

  Map<String, T> get results => _results;

  RPAnswerFormat get answerFormat => _answerFormat;

  set results(Map<String, T> results) {
    this._results = results;
  }

  void getResultForIdentifier(String identifier) => results[identifier];

  void setResultForIdentifier(String identifier, T result) {
    this._results[identifier] = result;
  }
}
