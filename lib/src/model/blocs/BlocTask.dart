part of research_package_model;

// Note: The streams are open for the whole application run. Maybe the singleton solution is not the best and a new bloc instance is better to create each time it's needed.
/// The BLoC file for the communication between the task [RPUIOrderedTask] and its steps [RPStep].
class BlocTask {
  final _stepStatusController = StreamController<StepStatus>.broadcast();
  // Need to get the information after adding to the sink, that's why BehaviorSubject
  final _stepResultController = StreamController<RPStepResult>.broadcast();
  final _taskProgressController = BehaviorSubject<RPTaskProgress>();

  //Add data to stream
  Function(StepStatus) get sendStatus => _stepStatusController.sink.add;
  Function(RPStepResult) get sendStepResult => _stepResultController.add;
  Function(RPTaskProgress) get updateTaskProgress => _taskProgressController.add;

  //Retrieve data from stream
  //TODO: .transform(StreamTransformer validator) do we need that?
  Stream<StepStatus> get stepStatus => _stepStatusController.stream;
  Stream<RPStepResult> get stepResult => _stepResultController.stream;
  Stream<RPTaskProgress> get taskProgress => _taskProgressController.stream;

  // Other stream properties
  RPTaskProgress get lastProgressValue => _taskProgressController.stream.value;

  dispose() {
    _stepStatusController.close();
    _stepResultController.close();
    _taskProgressController.close();
  }
}

/// The singleton object of the task BLoC class which can be accessed throughout Research Package.
final blocTask = BlocTask();
