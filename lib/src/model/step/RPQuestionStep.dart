part of research_package_model;

class RPQuestionStep extends RPStep {
  RPAnswerFormat _answerFormat;
  String _placeholder;

  RPQuestionStep(String identifier) : super(identifier);

//  RPQuestionStep.withTitle(String identifier, String title) : super(identifier, title);

  RPAnswerFormat get answerFormat => _answerFormat;

  @override
  Widget get stepWidget => RPUIQuestionStep();

}