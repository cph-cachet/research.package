part of research_package_model;

/// The concrete subclass of [RPStep] that represents a step in which a the
/// user waits for [timeout] before being allowed to proceed to next question.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTimerStep extends RPStep {
  /// The time the user must wait before being able to continue to next step.
  Duration timeout;

  /// Should we play a sound when the timer has finished counting down.
  /// False by default.
  bool playSound;

  /// Should we automatically move to the next step once finished counting down?
  /// False by default.
  bool autoSkip;

  /// Should the time remaining be shown while counting down.
  /// If false only the title will be shown.
  /// True by default.
  bool showTime;

  /// Creates a Timer Step with an identifier, title and duration.
  /// The [RPTimerStep] is a step in which the user waits for [timeout]
  /// before being allowed to proceed to next question.
  RPTimerStep({
    required super.identifier,
    required super.title,
    super.optional,
    required this.timeout,
    this.playSound = false,
    this.autoSkip = false,
    this.showTime = true,
  });

  @override
  Widget get stepWidget => RPUITimerStep(this);

  @override
  Function get fromJsonFunction => _$RPTimerStepFromJson;
  factory RPTimerStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPTimerStep;
  @override
  Map<String, dynamic> toJson() => _$RPTimerStepToJson(this);
}
