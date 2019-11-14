part of research_package_model;

/// The [RPFormStep] class is a concrete subclass of [RPQuestionStep], used for presenting multiple questions on a single scrollable page.
///
/// Each question in the form is represented by an [RPQuestionStep]. All the question form [steps] needs to be answered in order
/// to proceed.
/// The result of an [RPFormStep] is an [RPStepResult] that consists further [RPStepResult]s for each question in the form.
class RPFormStep extends RPQuestionStep {
  List<RPQuestionStep> _formSteps;
  RPAnswerFormat _answerFormat;

  RPFormStep(String identifier, this._formSteps) : super(identifier) {
    this._answerFormat = RPFormAnswerFormat();
  }

  RPFormStep.withTitle(String identifier, this._formSteps, String title) : super.withTitle(identifier, title) {
    this._answerFormat = RPFormAnswerFormat();
  }

  /// The list of questions to be shown as part of the step.
  List<RPQuestionStep> get steps => this._formSteps;

  set steps(List<RPQuestionStep> steps) {
    this._formSteps = steps;
  }

  /// The answer format of Form Step will always return [RPFormAnswerFormat]
  RPAnswerFormat get answerFormat => _answerFormat;

  set answerFormat(RPAnswerFormat answerFormat) {
    this._answerFormat = answerFormat;
  }

  /// The widget (UI representation) of Form Step.
  ///
  /// This gets initialized when a Form Step has been added to a Task which is later presented by an [RPUIOrderedTask] widget.
  @override
  Widget get stepWidget => RPUIFormStep(this);
}
