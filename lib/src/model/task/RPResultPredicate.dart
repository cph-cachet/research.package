part of research_package_model;

// TODO: Documentation
class RPResultPredicate {
  dynamic expectedValue;
  RPResultSelector _resultSelector;
  bool Function() getPredictionResult;
  bool _predictionResult;

  // TODO: Documentation
  RPResultPredicate.forBooleanQuestionResult(
      {@required RPResultSelector resultSelector, @required bool expectedValue}) {
    this._resultSelector = resultSelector;
    this.expectedValue = expectedValue;

    getPredictionResult = directPredictionResult;
  }

  // TODO: Documentation
  /// Result predicate for choice question types. The [expectedValue] here should correspond to the value of an [RPChoice] object.
  RPResultPredicate.forChoiceQuestionResult(
      {@required RPResultSelector resultSelector, @required List<int> expectedValue}) {
    this._resultSelector = resultSelector;
    this.expectedValue = expectedValue;

    getPredictionResult = choiceValuePredictionResult;
  }

  bool directPredictionResult() {
    // TODO: what happens with the form step?
    // it's result dictionary has multiple items

    RPStepResult resultFromResultSelector = _resultSelector.getResult();

    if (resultFromResultSelector.results[RPStepResult.DEFAULT_KEY] == expectedValue) {
      this._predictionResult = true;
    } else {
      this._predictionResult = false;
    }

    return this._predictionResult;
  }

  bool choiceValuePredictionResult() {
    // TODO: what happens with the form step?
    // it's result dictionary has multiple items

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

class RPResultSelector {
  Function() getResult;

  RPResultSelector.forStepId(String stepId) {
    getResult = () {
      return _resultForStepId(stepId);
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
