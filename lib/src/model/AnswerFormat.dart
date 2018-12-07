import 'model.dart';

/*
  This is a universal AnswerFormat class.

  Maybe we can make this a super class of more specified AnswerFormat classes
  (e.g. NumericAnswerFormat or QuestionStep).
 */

class AnswerFormat {
  AnswerFormatType type;

  // This is the title of the answer section like the "Gender" here: Gender: Male/Female
  String text;

  AnswerFormat(
    this.type,
    this.text,
  );
}
