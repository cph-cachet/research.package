part of research_package_model;

// This class is mainly responsible for the communication between the Question Container (RPUIQuestionStep) and the Question Body (Widgets in ui/questionbody)
class BlocQuestion {
  final _questionStatusController = StreamController<QuestionStatus>.broadcast();

  //Add data to stream
  Function(QuestionStatus) get sendStatus => _questionStatusController.sink.add;

  //Retrieve data from stream
  Stream<QuestionStatus> get questionStatus =>
      _questionStatusController.stream; //TODO: .transform(StreamTransformer validator) do we need that?

  dispose() {
    _questionStatusController.close();
  }
}

final blocQuestion = BlocQuestion();
