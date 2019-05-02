part of research_package_model;

// Note: The streams are open for the whole application run. Maybe the singleton solution is not the best and a new bloc instance is better to create each time it's needed.
/// The BLoC file for the communication between the task [RPUIOrderedTask] and its steps [RPStep].
class BlocTask {
  final _stepStatusController = StreamController<StepStatus>.broadcast();
  // Need to get the information after adding to the sink, that's why BehaviorSubject
  final _stepCountSubject = BehaviorSubject<int>();
  final _currentStepIndexController = BehaviorSubject<int>.seeded(1);
  final _stepResultController = StreamController<RPStepResult>.broadcast();

  //Add data to stream
  Function(StepStatus) get sendStatus => _stepStatusController.sink.add;
  Function(int) get updateStepCount => _stepCountSubject.add;
  Function(int) get updateCurrentStepIndex => _currentStepIndexController.add;
  Function(RPStepResult) get sendStepResult => _stepResultController.add;

  //Retrieve data from stream
  //TODO: .transform(StreamTransformer validator) do we need that?
  Stream<StepStatus> get stepStatus => _stepStatusController.stream;
  Stream<int> get stepCount => _stepCountSubject.stream;
  Stream<int> get currentStepIndex => _currentStepIndexController.stream;
  Stream<RPStepResult> get stepResult => _stepResultController.stream;

  dispose() {
    _stepStatusController.close();
    _stepCountSubject.close();
    _currentStepIndexController.close();
    _stepResultController.close();
  }
}

/// The singleton object of the task BLoC class which can be accessed throughout Research Package.
final blocTask = BlocTask();
