import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

List<RPChoice> timeChoices = [
  RPChoice(text: "All of the time", value: 5),
  RPChoice(text: "Most of the time", value: 4),
  RPChoice(text: "More than half of the time", value: 3),
  RPChoice(text: "Less than half of the time", value: 2),
  RPChoice(text: "Some of the time", value: 1),
  RPChoice(text: "At no time", value: 0),
];

List<RPChoice> joyfulActivities = [
  RPChoice(text: "Playing games", value: 6, isFreeText: true),
  RPChoice(text: "Jogging", value: 5),
  RPChoice(text: "Playing an instrument", value: 4),
  RPChoice(text: "Family and friends", value: 3),
  RPChoice(text: "Doing sports", value: 2),
  RPChoice(text: "Reading", value: 1),
  RPChoice(text: "Being productive", value: 0),
];

List<RPChoice> instruments = [
  RPChoice(text: "Guitar", value: 3),
  RPChoice(text: "Piano", value: 2),
  RPChoice(text: "Saxophone", value: 1),
];

List<RPImageChoice> images = [
  RPImageChoice(
      image: Image.asset('assets/images/very-sad.png'),
      value: -2,
      description: 'Feeling very sad'),
  RPImageChoice(
      image: Image.asset('assets/images/sad.png'),
      value: -1,
      description: 'Feeling sad'),
  RPImageChoice(
      image: Image.asset('assets/images/ok.png'),
      value: 0,
      description: 'Feeling ok'),
  RPImageChoice(
      image: Image.asset('assets/images/happy.png'),
      value: 1,
      description: 'Feeling happy'),
  RPImageChoice(
      image: Image.asset('assets/images/very-happy.png'),
      value: 2,
      description: 'Feeling very happy'),
];

RPChoiceAnswerFormat timeAnswerFormat = RPChoiceAnswerFormat(
  answerStyle: RPChoiceAnswerStyle.SingleChoice,
  choices: timeChoices,
);

// All types of DateTime answer formats
RPDateTimeAnswerFormat timeOfDayAnswerFormat = RPDateTimeAnswerFormat(
    dateTimeAnswerStyle: RPDateTimeAnswerStyle.TimeOfDay);
RPDateTimeAnswerFormat dateAndTimeAnswerFormat = RPDateTimeAnswerFormat(
    dateTimeAnswerStyle: RPDateTimeAnswerStyle.DateAndTime);
RPDateTimeAnswerFormat dateAnswerFormat =
    RPDateTimeAnswerFormat(dateTimeAnswerStyle: RPDateTimeAnswerStyle.Date);

// Slider
RPSliderAnswerFormat sliderAnswerFormat = RPSliderAnswerFormat(
  minValue: 0,
  maxValue: 100,
  divisions: 10,
  prefix: "\$",
  suffix: " paid",
);

RPChoiceAnswerFormat joyfulActivitiesAnswerFormat = RPChoiceAnswerFormat(
  answerStyle: RPChoiceAnswerStyle.MultipleChoice,
  choices: joyfulActivities,
);

RPChoiceAnswerFormat instrumentsAnswerFormat = RPChoiceAnswerFormat(
  answerStyle: RPChoiceAnswerStyle.MultipleChoice,
  choices: instruments,
);

RPIntegerAnswerFormat weightIntegerAnswerFormat =
    RPIntegerAnswerFormat(minValue: 0, maxValue: 200, suffix: "KG");

RPBooleanAnswerFormat smokingBooleanAnswerFormat =
    RPBooleanAnswerFormat(trueText: "Yes, absolutely", falseText: "No, never");

RPIntegerAnswerFormat minutesIntegerAnswerFormat =
    RPIntegerAnswerFormat(minValue: 0, maxValue: 10000, suffix: "minutes");

RPTextAnswerFormat textAnswerFormat =
    RPTextAnswerFormat(hintText: "Write your answer here");

RPImageChoiceAnswerFormat imageChoiceAnswerFormat =
    RPImageChoiceAnswerFormat(choices: images);

RPQuestionStep additionalInfoQuestionStep = RPQuestionStep.withAnswerFormat(
    'additionalInfoQuestionStepID',
    'Do you have any more details you would like to add?',
    textAnswerFormat,
    optional: true);

RPQuestionStep timeOfDayQuestionStep = RPQuestionStep.withAnswerFormat(
    'timeOfDayQuestionStepID', 'When did you wake up?', timeOfDayAnswerFormat);

RPQuestionStep dateAndTimeQuestionStep = RPQuestionStep.withAnswerFormat(
    'dateAndTimeQuestionStepID',
    'When did you last eat unhealthy food?',
    dateAndTimeAnswerFormat);

RPQuestionStep dateQuestionStep = RPQuestionStep.withAnswerFormat(
    'dateQuestionStepID', 'When did you last drink alcohol?', dateAnswerFormat);

// Slider
RPQuestionStep sliderQuestionStep = RPQuestionStep.withAnswerFormat(
  "sliderQuestionsStepID",
  "What did you pay for insulin?",
  sliderAnswerFormat,
  optional: true,
);

RPQuestionStep singleChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "questionStep1ID",
  "I have felt cheerful and in good spirits",
  timeAnswerFormat,
);

RPQuestionStep smokingQuestionStep = RPQuestionStep.withAnswerFormat(
  "booleanQuestionStepID",
  "Do you smoke?",
  smokingBooleanAnswerFormat,
);

RPQuestionStep instrumentChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "instrumentChoiceQuestionStepID",
    "Which instrument are you playing?",
    instrumentsAnswerFormat);

RPQuestionStep happinessChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "happinessChoiceQuestionStepID",
    "What makes you happy?",
    joyfulActivitiesAnswerFormat);

RPQuestionStep weightQuestionStep = RPQuestionStep.withAnswerFormat(
    "weightQuestionStepID", "What is your weight?", weightIntegerAnswerFormat);

RPQuestionStep minutesQuestionStep = RPQuestionStep.withAnswerFormat(
    "minutesQuestionStepID",
    "How many minutes do you spend practicing a week?",
    minutesIntegerAnswerFormat);

RPQuestionStep imageChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "imageStepID",
  "Indicate you mood by selecting a picture!",
  imageChoiceAnswerFormat,
);

RPFormStep formStep = RPFormStep.withTitle(
  "formstepID",
  [instrumentChoiceQuestionStep, minutesQuestionStep, dateQuestionStep],
  "Questions about music",
  optional: true,
);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPInstructionStep instructionStep = RPInstructionStep(
    identifier: "instructionID",
    title: "Welcome!",
    detailText: "For the sake of science of course...")
  ..text =
      "Please fill out this questionnaire!\n\nIn this questionnaire the questions will come after each other in a given order. You still have the chance to skip a some of them though.";

RPOrderedTask linearSurveyTask = RPOrderedTask(
  "surveyTaskID",
  [
    instructionStep,
    formStep,
    smokingQuestionStep,
    sliderQuestionStep,
    timeOfDayQuestionStep,
    dateAndTimeQuestionStep,
    dateQuestionStep,
    imageChoiceQuestionStep,
    singleChoiceQuestionStep,
    happinessChoiceQuestionStep,
    weightQuestionStep,
    additionalInfoQuestionStep,
    completionStep
  ],
);
