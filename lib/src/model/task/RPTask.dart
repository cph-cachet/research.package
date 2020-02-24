part of research_package_model;

/// The [RPTask] abstract class defines a task to be carried out by a participant in a research study.
///
/// Extend this protocol to enable dynamic selection of the steps for a given task.
/// By default, [RPOrderedTask] extends this abstract class for simple sequential tasks.
/// Each step ([RPStep]) in a task roughly corresponds to one screen through their [stepWidget] Widget,
/// and represents the primary unit of work in any task presented by a task view controller.
abstract class RPTask {
  final String _identifier;

  RPTask(this._identifier, {this.closeAfterFinished});

  /// A unique identifier of the Task. This identifier connects the Task to its result ([RPTaskResult]) object.
  String get identifier => _identifier;

  /// Returns the step after a specified step if there's any.
  RPStep getStepAfterStep(RPStep step, RPTaskResult result);

  /// Returns the step that precedes the specified step, if there is one.
  RPStep getStepBeforeStep(RPStep step, RPTaskResult result);

  /// Returns the step that matches the specified [identifier].
  RPStep getStepWithIdentifier(String identifier);

//  /// Returns the progress of the current step.
//  RPTaskProgress getProgressOfCurrentStep(RPStep step, RPTaskResult result);

  /// Returns the title of a given [step]
  String getTitleForStep(RPStep step);

  /// If set to ```true``` the Task will close after the participant has finished the task. If it's set to ```false``` no navigation function is called.
  ///
  /// Navigation or closing is still possible for example in the [onSubmit] function of [RPUIOrderedTask].
  bool closeAfterFinished;

  //TODO: Validates the task parameters.
}

/// Simple class for keeping track the progress of the task. It contains the number of the current step and the total number of steps.
///
/// Used by the counter in [RPUIQuestionStep] in the App Bar
class RPTaskProgress {
  int _current;
  int _total;

  RPTaskProgress(this._current, this._total);

  /// Number of the current step
  get current => this._current;

  /// Total number of steps in task
  get total => this._total;
}
