part of research_package_model;

class RPStepResult<T> extends RPResult {
  Map<String, T> _results;
  RPAnswerFormat _answerFormat;

  //When StepResult only has a single value, pair that value with the following key
  static const String DEFAULT_KEY = "answer";

  RPStepResult(RPStep step) : super(step.identifier) {
    this._results = Map();

    if (step.runtimeType == RPQuestionStep) {
      this._answerFormat = (step as RPQuestionStep).answerFormat;
    }

    startDate = DateTime.now();
  }

  Map<String, T> get results => _results;

  RPAnswerFormat get answerFormat => _answerFormat;

  set results(Map<String, T> results) {
    this._results = results;
  }

  T getResultForIdentifier(String identifier) => _results[identifier];

  void setResultForIdentifier(String identifier, T result) {
    this._results[identifier] = result;
  }

  void setResult(T result) {
    setResultForIdentifier(DEFAULT_KEY, result);
    this.endDate = DateTime.now();
  }
}
