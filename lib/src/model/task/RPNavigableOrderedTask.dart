part of research_package_model;

/// The [RPNavigableOrderedTask] class adds conditional step navigation to the behavior inherited from the [RPOrderedTask] class.
///
/// It's able to show different questions based on previous answers by using [RPPredicateStepNavigationRule]s.
/// This task allows participant to go back to/looping through previous questions. In that case only the last answer given to the question will be saved.
class RPNavigableOrderedTask extends RPOrderedTask {
  Map<String, RPStepNavigationRule> _stepNavigationRules;
//  List<RPSkipStepNavigationRule> _skipStepNavigationRules;
//  List<RPStepModifier> _stepModifiers;
  bool shouldReportProgress;

  RPNavigableOrderedTask(String identifier, steps, {closeAfterFinished = true, shouldReportProgress = true})
      : super(identifier, steps, closeAfterFinished: closeAfterFinished) {
    _stepNavigationRules = Map<String, RPStepNavigationRule>();
  }

  /// A dictionary of step identifier Strings and their corresponding navigation rule([RPStepNavigationRule]).
  Map<String, RPStepNavigationRule> get stepNavigationRules => this._stepNavigationRules;

//  List<RPSkipStepNavigationRule> get skipStepNavigationRules => this._skipStepNavigationRules;
//  List<RPStepModifier> get stepModifiers => this._stepModifiers;
//  bool get shouldReportProgress => this._shouldReportProgress;

  /// Returns the step after a specified step if there's any taking the [RPStepNavigationRule]s into consideration.
  ///
  /// If the specified step is ```null``` then it returns the first step.
  /// Returns ```null``` if [step] was the last one in the sequence.
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

  /// Adds a navigation rule to step using its identifier.
  ///
  /// ```
  ///   RPNavigableOrderedTask navigableSurveyTask = RPNavigableOrderedTask(
  ///     "NavigableTaskID",
  ///     [
  ///       instructionStep,
  ///       questionStep1,
  ///       questionStep2,
  ///     ],
  ///   )
  ///   ..setNavigationRuleForTriggerStepIdentifier(someNavigationRule, questionStep1.identifier);
  /// ```
  setNavigationRuleForTriggerStepIdentifier(RPStepNavigationRule stepNavigationRule, String triggerStepIdentifier) {
    _stepNavigationRules[triggerStepIdentifier] = stepNavigationRule;
  }

  /// Returns the navigation rule for the given step identifier
  RPStepNavigationRule navigationRuleForTriggerStepIdentifier(String triggerStepIdentifier) {
    return _stepNavigationRules[triggerStepIdentifier];
  }

  /// Removes the navigation rule from the given step using its identifier
  removeNavigationRuleForTriggerStepIdentifier(String triggerStepIdentifier) {
    _stepNavigationRules.remove(triggerStepIdentifier);
  }

//  setSkipNavigationRule(RPSkipStepNavigationRule skipStepNavigationRule, String stepIdentifier) {
//    // TODO
//  }

//  RPSkipStepNavigationRule skipNavigationRuleForStepIdentifier(String stepIdentifier) {
//    // TODO
//  }

//  removeSkipNavigationRuleForStepIdentifier(String stepIdentifier) {
//    // TODO
//  }

//  setStepModifier(RPStepModifier stepModifier, String stepIdentifier) {
//    // TODO
//  }

//  RPStepModifier stepModifierForStepIdentifier(String stepIdentifier) {
//    // TODO
//  }

//  removeStepModifierForStepIdentifier(String stepIdentifier) {
//    // TODO
//  }
}
