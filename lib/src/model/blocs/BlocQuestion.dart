part of research_package_model;

// This class is mainly responsible for the communication between the Question Container (RPUIQuestionStep) and the Question Body (Widgets in ui/questionbody)
class BlocQuestion {
  final _questionStatusController = StreamController<QuestionStatus>.broadcast();
  // Stream for the questionBody to send the actual answerValue to the questionContainer so that can create the stepresult object.
  final _questionBodyResultController = BehaviorSubject<RPQuestionBodyResult>();
  // Stream

  //Add data to stream
  Function(QuestionStatus) get sendStatus => _questionStatusController.sink.add;
  Function(RPQuestionBodyResult) get sendResultValue => _questionBodyResultController.sink.add;

  //Retrieve data from stream
  //TODO: .transform(StreamTransformer validator) do we need that?
  Stream<QuestionStatus> get questionStatus => _questionStatusController.stream;
  Stream<RPQuestionBodyResult> get resultValue => _questionBodyResultController.stream;

  dispose() {
    _questionStatusController.close();
    _questionBodyResultController.close();
  }
}

final blocQuestion = BlocQuestion();
