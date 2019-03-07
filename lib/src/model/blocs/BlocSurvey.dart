part of research_package_model;

class BlocSurvey {
  final _stepStatusController = StreamController<StepStatus>.broadcast();

  //Add data to stream
  Function(StepStatus) get changeStatus => _stepStatusController.sink.add;

  //Retrieve data from stream
  Stream<StepStatus> get stepStatus =>
      _stepStatusController.stream; //TODO: .transform(StreamTransformer validator) do we need that?

  dispose() {
    _stepStatusController.close();
  }
}

final blocSurvey = BlocSurvey();
