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

List<RPChoice> instruments = [
  RPChoice.withParams("Guitar", 3),
  RPChoice.withParams("Piano", 2),
  RPChoice.withParams("Saxophone", 1),
];

RPChoiceAnswerFormat timeAnswerFormat = RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, timeChoices);

RPChoiceAnswerFormat joyfulActivitiesAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, joyfulActivities);

RPChoiceAnswerFormat instrumentsAnswerFormat =
RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, instruments);

RPIntegerAnswerFormat weightIntegerAnswerFormat = RPIntegerAnswerFormat.withParams(0, 200, "KG");

RPIntegerAnswerFormat minutesIntegerAnswerFormat = RPIntegerAnswerFormat.withParams(0, 10000, "minutes");

RPQuestionStep singleChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "I have felt cheerful and in good spirits",
  timeAnswerFormat,
);

RPQuestionStep instrumentChoiceQuestionStep =
RPQuestionStep.withAnswerFormat("instrumentChoiceQuestionStepID", "Which instrument are you playing?", instrumentsAnswerFormat);

RPQuestionStep happinessChoiceQuestionStep =
    RPQuestionStep.withAnswerFormat("happinessChoiceQuestionStepID", "What makes you happy?", joyfulActivitiesAnswerFormat);

RPQuestionStep weightQuestionStep =
    RPQuestionStep.withAnswerFormat("weightQuestionStepID", "What is your weight?", weightIntegerAnswerFormat);

RPQuestionStep minutesQuestionStep =
RPQuestionStep.withAnswerFormat("minutesQuestionStepID", "How many minutes do you spend practicing a week?", minutesIntegerAnswerFormat);

RPFormStep formStep = RPFormStep.withTitle("formstepID",[instrumentChoiceQuestionStep, minutesQuestionStep], "Questions about music");

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPOrderedTask surveyTask = RPOrderedTask(
  "surveyTaskID",
  [singleChoiceQuestionStep, happinessChoiceQuestionStep, weightQuestionStep, formStep, completionStep],
);
