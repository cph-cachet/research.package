part of research_package_model;

class RPOrderedTask extends RPTask {
  // This can be a list of Steps or FormStep
  List<RPStep> steps;

  RPOrderedTask(
    String identifier,
    this.steps,
  ) : super(identifier);

  @override
  RPStep getStepAfterStep(RPStep step, RPTaskResult result) {
    if (step == null) {
      return steps.first;
    }

    int nextIndex = steps.indexOf(step) + 1;

    if (nextIndex < steps.length) {
      return steps[nextIndex];
    }

    return null;
  }

  @override
  RPStep getStepBeforeStep(RPStep step, RPTaskResult result) {
    int nextIndex = steps.indexOf(step) - 1;

    if (nextIndex >= 0) {
      return steps[nextIndex];
    }

    return null;
  }

  @override
  RPStep getStepWithIdentifier(String identifier) {
    for (var step in steps) {
      if (identifier == step.identifier) {
        return step;
      }
    }

    return null;
  }

  @override
  RPTaskProgress getProgressOfCurrentStep(RPStep step, RPTaskResult result) {
    int current = step == null ? -1 : steps.indexOf(step);

    return RPTaskProgress(current, steps.length);
  }

  @override
  String getTitleForStep(RPStep step) {
    return step.title;
  }
}
