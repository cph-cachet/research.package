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

RPQuestionStep additionalInfoQuestionStep = RPQuestionStep(
    'additionalInfoQuestionStepID',
    title: 'Do you have any more details you would like to add?',
    answerFormat: textAnswerFormat,
    optional: true);

RPQuestionStep timeOfDayQuestionStep = RPQuestionStep('timeOfDayQuestionStepID',
    title: 'When did you wake up?', answerFormat: timeOfDayAnswerFormat);

RPQuestionStep dateAndTimeQuestionStep = RPQuestionStep(
    'dateAndTimeQuestionStepID',
    title: 'When did you last eat unhealthy food?',
    answerFormat: dateAndTimeAnswerFormat);

RPQuestionStep dateQuestionStep = RPQuestionStep('dateQuestionStepID',
    title: 'When did you last drink alcohol?', answerFormat: dateAnswerFormat);

// Slider
RPQuestionStep sliderQuestionStep = RPQuestionStep(
  "sliderQuestionsStepID",
  title: "What did you pay for insulin?",
  answerFormat: sliderAnswerFormat,
  optional: true,
);

RPQuestionStep singleChoiceQuestionStep = RPQuestionStep(
  "questionStep1ID",
  title: "I have felt cheerful and in good spirits",
  answerFormat: timeAnswerFormat,
);

RPQuestionStep smokingQuestionStep = RPQuestionStep(
  "booleanQuestionStepID",
  title: "Do you smoke?",
  answerFormat: smokingBooleanAnswerFormat,
);

RPQuestionStep instrumentChoiceQuestionStep = RPQuestionStep(
    "instrumentChoiceQuestionStepID",
    title: "Which instrument are you playing?",
    answerFormat: instrumentsAnswerFormat);

RPQuestionStep happinessChoiceQuestionStep = RPQuestionStep(
    "happinessChoiceQuestionStepID",
    title: "What makes you happy?",
    answerFormat: joyfulActivitiesAnswerFormat);

RPQuestionStep weightQuestionStep = RPQuestionStep("weightQuestionStepID",
    title: "What is your weight?", answerFormat: weightIntegerAnswerFormat);

RPQuestionStep minutesQuestionStep = RPQuestionStep("minutesQuestionStepID",
    title: "How many minutes do you spend practicing a week?",
    answerFormat: minutesIntegerAnswerFormat);

RPQuestionStep imageChoiceQuestionStep = RPQuestionStep(
  "imageStepID",
  title: "Indicate you mood by selecting a picture!",
  answerFormat: imageChoiceAnswerFormat,
);

RPFormStep formStep = RPFormStep(
  "formstepID",
  steps: [instrumentChoiceQuestionStep, minutesQuestionStep, dateQuestionStep],
  title: "Questions about music",
  optional: true,
);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPInstructionStep instructionStep = RPInstructionStep("instructionID",
    title: "Welcome!", detailText: "For the sake of science of course...")
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
