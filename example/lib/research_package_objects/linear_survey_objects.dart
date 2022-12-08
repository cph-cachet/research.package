import 'package:research_package/model.dart';

// Using keys for translation example
List<RPChoice> timeChoices = [
  RPChoice(text: "timeChoice5", value: 5), // "All of the time"
  RPChoice(text: "timeChoice4", value: 4), // "Most of the time"
  RPChoice(text: "timeChoice3", value: 3), // "More than half of the time"
  RPChoice(text: "timeChoice2", value: 2), // "Less than half of the time"
  RPChoice(text: "timeChoice1", value: 1), // "Some of the time"
  RPChoice(text: "timeChoice0", value: 0), // "At no time"
];

List<RPChoice> joyfulActivities = [
  RPChoice(text: "Your input", value: 6, isFreeText: true),
  RPChoice(text: "Jogging", value: 5, detailText: "Running in a moderate pace"),
  RPChoice(text: "Playing an instrument", value: 4),
  RPChoice(text: "Family and friends", value: 3),
  RPChoice(text: "Doing sports", value: 2),
  RPChoice(text: "Reading", value: 1),
  RPChoice(text: "Being productive", value: 0),
];

List<RPChoice> instruments = [
  RPChoice(
      text: "Guitar",
      value: 3,
      detailText:
          "A guitar is an instrument. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras rutrum facilisis turpis, vitae congue nunc. Cras gravida tempor elit eu congue. Nam ut est eget enim imperdiet ullamcorper. Curabitur ac consequat augue. Suspendisse hendrerit, est eu varius suscipit, nisi magna congue purus, quis facilisis massa nibh sit amet est. Sed ut ligula diam. Nunc mollis iaculis nulla in hendrerit. Nulla facilisi. Vivamus faucibus augue vel auctor lacinia."),
  RPChoice(text: "Piano", value: 2),
  RPChoice(text: "Saxophone", value: 1),
];
List<RPChoice> yesNo = [
  RPChoice(text: "Yes", value: 1),
  RPChoice(text: "No", value: 0),
];

List<RPImageChoice> images = [
  RPImageChoice(
    imageUrl: 'assets/images/very-sad.png',
    value: -2,
    description: 'Feeling very sad',
  ),
  RPImageChoice(
    imageUrl: 'assets/images/sad.png',
    value: -1,
    description: 'Feeling sad',
  ),
  RPImageChoice(
    imageUrl: 'assets/images/ok.png',
    value: 0,
    description: 'Feeling ok',
  ),
  RPImageChoice(
    imageUrl: 'assets/images/happy.png',
    value: 1,
    description: 'Feeling happy',
  ),
  RPImageChoice(
    imageUrl: 'assets/images/very-happy.png',
    value: 2,
    description: 'Feeling very happy',
  ),
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

RPChoiceAnswerFormat yesNoAnswerFormat = RPChoiceAnswerFormat(
  answerStyle: RPChoiceAnswerStyle.SingleChoice,
  choices: yesNo,
);

RPIntegerAnswerFormat minutesIntegerAnswerFormat =
    RPIntegerAnswerFormat(minValue: 0, maxValue: 10000, suffix: "minutes");

RPTextAnswerFormat textAnswerFormat =
    RPTextAnswerFormat(hintText: "Write your answer here");

RPImageChoiceAnswerFormat imageChoiceAnswerFormat =
    RPImageChoiceAnswerFormat(choices: images);

RPQuestionStep additionalInfoQuestionStep = RPQuestionStep(
    identifier: 'additionalInfoQuestionStepID',
    title: 'Do you have any more details you would like to add?',
    answerFormat: textAnswerFormat,
    optional: true);

RPQuestionStep timeOfDayQuestionStep = RPQuestionStep(
    identifier: 'timeOfDayQuestionStepID',
    title: 'When did you wake up?',
    answerFormat: timeOfDayAnswerFormat);

RPQuestionStep dateAndTimeQuestionStep = RPQuestionStep(
    identifier: 'dateAndTimeQuestionStepID',
    title: 'When did you last eat unhealthy food?',
    answerFormat: dateAndTimeAnswerFormat);

RPQuestionStep dateQuestionStep = RPQuestionStep(
    identifier: 'dateQuestionStepID',
    title: 'When did you last drink alcohol?',
    answerFormat: dateAnswerFormat);

// Slider
RPQuestionStep sliderQuestionStep = RPQuestionStep(
  identifier: "sliderQuestionsStepID",
  title: "What did you pay for insulin?",
  answerFormat: sliderAnswerFormat,
  optional: true,
);

// Using keys for translations
RPQuestionStep singleChoiceQuestionStep = RPQuestionStep(
  identifier: "questionStep1ID",
  // title: "I have felt cheerful and in good spirits",
  title: "singleChoiceQuestionStep-title",
  answerFormat: timeAnswerFormat,
);

RPQuestionStep smokingQuestionStep = RPQuestionStep(
  identifier: "booleanQuestionStepID",
  title: "Do you smoke?",
  answerFormat: yesNoAnswerFormat,
);

RPQuestionStep instrumentChoiceQuestionStep = RPQuestionStep(
    identifier: "instrumentChoiceQuestionStepID",
    title: "Which instrument are you playing?",
    answerFormat: instrumentsAnswerFormat,
    optional: true);

RPQuestionStep happinessChoiceQuestionStep = RPQuestionStep(
    identifier: "happinessChoiceQuestionStepID",
    title: "What makes you happy?",
    answerFormat: joyfulActivitiesAnswerFormat);

RPQuestionStep weightQuestionStep = RPQuestionStep(
    identifier: "weightQuestionStepID",
    title: "What is your weight?",
    answerFormat: weightIntegerAnswerFormat);

RPQuestionStep minutesQuestionStep = RPQuestionStep(
    identifier: "minutesQuestionStepID",
    title: "How many minutes do you spend practicing a week?",
    answerFormat: minutesIntegerAnswerFormat,
    optional: true);

RPQuestionStep imageChoiceQuestionStep = RPQuestionStep(
  identifier: "imageStepID",
  title: "Indicate you mood by selecting a picture!",
  answerFormat: imageChoiceAnswerFormat,
);

RPQuestionStep textQuestionStep = RPQuestionStep(
  identifier: "textStepID",
  answerFormat: RPTextAnswerFormat(hintText: "Write here"),
  title: "Describe your morning routine",
);

RPFormStep formStep = RPFormStep(
  identifier: "formstepID",
  steps: [
    instrumentChoiceQuestionStep, // optional
    textQuestionStep,
    minutesQuestionStep, // optional
    dateQuestionStep
  ],
  title: "Questions about music",
);

RPCompletionStep completionStep = RPCompletionStep(
    identifier: "completionID",
    title: "Finished",
    text: "Thank you for filling out the survey!");

RPInstructionStep instructionStep = RPInstructionStep(
    identifier: "instructionID",
    title: "Welcome!",
    detailText: "For the sake of science of course...",
    text:
        "Please fill out this questionnaire!\n\nIn this questionnaire the que-stions will come after each other in a given order. You still have the chance to skip a some of them though.");

RPTimerStep timerStep = RPTimerStep(
  identifier: 'RPTimerStepID',
  timeout: Duration(seconds: 12),
  title:
      "Please think for a moment about how your day was and note it down in the next step",
  playSound: true,
);

RPOrderedTask linearSurveyTask = RPOrderedTask(
  identifier: "surveyTaskID",
  steps: [
    instructionStep,
    timerStep,
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
