part of '../../../model.dart';

/// A step where the user is forced to wait for [timeout] before being allowed
/// to proceed to the next step.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTimerStep extends RPStep {
  /// The time the user must wait before being able to continue.
  Duration timeout;

  /// Play a sound when the timer has finished counting down? False by default.
  bool playSound;

  /// Automatically move to the next step once finished counting down? False by default.
  bool autoSkip;

  /// Should the remaining time be shown while counting down?
  /// If false only the title will be shown. True by default.
  bool showTime;

  /// Creates a [RPTimerStep] with an [identifier], [title] and [timeout].
  ///
  /// The [RPTimerStep] is a step in which the user waits for [timeout]
  /// before being allowed to proceed. If [showTime] is true, a count down is shown.
  ///
  /// When the time is up, a sound is played if [playSound] is true and
  /// automatically moves to the next step, if [autoSkip] is true.
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
