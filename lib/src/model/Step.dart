import 'model.dart';
import 'AnswerFormat.dart';

/*
  This is a universal Step class.

  Maybe we can make this a super class of more specified Step classes
  (e.g. InstructionStep, QuestionStep, VisualConsentStep).
*/


class Step {
  // Needs to be confirmed
  StepType type;

  AnswerFormat answerFormat;

  String title;

  String text;
}
