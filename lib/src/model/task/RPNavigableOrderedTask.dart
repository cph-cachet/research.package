part of research_package_model;

class RPNavigableOrderedTask extends RPOrderedTask {
  List<RPStepNavigationRule> _stepNavigationRules; // TODO: Might be a dictionary
  List<RPSkipStepNavigationRule> _skipStepNavigationRules;
  List<RPStepModifier> _stepModifiers;
  bool shouldReportProgress;

  RPNavigableOrderedTask(String identifier, steps, this._stepNavigationRules, closeAfterFinished,
      {shouldReportProgress = true})
      : super(identifier, steps, closeAfterFinished: closeAfterFinished);

  List<RPStepNavigationRule> get stepNavigationRules => this._stepNavigationRules;
  List<RPSkipStepNavigationRule> get skipStepNavigationRules => this._skipStepNavigationRules;
  List<RPStepModifier> get stepModifiers => this._stepModifiers;
//  bool get shouldReportProgress => this._shouldReportProgress;

  @override
  RPStep getStepAfterStep(RPStep step, RPTaskResult result) {
    // TODO
  }

  @override
  RPStep getStepBeforeStep(RPStep step, RPTaskResult result) {
    // TODO
  }

  setNavigationRule(RPStepNavigationRule stepNavigationRule, String forTriggerStepIdentifier) {
    // TODO
  }

  RPStepNavigationRule navigationRuleForTriggerStepIdentifier(String triggerStepIdentifier) {
    // TODO
  }

  removeNavigationRuleForTriggerStepIdentifier(String triggerStepIdentifier) {
    // TODO
  }

  setSkipNavigationRule(RPSkipStepNavigationRule skipStepNavigationRule, String forStepIdentifier) {
    // TODO
  }

  RPSkipStepNavigationRule skipNavigationRuleForStepIdentifier(String stepIdentifier) {
    // TODO
  }

  removeSkipNavigationRuleForStepIdentifier(String stepIdentifier) {
    // TODO
  }

  setStepModifier(RPStepModifier stepModifier, String forStepIdentifier) {
    // TODO
  }

  RPStepModifier stepModifierForStepIdentifier(String stepIdentifier) {
    // TODO
  }

  removeStepModifierForStepIdentifier(String stepIdentifier) {
    // TODO
  }
}
