part of research_package_model;

/// The base class for steps which can compose a task.
///
/// Each [RPStep] object represents one logical piece of data entry or activity
/// in a larger task.
/// Whether your app is giving instructions, presenting a form or survey,
/// obtaining consent, or running an active task, everything in the Research
/// Package framework is a collection of steps ([RPStep] objects), which together
/// form a task (an [RPTask] object)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPStep extends Serializable {
  @JsonKey(ignore: true)
  late Widget _stepWidget;

  /// A unique identifier of the Step. This identifier connects the Step to its
  /// result ([RPResult]) object.
  final String identifier;

  /// The title text. Different types of Steps are using the [title] text differently.
  ///
  /// For e.g. the [title] of [RPCompletionStep] is rendered in the middle of
  /// the screen while the [title] of an [RPQuestionStep] is the text of the
  /// actual question.
  String title;

  /// The text of the Step. Different types of Steps are using the [text] text
  /// differently.
  ///
  /// For e.g. the [text] of [RPCompletionStep] is rendered in the middle of
  /// the screen while the
  /// [RPQuestionStep] does not even use it.
  String? text;

  /// If set to `true` the step can be skipped. In that case the result for
  /// the step will be `null`.
  bool optional;

  /// Create a step object with the given [title]. Different types of Steps
  /// are using the [title] text differently.
  RPStep(
      {required this.identifier,
      required this.title,
      this.text,
      this.optional = false});

  /// The widget (UI representation) of the step. [RPQuestionStep]s don't have it
  /// because their UI representation depends on the Answer Format.
  /// Their Answer Format is assessed by [RPUIQuestionStep] or [RPUIFormStep] and
  /// they return the corresponding UI.
  ///
  /// When needed, it should be overridden to fit the different types of Steps.
  Widget get stepWidget => _stepWidget;

  Function get fromJsonFunction => _$RPStepFromJson;
  factory RPStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPStep;
  Map<String, dynamic> toJson() => _$RPStepToJson(this);
}

/// Status to be sent to the Bloc so the Task Widget is notified about the navigation
enum RPStepStatus { Finished, Canceled, Ongoing, Back }
