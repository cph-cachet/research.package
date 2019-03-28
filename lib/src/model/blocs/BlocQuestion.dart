part of research_package_model;

// This class is mainly responsible for the communication between the Question Container (RPUIQuestionStep) and the Question Body (Widgets in ui/questionbody)
class BlocQuestion {
  final _questionStatusController = StreamController<QuestionStatus>.broadcast();
  // Stream for the questionbody to send the actual answervalue to the questioncontainer so that can create the stepresult object.
  final _answerValueController = BehaviorSubject<RPQuestionBodyResult>();

  //Add data to stream
  Function(QuestionStatus) get sendStatus => _questionStatusController.sink.add;
  Function(dynamic) get sendAnswerValue => _answerValueController.sink.add;

  //Retrieve data from stream
  Stream<QuestionStatus> get questionStatus =>
      _questionStatusController.stream; //TODO: .transform(StreamTransformer validator) do we need that?

  Stream<dynamic> get answerValue =>
      _answerValueController.stream; //TODO: .transform(StreamTransformer validator) do we need that?

  dispose() {
    _questionStatusController.close();
    _answerValueController.close();
  }
}

final blocQuestion = BlocQuestion();
