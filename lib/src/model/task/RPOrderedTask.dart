part of research_package_model;

class RPOrderedTask extends RPTask {
  List<RPStep> _steps;

  RPOrderedTask(String identifier, this._steps, {bool closeAfterFinished = true})
      : super(identifier, closeAfterFinished: closeAfterFinished);

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
}
