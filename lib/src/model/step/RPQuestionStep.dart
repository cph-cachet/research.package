import 'RPStep.dart';
import '../answerformat/RPAnswerFormat.dart';

class RPQuestionStep extends RPStep {
  RPAnswerFormat _answerFormat;
  String _placeholder;

  RPQuestionStep(String identifier) : super(identifier);

//  RPQuestionStep.withTitle(String identifier, String title) : super(identifier, title);

}