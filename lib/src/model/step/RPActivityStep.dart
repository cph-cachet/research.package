part of '../../../model.dart';

/// A concrete subclass of [RPStep] that represents a step in which a single
/// Activity is presented to the user.
///
/// When a Task Widget presents an [RPActivityStep] object, it instantiates an
/// [RPUIActivityStep] object to present the step.
/// The actual visual presentation depends on the type of [RPActivityStep]
/// (e.g. [RPTrailMakingActivity] from the cognition_package Flutter package).
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPActivityStep extends RPStep {
  /// Show the instruction before the test?
  ///
  /// You may include your own [RPInstructionStep] step before this activity step,
  /// if you wish to display a separate page with other instructions.
  bool includeInstructions;

  /// Show the results after the test?
  bool includeResults;

  /// Create a [RPActivityStep].
  ///
  /// The [identifier] should uniquely identify this step.
  /// The optional parameters [includeInstructions] or [includeResults] can be
  /// used exclude the non-test sections of the step.
  RPActivityStep({
    required super.identifier,
    this.includeInstructions = true,
    this.includeResults = true,
  }) : super(title: "RPActivityStep");

  /// The widget (UI representation) of the step.
  ///
  /// This gets initialized when a Activity Step has been added to a Task which
  /// is later presented by an [RPUITask] widget.
  @override
  Widget get stepWidget => RPUIActivityStep(this);

  /// Initiates the UI component for an ActivityStep.
  ///
  /// All classes extending an activity step should override this with their
  /// own UI components.
  Widget stepBody(dynamic Function(dynamic) onResultChange,
          RPActivityEventLogger eventLogger) =>
      Container();

  /// Calculates the score for this activity step.
  ///
  /// Classes extending this activity step can override this method with a
  /// custom scoring  algorithm.
  int calculateScore(dynamic result) => 0;

  @override
  Function get fromJsonFunction => _$RPActivityStepFromJson;
  factory RPActivityStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPActivityStep;
  @override
  Map<String, dynamic> toJson() => _$RPActivityStepToJson(this);
}
