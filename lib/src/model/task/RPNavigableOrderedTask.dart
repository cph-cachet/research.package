part of research_package_model;

class RPNavigableOrderedTask extends RPOrderedTask {
  // TODO: variables

  List<RPStepNavigationRule> _stepNavigationRules; // TODO: Might be a dictionary

  RPNavigableOrderedTask(String identifier, steps, this._stepNavigationRules, closeAfterFinished)
      : super(identifier, steps, closeAfterFinished: closeAfterFinished);

  List<RPStepNavigationRule> get stepNavigationRules => this._stepNavigationRules;

  @override
  RPStep getStepAfterStep(RPStep step, RPTaskResult result) {
    // TODO
  }

  @override
  RPStep getStepBeforeStep(RPStep step, RPTaskResult result) {
    // TODO
  }




// TODO: do we need setter?
//  set stepNavigationRules(RPStepNavigationRule stepNavigationRules) {
//    this._stepNavigationRules = stepNavigationRules;
//  }

}
