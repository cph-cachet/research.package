part of research_package_model;

class BlocTask {
  final _stepStatusController = StreamController<StepStatus>.broadcast();
  // Need to get the information after adding to the sink, that's why BehaviorSubject
  final _stepCountSubject = BehaviorSubject<int>();
  final _currentStepIndexController = BehaviorSubject<int>.seeded(1);

  //Add data to stream
  Function(StepStatus) get sendStatus => _stepStatusController.sink.add;
  Function(int) get updateStepCount => _stepCountSubject.add;
  Function(int) get updateCurrentStepIndex => _currentStepIndexController.add;

  //Retrieve data from stream
  Stream<StepStatus> get stepStatus =>
      _stepStatusController.stream; //TODO: .transform(StreamTransformer validator) do we need that?
  Stream<int> get stepCount =>
      _stepCountSubject.stream; //TODO: .transform(StreamTransformer validator) do we need that?
  Stream<int> get currentStepIndex =>
      _currentStepIndexController.stream; //TODO: .transform(StreamTransformer validator) do we need that?

  dispose() {
    _stepStatusController.close();
    _stepCountSubject.close();
    _currentStepIndexController.close();
  }
}

final blocTask = BlocTask();
