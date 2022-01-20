part of research_package_model;

/// The concrete subclass of [RPStep] that represents a step in which a single Activity is presented to the user.
///
/// When a Task Widget presents an [ActivityStep] object, it instantiates an [RPUIActivityStep] object to present the step.
/// The actual visual presentation depends on the type of [RPActivityStep] (e.g. [RPTrailMakingActivity]).
class RPActivityStep extends RPStep {
  /// Boolean controlling whether to show the intruction before the test.
  /// You may include your own [RPInstructionStep] before, if you wish to display other instructions.
  bool includeInstructions;

  /// Boolean controlling whether to show the results after the test.
  bool includeResults;

  /// The basic constructor which returns a Activity Step.
  /// The identifier is required for ID purposes.
  /// The optional parameters [includeInstructions] or [includeResults] can be used exclude the non-test sections of the step.
  RPActivityStep(String identifier,
      {this.includeInstructions = true, this.includeResults = true})
      : super(identifier: identifier, title: "RPActivityStep");

  /// The widget (UI representation) of the step.
  ///
  /// This gets initialized when a Activity Step has been added to a Task which is later presented by an [RPUITask] widget.
  @override
  Widget get stepWidget => RPUIActivityStep(this);

  /// stepBody initiates the UI component for an ActivityStep.
  ///
  /// All classes extending ActivityStep override this with their own UI components.
  Widget stepBody(dynamic Function(dynamic) onResultChange,
          RPActivityEventLogger eventLogger) =>
      Container();

  /// calculateScore calculates the score for an ActivityStep.
  ///
  /// All classes extending ActivityStep override this with their own scoring algorithm.
  calculateScore(dynamic result) {
    return 0;
  }
}
