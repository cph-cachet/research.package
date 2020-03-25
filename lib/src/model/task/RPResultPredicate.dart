part of research_package_model;

/// This class examines a prediction and communicates its result to an [RPStepNavigationRule].
///
/// It checks whether the [expectedValue] is identical to the result's value. It digs down the result hierarchy with the help of [RPResultSelector].
class RPResultPredicate {
  dynamic expectedValue;
  RPResultSelector _resultSelector;
  bool Function() getPredictionResult;
  bool _predictionResult;

  /// Result predicate for the boolean answer format [RPBooleanAnswerFormat]. The [expectedValue] here should be a boolean.
  RPResultPredicate.forBooleanQuestionResult(
      {@required RPResultSelector resultSelector, @required bool expectedValue}) {
    this._resultSelector = resultSelector;
    this.expectedValue = expectedValue;

    getPredictionResult = directPredictionResult;
  }

  /// Result predicate for choice question types. The [expectedValue] here should correspond to the [value] of an [RPChoice] object.
  RPResultPredicate.forChoiceQuestionResult(
      {@required RPResultSelector resultSelector, @required List<int> expectedValue}) {
    this._resultSelector = resultSelector;
    this.expectedValue = expectedValue;

    getPredictionResult = choiceValuePredictionResult;
  }

  bool directPredictionResult() {
    RPStepResult resultFromResultSelector = _resultSelector.getResult();

    if (resultFromResultSelector.results[RPStepResult.DEFAULT_KEY] == expectedValue) {
      this._predictionResult = true;
    } else {
      this._predictionResult = false;
    }

    return this._predictionResult;
  }

  bool choiceValuePredictionResult() {
    Function eq = const ListEquality().equals;
    (expectedValue as List<int>).sort();
    RPStepResult resultFromResultSelector = _resultSelector.getResult();
    this._predictionResult = false;

    try {
      List<int> results = List<int>();
      (resultFromResultSelector.results[RPStepResult.DEFAULT_KEY] as List<RPChoice>).forEach((choice) {
        results.add(choice.value);
      });
      results.sort();

      if (eq(results,expectedValue)) {
        this._predictionResult = true;
      }
    } catch (e) {
      this._predictionResult = false;
    }

    return this._predictionResult;
  }
}

/// This class identifies the needed test result for the [RPResultPredicate]
class RPResultSelector {
  Function() getResult;

  /// Use this constructor if the step which the navigation rule is bound to, is a regular step
  RPResultSelector.forStepId(String stepId) {
    getResult = () {
      return _resultForStepId(stepId);
    };
  }

  /// Use this constructor if the step the navigation rule is bound to is part of a Form Step. (Form Steps have different result structure)
  RPResultSelector.forStepIdInFormStep(String stepId) {
    getResult = () {
      return _resultForStepIdInFormStep(stepId);
    };
  }

  RPStepResult _resultForStepId(String stepIdentifier) {
    RPTaskResult _recentTaskResult = blocTask.lastTaskResult;
    RPStepResult _foundStepResult;

    if (_recentTaskResult != null) {
      _foundStepResult = _recentTaskResult.results[stepIdentifier];
    } else {
      throw ("Error: No task result is available");
    }

    return _foundStepResult;
  }

  RPStepResult _resultForStepIdInFormStep(String stepIdentifier) {
    RPTaskResult _recentTaskResult = blocTask.lastTaskResult;
    RPStepResult _foundStepResult;

    if (_recentTaskResult != null) {
      _recentTaskResult.results.forEach((key, stepResult) {
        try {
          // By doing this we ensure that we are looking up only until the first match
          _foundStepResult = _foundStepResult ?? stepResult.results[stepIdentifier];
        } catch(e) {
          print("No matching result found in this FormStep, proceeding to the next one (if any)");
        }
      });
    } else {
      throw ("Error: No task result is available");
    }

    return _foundStepResult;
  }

//  RPResultSelector.forStepAndTaskId(String stepId, String taskId) {
//    // TODO
//    _returnedStepResult = RPStepResult();
//  }
//
//  RPResultSelector.forResultId(String resultId) {
//    // TODO
//    _returnedStepResult = RPStepResult();
//  }
//
//  RPResultSelector.forStepAndResultId(String stepId, String resultId) {
//    // TODO
//    _returnedStepResult = RPStepResult();
//  }
//
//  RPResultSelector.forTaskAndResultId(String taskId, String resultId) {
//    // TODO
//    _returnedStepResult = RPStepResult();
//  }
}
