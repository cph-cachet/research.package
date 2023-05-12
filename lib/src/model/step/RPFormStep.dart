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

  /// If `autoSkip` is true, the [RPTimerStep] will move to the next step once
  /// it has finished counting down.
  /// This is `false` by default.
  @override
  bool autoSkip;

  /// 'timeout' defines how many seconds we wait for the answer before
  /// automatically skipping to the next step.
  /// This is 0 seconds by default.
  @override
  Duration timeout;

  /// When 'autoskip' is enabled, the user may not have time to answer and
  /// press 'next' to submit their answer.
  /// If 'autoSubmit' is true, the moment the timer finishes whatever the answer
  /// is will be final and submitted.
  /// This is `false` by default.
  bool autoSubmit;

  /// If `forceWait` is true, the [RPTimerStep] will only allow to move to next
  /// step after finishing the countdown. If 'false' the "next" will be possible
  /// respecting the mandatory/optional option defined above.
  /// This is `false` by default.
  bool forceWait;

  /// Create a new [RPFormStep] holding a list of [steps].
  RPFormStep({
    required super.identifier,
    required super.title,
    super.optional,
    required this.steps,
    this.autoSkip = false,
    this.timeout = const Duration(seconds: 0),
    this.autoSubmit = false,
    this.forceWait = false,
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
