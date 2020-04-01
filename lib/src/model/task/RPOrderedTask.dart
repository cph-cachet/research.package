part of research_package_model;

/// A simple linear task which implement the [RPTask] protocol. It shows the steps one after another without the option of going back or branching.
///
/// For simple tasks the [RPOrderedTask] is perfect.
/// For more features (going back to previous questions, branching...) consider using [RPNavigableOrderedTask] which inherited from this class.
class RPOrderedTask extends RPTask {
  List<RPStep> _steps;
  int _numberOfQuestionSteps;
  bool _isConsentTask;

  RPOrderedTask(String identifier, this._steps, {bool closeAfterFinished = true})
      : super(identifier, closeAfterFinished: closeAfterFinished) {
    this._numberOfQuestionSteps = 0;
    this._isConsentTask = false;

    steps.forEach((step) {
      // Counting the Question or FormStep items
      if (step is RPQuestionStep) this._numberOfQuestionSteps++;
      // If there's a Consent Review Step among the steps it means the task is a Consent Task
      if (step.runtimeType == RPConsentReviewStep) {
        _isConsentTask = true;
      }
    });
  }

  /// The list of [RPStep]s of the task
  List<RPStep> get steps => this._steps;

  /// Returns the step after a specified step if there's any. If the specified step is ```null``` then it returns the first step.
  ///
  /// Returns ```null``` if [step] was the last one in the sequence.
  @override
  RPStep getStepAfterStep(RPStep step, RPTaskResult result) {
    if (step == null) {
      return _steps.first;
    }

    int nextIndex = _steps.indexOf(step) + 1;

    if (nextIndex < _steps.length) {
      return _steps[nextIndex];
    }

    return null;
  }

  /// Returns the step that precedes the specified step, if there is one. If the specified step is ```null``` then it returns the last step.
  ///
  /// Returns ```null``` if [step] was the first one in the sequence.
  @override
  RPStep getStepBeforeStep(RPStep step, RPTaskResult result) {
    if (step == null) {
      return _steps.last;
    }

    int nextIndex = _steps.indexOf(step) - 1;

    if (nextIndex >= 0) {
      return _steps[nextIndex];
    }

    return null;
  }

  /// Returns the step that matches the specified [identifier]. Returns ```null``` if there is no step with the [identifier].
  @override
  RPStep getStepWithIdentifier(String identifier) {
    for (var step in _steps) {
      if (identifier == step.identifier) {
        return step;
      }
    }
    print("Problem: Task Steps out of index");
    return null;
  }

//  @override
//  RPTaskProgress getProgressOfCurrentStep(RPStep step, RPTaskResult result) {
//    int current = step == null ? -1 : _steps.indexOf(step);
//
//    return RPTaskProgress(current, _steps.length);
//  }

  @override
  String getTitleForStep(RPStep step) {
    return step.title;
  }

  /// Returns ```true``` if the task is a Consent Task. It is considered a Consent Task if it has an [RPConsentReviewStep]
  bool get isConsentTask => this._isConsentTask;

  /// The number of question steps in the task
  int get numberOfQuestionSteps => this._numberOfQuestionSteps;
}
