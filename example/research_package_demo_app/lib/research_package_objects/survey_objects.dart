import 'package:research_package/model.dart';

List<RPChoice> timeChoices = [
  RPChoice.withParams("All of the time", 5),
  RPChoice.withParams("Most of the time", 4),
  RPChoice.withParams("More than half of the time", 3),
  RPChoice.withParams("Less than half of the time", 2),
  RPChoice.withParams("Some of the time", 1),
  RPChoice.withParams("At no time", 0),
];

List<RPChoice> joyfulActivities = [
  RPChoice.withParams("Playing games", 6),
  RPChoice.withParams("Jogging", 5),
  RPChoice.withParams("Playing an instrument", 4),
  RPChoice.withParams("Family and friends", 3),
  RPChoice.withParams("Doing sports", 2),
  RPChoice.withParams("Reading", 1),
  RPChoice.withParams("Being productive", 0),
];

RPChoiceAnswerFormat timeAnswerFormat = RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, timeChoices);

RPChoiceAnswerFormat joyfulActivitiesAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, joyfulActivities);
RPIntegerAnswerFormat integerAnswerFormat = RPIntegerAnswerFormat.withParams(0, 200, "KG");

RPQuestionStep singleChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "I have felt cheerful and in good spirits",
  timeAnswerFormat,
);

RPQuestionStep multiChoiceQuestionStep =
    RPQuestionStep.withAnswerFormat("questionStep2ID", "What makes you happy?", joyfulActivitiesAnswerFormat);

RPQuestionStep integerQuestionStep =
    RPQuestionStep.withAnswerFormat("questionStep2ID", "What is your weight?", integerAnswerFormat);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPOrderedTask surveyTask = RPOrderedTask(
  "surveyTaskID",
  [singleChoiceQuestionStep, multiChoiceQuestionStep, integerQuestionStep, completionStep],
);
