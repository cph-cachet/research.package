/*
  This is an abstract class (interface/protocol) for AnswerFormat.
  Based on: https://github.com/ResearchStack/ResearchStack/blob/78ae673b6af8adfe6a788a3f3237996608f3f043/backbone/src/main/java/org/researchstack/backbone/answerformat/AnswerFormat.java
 */

part of research_package_model;

abstract class RPAnswerFormat {
  Widget _questionBody;

  //Default constructor. The appropriate subclass of AnswerFormat should be used instead of this directly.
  RPAnswerFormat();

  // Returns the QuestionType for this answer format. Implement this in your subclass
  // It's for approximation, what kind of data the answer will return.
  // Also, they are _almost_ the same as the questionResult classes in RK
  QuestionType get questionType => QuestionType.None; // TODO: Investigate more what's this for

  Widget get questionBody => _questionBody;
}

enum QuestionType {
  None,
  Scale,
  SingleChoice,
  MultipleChoice,
  Decimal,
  Integer,
  Boolean,
  Eligibility,
  Text,
  TimeOfDay,
  DateAndTime,
  Date,
  TimeInterval,
  Duration,
  Location,
  Form
}

enum ScaleAnswerStyle {
  Default,
  Percent,
  Buttons,
}

enum ChoiceAnswerStyle {
  SingleChoice,
  MultipleChoice,
}

enum DateAnswerStyle {
  DateAndTime,
  Date,
  TimeOfDay,
}

enum NumberFormattingStyle {
  Default,
  Percent
}
