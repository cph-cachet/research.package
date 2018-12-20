import 'model.dart';
import 'RPAnswerFormat.dart';

/*
  This is a universal Step class.

  Maybe we can make this a super class of more specified Step classes
  (e.g. InstructionStep, QuestionStep, VisualConsentStep).



 - InstructionStep

*/


class RPStep {
  final String _identifier;

  String get getIdentifier => _identifier;

  RPStep(this._identifier);


  // Needs to be confirmed
  StepType type;

  String title;

  String text;
}
