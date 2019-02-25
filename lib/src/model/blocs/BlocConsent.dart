part of research_package_model;

class BlocConsent {
  final _stepStatusController = StreamController<StepStatus>.broadcast();

  //Add data to stream
  Function(StepStatus) get changeStatus => _stepStatusController.sink.add;

  //Retrieve data from stream
  Stream<StepStatus> get stepStatus =>
      _stepStatusController.stream; //TODO: .transform(StreamTransformer validator) do we need that?

  final _stepTypeController = StreamController<Type>.broadcast();

  Function(Type) get changeStepType => _stepTypeController.sink.add;

  Stream<Type> get stepType => _stepTypeController.stream;

  dispose() {
    _stepStatusController.close();
    _stepTypeController.close();
  }
}

final blocConsent = BlocConsent();
