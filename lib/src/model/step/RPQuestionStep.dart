part of research_package_model;

/// A concrete subclass of [RPStep] that represents a step in which a single
/// question is presented to the user.
///
/// When a Task Widget presents an Question Step object, it instantiates an
/// [RPUIQuestionStep] object to present the step. The actual visual presentation
/// depends on the answer format ([RPAnswerFormat]).
/// When you need to present more than one question at the same time, it can be
/// appropriate to use [RPFormStep] instead of [RPQuestionStep].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPQuestionStep extends RPStep {
  /// The answer format which describes the format how a question can be answered.
  RPAnswerFormat answerFormat;

  /// The placeholder text for the Question Steps using an answer format which
  /// requires text entry
  String? placeholder;

  /// Creates a [RPQuestionStep].
  ///
  /// [identifier] is a unique id of this step,
  /// [title] is shown as the title of the question), and
  /// [answerFormat] defines the type of questionnaire, as defined in
  /// [RPAnswerFormat].
  RPQuestionStep({
    required super.identifier,
    required super.title,
    super.optional,
    required this.answerFormat,
  });

  @override
  Widget get stepWidget => RPUIQuestionStep(this);

  @override
  Function get fromJsonFunction => _$RPQuestionStepFromJson;
  factory RPQuestionStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPQuestionStep;
  @override
  Map<String, dynamic> toJson() => _$RPQuestionStepToJson(this);
}
