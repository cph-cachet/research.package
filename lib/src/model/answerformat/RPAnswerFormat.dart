/*
  This is an abstract class (interface/protocol) for AnswerFormat.
  Based on: https://github.com/ResearchStack/ResearchStack/blob/78ae673b6af8adfe6a788a3f3237996608f3f043/backbone/src/main/java/org/researchstack/backbone/answerformat/AnswerFormat.java
 */

part of research_package_model;

abstract class RPAnswerFormat {
  //Default constructor. The appropriate subclass of AnswerFormat should be used instead of this directly.
  RPAnswerFormat();

  // Returns the QuestionType for this answer format. Implement this in your subclass
  // It's for approximation, what kind of data the answer will return.
  // Also, they are _almost_ the same as the questionresult classes in RK
  get questionType => QuestionType.None; // TODO: Investigate more what's this for

  Widget stepBodyWidget(QuestionType questionType) {
    // RS Just returns NotImplementedStepBody.class for many cases...
    switch (questionType) {
      case QuestionType.Scale:
        return Container(); //TODO: Implement
      case QuestionType.SingleChoice:
        return Container(); //TODO: Implement
      case QuestionType.MultipleChoice:
        return Container(); //TODO: Implement
      case QuestionType.Decimal:
        return Container(); //TODO: Implement
      case QuestionType.Integer:
        return Container(); //TODO: Implement
      case QuestionType.Boolean:
        return Container(); //TODO: Implement
      case QuestionType.Eligibility:
        return Container(); //TODO: Implement
      case QuestionType.Text:
        return Container(); //TODO: Implement
      case QuestionType.TimeOfDay:
        return Container(); //TODO: Implement
      case QuestionType.DateAndTime:
        return Container(); //TODO: Implement
      case QuestionType.Date:
        return Container(); //TODO: Implement
      case QuestionType.TimeInterval:
        return Container(); //TODO: Implement
      case QuestionType.Duration:
        return Container(); //TODO: Implement
      case QuestionType.Location:
        return Container(); //TODO: Implement
      case QuestionType.Form:
        return Container(); //TODO: Implement
      default:
        return Container();
    }
  }

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
  Buttons
}
