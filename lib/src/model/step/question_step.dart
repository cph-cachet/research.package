part of '../../../model.dart';

/// Represents a [RPStep] holding a single question to be presented to the user.
///
/// The rendering of an [RPQuestionStep] depends on its [answerFormat].
/// Each answer type has its own user interface widget.
///
/// If you want to present multiple questions on the same page, use an [RPFormStep].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPQuestionStep extends RPStep {
  RPUIQuestionStep? _widget;

  /// The answer format which describes the format how a question can be answered.
  RPAnswerFormat answerFormat;

  /// The placeholder text for the Question Steps using an answer format which
  /// requires text entry
  String? placeholder;

  /// Should we automatically move to the next step after [timeout] seconds?
  /// False by default.
  bool autoSkip;

  /// If [autoSkip] is true, defines how long to wait for the answer
  /// before automatically skipping to the next step.
  Duration timeout;

  /// Should the keyboard automatically be displayed when asking a text question?
  /// Applies only to [RPTextAnswerFormat] questions.
  /// False by default.
  bool autoFocus;

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
    this.autoSkip = false,
    this.timeout = const Duration(seconds: 0),
    this.autoFocus = false,
  });

  @override
  Widget get stepWidget => _widget ??= RPUIQuestionStep(this);

  @override
  Function get fromJsonFunction => _$RPQuestionStepFromJson;
  factory RPQuestionStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPQuestionStep;
  @override
  Map<String, dynamic> toJson() => _$RPQuestionStepToJson(this);
}
