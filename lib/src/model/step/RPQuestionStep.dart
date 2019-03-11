part of research_package_model;

class RPQuestionStep extends RPStep {
  RPAnswerFormat _answerFormat;
  String _placeholder;

  RPQuestionStep(String identifier) : super(identifier);
  RPQuestionStep.withTitle(String identifier, String title) : super.withTitle(identifier, title);
  RPQuestionStep.withAnswerFormat(String identifier, String title, this._answerFormat)
      : super.withTitle(identifier, title);

  RPAnswerFormat get answerFormat => _answerFormat;

  set answerFormat(RPAnswerFormat answerFormat) {
    this._answerFormat = answerFormat;
  }
  String get placeholder => _placeholder;

  set placeholder(String placeholder) {
    this._placeholder = placeholder;
  }

  @override
  Widget get stepWidget => RPUIQuestionStep(this);

}
