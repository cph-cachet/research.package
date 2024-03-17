part of '../../../model.dart';

/// A [RPFormStep] is a special type of [RPQuestionStep], used for
/// presenting multiple questions on a single scrollable page.
///
/// Questions in the form is represented by an list of [questions] and all [questions]
/// needs to be answered (or be [optional]) in order to proceed from the form.
///
/// The result of an [RPFormStep] is an [RPStepResult] that consists further
/// [RPStepResult]s for each question in the form.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPFormStep extends RPQuestionStep {
  /// The list of questions to be shown on the form.
  List<RPQuestionStep> questions;

  /// Should any preliminary results from this form be collected and saved,
  /// even if [autoSkip] is enabled?
  ///
  /// If  true, when [timeout] is over whatever answers has been provided to far
  /// will be submitted.
  ///
  /// False by default.
  bool saveResultsOnAutoSkip;

  /// If `forceWait` is true, the [RPTimerStep] will only allow to move to next
  /// step after finishing the countdown. If 'false' the "next" will be possible
  /// respecting the mandatory/optional option defined above.
  /// This is `false` by default.
  bool forceWait;

  /// Create a new [RPFormStep] holding a list of [questions].
  RPFormStep({
    required super.identifier,
    required super.title,
    super.optional,
    super.autoSkip,
    super.timeout,
    required this.questions,
    this.saveResultsOnAutoSkip = false,
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
