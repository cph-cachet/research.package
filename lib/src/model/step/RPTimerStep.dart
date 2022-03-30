part of research_package_model;

/// The concrete subclass of [RPStep] that represents a step in which a the
/// user waits for [timeout] before being allowed to proceed to next question.
///
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTimerStep extends RPStep {
  /// The time the user must wait before being able to continue to next step.
  Duration timeout;

  /// The text displayed above the timer, indicating why the user has to wait
  /// a certain amount of time before the next step.
  String title;

  /// If `playSound` is true, the [RPTimerStep] will play a sound when the timer
  /// has finished counting down.
  /// This is `false` by default.
  bool playSound;

  /// Creates a Timer Step with an identifier, title and duration.
  /// The [RPTimerStep] is a step in which the user waits for [timeout]
  /// before being allowed to proceed to next question.
  RPTimerStep(
      {required String identifier,
      required this.timeout,
      required this.title,
      this.playSound = false,
      bool optional = false})
      : super(identifier: identifier, title: title, optional: optional);

  /// The widget (UI representation) of the step.
  ///
  /// This gets initialized when a Timer Step has been added to a Task which
  /// is later presented by an [RPUITask] widget.
  @override
  Widget get stepWidget => RPUITimerStep(this);

  Function get fromJsonFunction => _$RPTimerStepFromJson;
  factory RPTimerStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPTimerStep;
  Map<String, dynamic> toJson() => _$RPTimerStepToJson(this);
}
