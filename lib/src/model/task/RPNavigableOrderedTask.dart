part of research_package_model;

class RPNavigableOrderedTask extends RPOrderedTask {
  Map<String, RPStepNavigationRule> _stepNavigationRules;
  List<RPSkipStepNavigationRule> _skipStepNavigationRules;
  List<RPStepModifier> _stepModifiers;
  bool shouldReportProgress;

  RPNavigableOrderedTask(String identifier, steps, {closeAfterFinished = true, shouldReportProgress = true})
      : super(identifier, steps, closeAfterFinished: closeAfterFinished) {
    _stepNavigationRules = Map<String, RPStepNavigationRule>();
  }

  Map<String, RPStepNavigationRule> get stepNavigationRules => this._stepNavigationRules;
  List<RPSkipStepNavigationRule> get skipStepNavigationRules => this._skipStepNavigationRules;
  List<RPStepModifier> get stepModifiers => this._stepModifiers;
//  bool get shouldReportProgress => this._shouldReportProgress;

  @override
  RPStep getStepAfterStep(RPStep step, RPTaskResult result) {
    RPStep _stepToReturn;

    _returnNextQuestion() {
      int nextIndex = _steps.indexOf(step) + 1;

      if (nextIndex < _steps.length) {
        _stepToReturn = _steps[nextIndex];
      } else {
        _stepToReturn = null;
      }
    }

    if (step == null) {
      _stepToReturn = _steps.first;
      return _stepToReturn;
    }

    if (_stepNavigationRules.containsKey(step.identifier)) {
      RPStepNavigationRule rule = _stepNavigationRules[step.identifier];

      switch (rule.runtimeType) {
        case RPPredicateStepNavigationRule:
          (rule as RPPredicateStepNavigationRule)
              .resultPredicatesWithDestinationIdentifiers
              .forEach((resultPredicate, destinationStepIdentifier) {
            // Catching the first
//            if (resultPredicate.predictionResult) {
            if (resultPredicate.getPredictionResult()) {
              _steps.forEach((step) {
                if (step.identifier == destinationStepIdentifier) {
                  _stepToReturn = step;
                }
              });
            } else {
              _returnNextQuestion();
            }
          });
          break;
        case RPDirectStepNavigationRule:
          String destinationStepIdentifier = (rule as RPDirectStepNavigationRule).destinationStepIdentifier;
          _steps.forEach((step) {
            if (step.identifier == destinationStepIdentifier) {
              _stepToReturn = step;
            }
          });
          break;
        default:
          throw ("Navigation Rule's type ${_stepNavigationRules[step.identifier].runtimeType} is not a navigation rule type");
          break;
      }
    } else {
      _returnNextQuestion();
    }

    return _stepToReturn;
  }

  @override
  RPStep getStepBeforeStep(RPStep step, RPTaskResult result) {
    // TODO
    // step -> look up it's id in the navigationRule list
    // check the rule and return the right step afterwards
  }

  setNavigationRuleForTriggerStepIdentifier(RPStepNavigationRule stepNavigationRule, String triggerStepIdentifier) {
    _stepNavigationRules[triggerStepIdentifier] = stepNavigationRule;
  }

  RPStepNavigationRule navigationRuleForTriggerStepIdentifier(String triggerStepIdentifier) {
    return _stepNavigationRules[triggerStepIdentifier];
  }

  removeNavigationRuleForTriggerStepIdentifier(String triggerStepIdentifier) {
    _stepNavigationRules.remove(triggerStepIdentifier);
  }

  setSkipNavigationRule(RPSkipStepNavigationRule skipStepNavigationRule, String stepIdentifier) {
    // TODO
  }

  RPSkipStepNavigationRule skipNavigationRuleForStepIdentifier(String stepIdentifier) {
    // TODO
  }

  removeSkipNavigationRuleForStepIdentifier(String stepIdentifier) {
    // TODO
  }

  setStepModifier(RPStepModifier stepModifier, String stepIdentifier) {
    // TODO
  }

  RPStepModifier stepModifierForStepIdentifier(String stepIdentifier) {
    // TODO
  }

  removeStepModifierForStepIdentifier(String stepIdentifier) {
    // TODO
  }
}
