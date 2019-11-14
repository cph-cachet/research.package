part of research_package_model;

/// The concrete subclass of [RPStep] that represents a step in which a single question is presented to the user.
///
/// When a Task Widget presents an Question Step object, it instantiates an [RPUIQuestionStep] object to present the step. The actual visual presentation depends on the answer format ([RPAnswerFormat]).
/// When you need to present more than one question at the same time, it can be appropriate to use [RPFormStep] instead of [RPQuestionStep].
class RPQuestionStep extends RPStep {
  RPAnswerFormat _answerFormat;
  String _placeholder;

  /// The basic constructor which returns a Question Step with only the identifier filled out
  RPQuestionStep(String identifier) : super(identifier);

  /// Returns a Question Step populated with title (text of the question)
  RPQuestionStep.withTitle(String identifier, String title) : super.withTitle(identifier, title);

  /// Returns a Question Step populated with title (text of the question) and answer format on which the
  /// actual layout depends
  RPQuestionStep.withAnswerFormat(String identifier, String title, this._answerFormat)
      : super.withTitle(identifier, title);

  /// The answer format which describes the format how a question can be answered.
  RPAnswerFormat get answerFormat => _answerFormat;

  /// The placeholder text for the Question Steps using an answer format which requires text entry
  String get placeholder => _placeholder;

  set answerFormat(RPAnswerFormat answerFormat) {
    this._answerFormat = answerFormat;
  }

  set placeholder(String placeholder) {
    this._placeholder = placeholder;
  }

  /// The widget (UI representation) of the step.
  ///
  /// This gets initialized when a Question Step has been added to a Task which is later presented by an [RPUIOrderedTask] widget.
  @override
  Widget get stepWidget => RPUIQuestionStep(this);
}
