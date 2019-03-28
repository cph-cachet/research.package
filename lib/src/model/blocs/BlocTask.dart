part of research_package_model;

class BlocTask {
  final _stepStatusController = StreamController<StepStatus>.broadcast();
  // Need to get the information after adding to the sink, that's why BehaviorSubject
  final _stepCountSubject = BehaviorSubject<int>();
  final _currentStepIndexController = BehaviorSubject<int>.seeded(1);
  final _stepResultController = StreamController<RPStepResult>.broadcast();
  final _taskResultStreamController = BehaviorSubject<RPTaskResult>();



  //Add data to stream
  Function(StepStatus) get sendStatus => _stepStatusController.sink.add;
  Function(int) get updateStepCount => _stepCountSubject.add;
  Function(int) get updateCurrentStepIndex => _currentStepIndexController.add;
  Function(RPStepResult) get sendStepResult => _stepResultController.add;
  Function(RPTaskResult) get updateTaskResult => _taskResultStreamController.sink.add;

  //Retrieve data from stream
  //TODO: .transform(StreamTransformer validator) do we need that?
  Stream<StepStatus> get stepStatus => _stepStatusController.stream;
  Stream<int> get stepCount => _stepCountSubject.stream;
  Stream<int> get currentStepIndex => _currentStepIndexController.stream;
  Stream<RPStepResult> get stepResult => _stepResultController.stream;
  Stream<RPTaskResult> get taskResult => _taskResultStreamController.stream;

  dispose() {
    _stepStatusController.close();
    _stepCountSubject.close();
    _currentStepIndexController.close();
    _stepResultController.close();
    _taskResultStreamController.close();
  }
}

final blocTask = BlocTask();
