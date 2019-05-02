part of research_package_model;

/// The BLoC file for the communication between the question container [RPUIQuestionStep] and the question body
///
/// This class is mainly responsible for the communication between the Question Container ([RPUIQuestionStep]) and the Question Body (Widgets in ui/questionbody)
class BlocQuestion {
  final _questionStatusController = StreamController<QuestionStatus>.broadcast();
  // Stream for the questionBody to send the actual answerValue to the questionContainer so that can create the stepresult object.
  final _questionBodyResultController = BehaviorSubject<RPQuestionBodyResult>();
  // Stream

  //Add data to stream
  /// The function to send a [QuestionStatus] through a stream
  ///
  /// Usually used by a QuestionBody like [RPUIQuestionBody] to let its [RPUIQuestionStep] container  know
  /// that it's finished and ready to go to the next step.
  Function(QuestionStatus) get sendStatus => _questionStatusController.sink.add;

  /// The function to send [RPQuestionBodyResult] through a stream
  ///
  /// Usually used by a QuestionBody like [RPUIQuestionBody] to convey it's result to its [RPUIQuestionStep] container.
  /// Use to send the actual AnswerValue to the QuestionContainer so that it can create the [RPStepResult] object.
  Function(RPQuestionBodyResult) get sendResultValue => _questionBodyResultController.sink.add;

  //Retrieve data from stream
  //TODO: .transform(StreamTransformer validator) do we need that?

  /// The stream through which [QuestionStatus] is flowing
  ///
  /// The [RPUIQuestionStep] listens to this stream so it's notified if it can navigate to the next step
  Stream<QuestionStatus> get questionStatus => _questionStatusController.stream;

  /// The stream through which [RPQuestionBodyResult] is flowing
  ///
  /// The [RPUIQuestionStep] listens to this stream and creating the [RPStepResult] object based on the incoming data.
  Stream<RPQuestionBodyResult> get resultValue => _questionBodyResultController.stream;

  dispose() {
    _questionStatusController.close();
    _questionBodyResultController.close();
  }
}

/// The singleton object of the question BLoC class which can be accessed throughout Research Package.
final blocQuestion = BlocQuestion();
