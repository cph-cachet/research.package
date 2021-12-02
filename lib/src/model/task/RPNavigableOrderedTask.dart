part of research_package_model;

/// The [RPNavigableOrderedTask] class adds conditional step navigation to the
/// behavior inherited from the [RPOrderedTask] class.
///
/// It's able to show different questions based on previous answers by using
/// [RPStepNavigationRule]s.
/// This task allows participant to go back to/looping through previous questions.
/// In that case only the last answer given to the question will be saved.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPNavigableOrderedTask extends RPOrderedTask {
  /// A dictionary of step identifier Strings and their corresponding navigation
  /// rule([RPStepNavigationRule]).
  late Map<String, RPStepNavigationRule> stepNavigationRules;

  RPNavigableOrderedTask({
    required String identifier,
    required List<RPStep> steps,
    closeAfterFinished = true,
  }) : super(
          identifier: identifier,
          steps: steps,
          closeAfterFinished: closeAfterFinished,
        ) {
    stepNavigationRules = Map<String, RPStepNavigationRule>();
  }

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

    if (stepNavigationRules.containsKey(step.identifier)) {
      RPStepNavigationRule rule = stepNavigationRules[step.identifier]!;

      switch (rule.runtimeType) {
        case RPStepReorganizerRule:
          RPStepReorganizerRule reorganizerRule = rule as RPStepReorganizerRule;
          RPStepResult? stepResult;
          if (step.runtimeType == RPFormStep) {
            RPTaskResult? _recentTaskResult = blocTask.lastTaskResult;
            RPStepResult? _foundStepResult;

            if (_recentTaskResult != null) {
              _recentTaskResult.results.forEach((key, stepResult) {
                try {
                  // By doing this we ensure that we are looking up only until the
                  // first match
                  _foundStepResult =
                      _foundStepResult ?? stepResult.results[step.identifier];
                } catch (e) {
                  print(
                      "No matching result found in this FormStep, proceeding to the next one (if any)");
                }
              });
            } else {
              throw ("Error: No task result is available");
            }
            stepResult = _foundStepResult;
          } else {
            RPTaskResult? _recentTaskResult = blocTask.lastTaskResult;
            RPStepResult _foundStepResult;

            if (_recentTaskResult != null) {
              _foundStepResult = _recentTaskResult.results[step.identifier];
            } else {
              throw ("Error: No task result is available");
            }
            stepResult = _foundStepResult;
          }

          List identifiersToKeep = [];
          (stepResult!.results["answer"] as List<RPChoice>).forEach((element) {
            String id = reorganizerRule.reorderingMap[element.value]!;
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
          RPStepResult? stepResult;
          if (step.runtimeType == RPFormStep) {
            RPTaskResult? _recentTaskResult = blocTask.lastTaskResult;
            RPStepResult? _foundStepResult;

            if (_recentTaskResult != null) {
              _recentTaskResult.results.forEach((key, stepResult) {
                try {
                  // By doing this we ensure that we are looking up only until the
                  // first match
                  _foundStepResult =
                      _foundStepResult ?? stepResult.results[step.identifier];
                } catch (e) {
                  print(
                      "No matching result found in this FormStep, proceeding to the next one (if any)");
                }
              });
            } else {
              throw ("Error: No task result is available");
            }
            stepResult = _foundStepResult;
          } else {
            RPTaskResult? _recentTaskResult = blocTask.lastTaskResult;
            RPStepResult _foundStepResult;

            if (_recentTaskResult != null) {
              _foundStepResult = _recentTaskResult.results[step.identifier];
            } else {
              throw ("Error: No task result is available");
            }
            stepResult = _foundStepResult;
          }

          String? answer =
              jumpRule.answerMap[stepResult!.results["answer"].first.value];

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
          throw ("Navigation Rule's type ${stepNavigationRules[step.identifier].runtimeType} is not a navigation rule type");
      }
    } else {
      _returnNextQuestion();
    }

    return _stepToReturn;
  }

  /// Adds a navigation rule to a step using its identifier.
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
    stepNavigationRules[triggerStepIdentifier] = stepNavigationRule;
  }

  /// Returns the navigation rule for the given step identifier
  RPStepNavigationRule navigationRuleForTriggerStepIdentifier(
      String triggerStepIdentifier) {
    return stepNavigationRules[triggerStepIdentifier]!;
  }

  /// Removes the navigation rule from the given step using its identifier
  void removeNavigationRuleForTriggerStepIdentifier(
      String triggerStepIdentifier) {
    stepNavigationRules.remove(triggerStepIdentifier);
  }

  Function get fromJsonFunction => _$RPNavigableOrderedTaskFromJson;
  factory RPNavigableOrderedTask.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPNavigableOrderedTask;
  Map<String, dynamic> toJson() => _$RPNavigableOrderedTaskToJson(this);
}
