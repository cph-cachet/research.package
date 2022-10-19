part of research_package_model;

/// The [RPFormStep] class is a concrete subclass of [RPQuestionStep], used for
/// presenting multiple questions on a single scrollable page.
///
/// Each question in the form is represented by an [RPQuestionStep].
/// All the question form [steps] needs to be answered in order to proceed.
/// The result of an [RPFormStep] is an [RPStepResult] that consists further
/// [RPStepResult]s for each question in the form.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPFormStep extends RPQuestionStep {
  /// The list of questions to be shown as part of the step.
  List<RPQuestionStep> steps;

  /// Create a new [RPFormStep] holding a list of [steps].
  RPFormStep({
    required super.identifier,
    required super.title,
    super.optional,
    required this.steps,
  }) : super(answerFormat: RPFormAnswerFormat());

  @override
  Widget get stepWidget => RPUIFormStep(this);

  @override
  Function get fromJsonFunction => _$RPFormStepFromJson;
  factory RPFormStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPFormStep;
  @override
  Map<String, dynamic> toJson() => _$RPFormStepToJson(this);
}
