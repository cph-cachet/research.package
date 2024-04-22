part of '../../../model.dart';

/// A simple linear task which implement the [RPTask] protocol. It shows the
/// steps one after another without the option of going back or branching.
///
/// For simple tasks the [RPOrderedTask] is perfect.
/// For more features (going back to previous questions, branching...) consider
/// using [RPNavigableOrderedTask] which inherited from this class.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPOrderedTask extends RPTask {
  int _numberOfQuestionSteps = 0;
  bool _isConsentTask = false;

  /// The list of [RPStep]s of the task
  List<RPStep> steps;

  RPOrderedTask({
    required super.identifier,
    super.closeAfterFinished = true,
    required this.steps,
  }) {
    for (var step in steps) {
      // Counting the Question or FormStep items
      if (step is RPQuestionStep) _numberOfQuestionSteps++;
      // If there's a Consent Review Step among the steps it means the task is
      // a Consent Task
      if (step.runtimeType == RPConsentReviewStep) {
        _isConsentTask = true;
      }
    }
  }

  /// Returns the step after a specified step if there's any. If the specified
  /// step is `null` then it returns the first step.
  ///
  /// Returns `null` if [step] was the last one in the sequence.
  @override
  RPStep? getStepAfterStep(RPStep? step, RPTaskResult? result) {
    step?.timer?.cancel();
    if (step == null) return steps.first;
    int nextIndex = steps.indexOf(step) + 1;
    if (nextIndex < steps.length) return steps[nextIndex];
    return null;
  }

  /// Returns the step that precedes the specified step, if there is one.
  /// If the specified step is `null` then it returns the last step.
  ///
  /// Returns `null` if [step] was the first one in the sequence.
  @override
  RPStep? getStepBeforeStep(RPStep? step, RPTaskResult? result) {
    step?.timer?.cancel();
    if (step == null) return steps.last;
    int nextIndex = steps.indexOf(step) - 1;
    if (nextIndex >= 0) return steps[nextIndex];
    return null;
  }

  /// Returns the step that matches the specified [identifier].
  /// Returns `null` if there is no step with the [identifier].
  @override
  RPStep? getStepWithIdentifier(String identifier) {
    for (var step in steps) {
      if (identifier == step.identifier) return step;
    }
    print("Problem: Task Steps out of index");
    return null;
  }

  @override
  String getTitleForStep(RPStep step) => step.title;

  /// Returns `true` if the task is a Consent Task. It is considered a
  /// Consent Task if it has an [RPConsentReviewStep]
  bool get isConsentTask => _isConsentTask;

  /// The number of question steps in the task
  int get numberOfQuestionSteps => _numberOfQuestionSteps;

  @override
  Function get fromJsonFunction => _$RPOrderedTaskFromJson;
  factory RPOrderedTask.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPOrderedTask;
  @override
  Map<String, dynamic> toJson() => _$RPOrderedTaskToJson(this);
}
