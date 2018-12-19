import 'model.dart';
import 'RPAnswerFormat.dart';

/*
  This is a universal Step class.

  Maybe we can make this a super class of more specified Step classes
  (e.g. InstructionStep, QuestionStep, VisualConsentStep).



 - InstructionStep

*/


class RPStep {
  // Needs to be confirmed
  StepType type;

  String title;

  String text;
}
