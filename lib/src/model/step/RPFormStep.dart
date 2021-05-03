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

  /// The answer format of Form Step will always return [RPFormAnswerFormat]
  late RPAnswerFormat answerFormat;

  RPFormStep(
      {required String identifier,
      required this.steps,
      required String title,
      bool optional = false})
      : super(identifier, title: title, optional: optional) {
    this.answerFormat = RPFormAnswerFormat();
  }

  /// The widget (UI representation) of Form Step.
  ///
  /// This gets initialized when a Form Step has been added to a Task which is
  /// later presented by an [RPUITask] widget.
  /// It shows the FormStep's [steps] in a scrollable list
  @override
  Widget get stepWidget => RPUIFormStep(this);

  Function get fromJsonFunction => _$RPFormStepFromJson;
  factory RPFormStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json);
  Map<String, dynamic> toJson() => _$RPFormStepToJson(this);
}
