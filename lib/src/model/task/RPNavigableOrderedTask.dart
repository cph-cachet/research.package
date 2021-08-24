part of research_package_model;

/// The [RPNavigableOrderedTask] class adds conditional step navigation to the
/// behavior inherited from the [RPOrderedTask] class.
///
/// It's able to show different questions based on previous answers by using
/// [RPPredicateStepNavigationRule]s.
/// This task allows participant to go back to/looping through previous questions.
/// In that case only the last answer given to the question will be saved.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPNavigableOrderedTask extends RPOrderedTask {
  late Map<String, RPStepNavigationRule> _stepNavigationRules;

  RPNavigableOrderedTask({
    required String identifier,
    required List<RPStep> steps,
    closeAfterFinished = true,
  }) : super(
          identifier: identifier,
          steps: steps,
          closeAfterFinished: closeAfterFinished,
        ) {
    _stepNavigationRules = Map<String, RPStepNavigationRule>();
  }

  /// A dictionary of step identifier Strings and their corresponding navigation
  /// rule([RPStepNavigationRule]).
  Map<String, RPStepNavigationRule> get stepNavigationRules =>
      this._stepNavigationRules;

  /// Returns the step after a specified step if there's any, taking the
  /// [RPStepNavigationRule]s into consideration.
  ///
  /// If the specified step is `null` then it returns the first step.
  /// Returns `null` if [step] was the last one in the sequence.
  @override
  RPStep? getStepAfterStep(RPStep? step, RPTaskResult? result) {
    RPStep? _stepToReturn;

    void _returnNextQuestion() {
      int nextIndex = (step != null) ? steps.indexOf(step) + 1 : 0;

      if (nextIndex < steps.length) {
        _stepToReturn = steps[nextIndex];
      } else {
        _stepToReturn = null;
      }
    }

    if (step == null) {
      _stepToReturn = steps.first;
      return _stepToReturn;
    }

    if (_stepNavigationRules.containsKey(step.identifier)) {
      RPStepNavigationRule rule = _stepNavigationRules[step.identifier]!;

      switch (rule.runtimeType) {
        case RPStepReorganizerRule:
          RPStepResult tempResult =
              (rule as RPStepReorganizerRule).resultSelector.getResult();
          List identifiersToKeep = [];
          (tempResult.results["answer"] as List<RPChoice>).forEach((element) {
            String id = (rule).reorderingMap[element.value]!;
            identifiersToKeep.add(id);
          });

          steps.removeWhere(
              (step) => !identifiersToKeep.contains(step.identifier));

          if (steps.last.runtimeType == RPCompletionStep) {
            RPStep _lastStep = steps.last;
            steps.add(_lastStep);
          }

          _returnNextQuestion();

          break;
        case RPStepJumpRule:
          RPStepJumpRule jumpRule = (rule as RPStepJumpRule);
          RPStepResult tempResult = rule.resultSelector.getResult();
          String? answer = jumpRule.answerMap[tempResult.results["answer"].first.value];
          
          bool hadStepId = false;
          steps.forEach((step) {
            if (step.identifier == answer) {
              _stepToReturn = step;
              hadStepId = true;
            }
          });
          if (!hadStepId) {
            _returnNextQuestion();
          }

          break;
        case RPPredicateStepNavigationRule:
          (rule as RPPredicateStepNavigationRule)
              .resultPredicatesWithDestinationIdentifiers
              .forEach((resultPredicate, destinationStepIdentifier) {
            // Catching the first
            if (resultPredicate.getPredictionResult()) {
              steps.forEach((step) {
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
          String destinationStepIdentifier =
              (rule as RPDirectStepNavigationRule).destinationStepIdentifier;
          steps.forEach((step) {
            if (step.identifier == destinationStepIdentifier) {
              _stepToReturn = step;
            }
          });
          break;
        default:
          throw ("Navigation Rule's type ${_stepNavigationRules[step.identifier].runtimeType} is not a navigation rule type");
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
  void setNavigationRuleForTriggerStepIdentifier(
      RPStepNavigationRule stepNavigationRule, String triggerStepIdentifier) {
    _stepNavigationRules[triggerStepIdentifier] = stepNavigationRule;
  }

  /// Returns the navigation rule for the given step identifier
  RPStepNavigationRule navigationRuleForTriggerStepIdentifier(
      String triggerStepIdentifier) {
    return _stepNavigationRules[triggerStepIdentifier]!;
  }

  /// Removes the navigation rule from the given step using its identifier
  void removeNavigationRuleForTriggerStepIdentifier(
      String triggerStepIdentifier) {
    _stepNavigationRules.remove(triggerStepIdentifier);
  }

  Function get fromJsonFunction => _$RPNavigableOrderedTaskFromJson;
  factory RPNavigableOrderedTask.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPNavigableOrderedTask;
  Map<String, dynamic> toJson() => _$RPNavigableOrderedTaskToJson(this);
}
