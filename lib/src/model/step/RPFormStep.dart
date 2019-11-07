part of research_package_model;

class RPFormStep extends RPQuestionStep {
  List<RPQuestionStep> _formSteps;
  RPAnswerFormat _answerFormat;

  RPFormStep(String identifier, this._formSteps) : super(identifier);

  RPFormStep.withTitle(String identifier, this._formSteps, String title) : super.withTitle(identifier, title);

  RPFormStep.withAnswerFormat(String identifier, String title, this._formSteps, this._answerFormat)
      : super.withTitle(identifier, title);

  List<RPQuestionStep> get steps => this._formSteps;

  set steps(List<RPQuestionStep> steps) {
    this._formSteps = steps;
  }

  /// The answer format which describes the format how a question can be answered.
  RPAnswerFormat get answerFormat => _answerFormat;

  set answerFormat(RPAnswerFormat answerFormat) {
    this._answerFormat = answerFormat;
  }

  @override
  Widget get stepWidget => RPUIFormStep(this);
}
