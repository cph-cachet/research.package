part of '../../../model.dart';

// Note: The streams are open for the whole application run. Maybe the singleton
// solution is not the best and a new bloc instance is better to create each time it's needed.

/// The BLoC for the communication between the [RPUITask] and its
/// steps [RPStep].
class BlocTask {
  final _stepStatusController = StreamController<RPStepStatus>.broadcast();
  // Need to get the information after adding to the sink, that's why BehaviorSubject
  final _stepResultController = StreamController<RPResult>.broadcast();
  final _taskProgressController = BehaviorSubject<RPTaskProgress>();
  final _taskResultController = BehaviorSubject<RPTaskResult>.seeded(
      RPTaskResult(identifier: 'BaseTaskResultID'));

  //Add data to stream

  /// The function to update the current status of the question
  ///
  /// Based on the status the task will navigate to the next question and manage
  /// the result of the question
  void Function(RPStepStatus) get sendStatus => _stepStatusController.sink.add;

  /// The function to send the latest result of the step to the task
  ///
  /// Usually it's called as part of the [createAndSendResult] implementation
  /// in those classes which are
  /// implementing the [CanSaveResult] abstract class
  void Function(RPResult) get sendStepResult => _stepResultController.add;

  /// The function to update the task progress. The task progress is shown in
  /// the appbar on top of the screen. It shows how many questions are there in
  /// total and where the participant stands in the process so far.
  void Function(RPTaskProgress) get updateTaskProgress =>
      _taskProgressController.add;

  /// The function to update the task result which is shown in the AppBar
  /// for [RPOrderedTask]
  void Function(RPTaskResult) get updateTaskResult => _taskResultController.add;

  //Retrieve data from stream

  /// The stream conveying the current step status
  Stream<RPStepStatus> get stepStatus => _stepStatusController.stream;

  /// The stream communicating the latest result of the current step
  Stream<RPResult> get stepResult => _stepResultController.stream;

  /// The stream having the latest progress of the task
  Stream<RPTaskProgress> get taskProgress => _taskProgressController.stream;

  // Other stream properties
  RPTaskProgress? get lastProgressValue => _taskProgressController.stream.value;

  /// The current state of the Task Result which can be accessed throughout
  /// the framework
  RPTaskResult? get lastTaskResult => _taskResultController.stream.value;

  void dispose() {
    _stepStatusController.close();
    _stepResultController.close();
    _taskProgressController.close();
    _taskResultController.close();
  }
}

/// The singleton object of the task BLoC class which can be accessed
/// throughout Research Package
final blocTask = BlocTask();
