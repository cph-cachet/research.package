import 'package:research_package/model.dart';

///
/// CHOICES
///

List<RPImageChoice> images = [
  RPImageChoice(
      imageUrl: 'assets/images/very-sad.png',
      value: -2,
      description: 'Feeling very sad'),
  RPImageChoice(
      imageUrl: 'assets/images/sad.png', value: -1, description: 'Feeling sad'),
  RPImageChoice(
      imageUrl: 'assets/images/ok.png', value: 0, description: 'Feeling ok'),
  RPImageChoice(
      imageUrl: 'assets/images/happy.png',
      value: 1,
      description: 'Feeling happy'),
  RPImageChoice(
      imageUrl: 'assets/images/very-happy.png',
      value: 2,
      description: 'Feeling very happy'),
];

List<RPChoice> joyfulActivities = [
  RPChoice(text: "Playing games", value: 6),
  RPChoice(text: "Jogging", value: 5),
  RPChoice(text: "Playing an instrument", value: 4),
  RPChoice(text: "Family and friends", value: 3),
  RPChoice(text: "Doing sports", value: 2),
  RPChoice(text: "Reading", value: 1),
  RPChoice(text: "Being productive", value: 0),
];

List<RPChoice> who5Choices = [
  RPChoice(text: "All of the time", value: 5),
  RPChoice(text: "Most of the time", value: 4),
  RPChoice(text: "More than half of the time", value: 3),
  RPChoice(text: "Less than half of the time", value: 2),
  RPChoice(text: "Some of the time", value: 1),
  RPChoice(text: "At no time", value: 0),
];

List<RPChoice> instruments = [
  RPChoice(text: "Piano", value: 1),
  RPChoice(text: "Guitar", value: 0),
];

List<RPChoice> guitarReasons = [
  RPChoice(text: "Fun", value: 3),
  RPChoice(text: "Easy to play", value: 2),
  RPChoice(text: "Charming", value: 1),
  RPChoice(text: "Popular", value: 0),
];

List<RPChoice> numbers = [
  RPChoice(text: "Four", value: 3),
  RPChoice(text: "Three", value: 2),
  RPChoice(text: "Two", value: 1),
  RPChoice(text: "One", value: 0),
];

///
/// ANSWER FORMATS
///

RPImageChoiceAnswerFormat imageChoiceAnswerFormat =
    RPImageChoiceAnswerFormat(choices: images);
RPChoiceAnswerFormat who5AnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice, choices: who5Choices);
RPChoiceAnswerFormat joyfulActivitiesAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: joyfulActivities);
RPChoiceAnswerFormat numbersAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: numbers);
RPChoiceAnswerFormat instrumentsAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice, choices: instruments);
RPIntegerAnswerFormat minutesIntegerAnswerFormat =
    RPIntegerAnswerFormat(minValue: 0, maxValue: 10000, suffix: "minutes");
RPChoiceAnswerFormat guitarAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: guitarReasons);

///
/// STEPS
///

RPQuestionStep imageChoiceQuestionStep = RPQuestionStep(
  identifier: "imageStepID",
  title: "Indicate you mood by selecting a picture!",
  answerFormat: imageChoiceAnswerFormat,
);

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "instructionID",
  title: "Welcome!",
  detailText: "For the sake of science of course...",
  text:
      "Please fill out this questionnaire!\n\nIn this questionnaire answers to some questions will determine what other questions you will get. You can not skip these question, although you are free to skip the other questions.",
);

RPQuestionStep singleChoiceQuestionStep = RPQuestionStep(
  identifier: "singleChoiceQuestionStepID",
  title: "I have felt cheerful and in good spirits",
  answerFormat: who5AnswerFormat,
);

RPQuestionStep multiChoiceQuestionStep1 = RPQuestionStep(
  identifier: "multiChoiceQuestionStepID1",
  title: "What makes you happy?",
  answerFormat: joyfulActivitiesAnswerFormat,
);

RPQuestionStep multiChoiceQuestionStep2 = RPQuestionStep(
  identifier: "multiChoiceQuestionStepID2",
  title: "Choose (a) number(s)",
  answerFormat: numbersAnswerFormat,
);

RPQuestionStep instrumentChoiceQuestionStep = RPQuestionStep(
    identifier: "instrumentChoiceQuestionStepID",
    title: "Which instrument are you playing?",
    answerFormat: instrumentsAnswerFormat);
RPQuestionStep minutesQuestionStep = RPQuestionStep(
    identifier: "minutesQuestionStepID",
    title: "How many minutes do you spend practicing a week?",
    answerFormat: minutesIntegerAnswerFormat);
RPFormStep formStep = RPFormStep(
  identifier: "formstepID",
  steps: [instrumentChoiceQuestionStep, minutesQuestionStep],
  title: "Questions about music",
  optional: true,
);

RPQuestionStep guitarChoiceQuestionStep = RPQuestionStep(
    identifier: "guitarChoiceQuestionStepID",
    title: "Why did you start playing the guitar?",
    answerFormat: guitarAnswerFormat);

RPCompletionStep completionStep = RPCompletionStep(
    identifier: "completionID",
    title: "Finished",
    text: "Thank you for filling out the survey!");

// Likert-point scale with problem statements
List<RPChoice> likertProblemScaleAnswers = [
  RPChoice(text: "Not a problem", value: 0),
  RPChoice(text: "Minor problem", value: 1),
  RPChoice(text: "Moderate problem", value: 2),
  RPChoice(text: "Somewhat serious problem", value: 3),
  RPChoice(text: "Serious problem", value: 4),
];
RPChoiceAnswerFormat likertProblemScaleAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice,
    choices: likertProblemScaleAnswers);

// PAID
// B2 SHORT (Long has been archived if later necessary)
RPInstructionStep b2InstructionStep = RPInstructionStep(
    identifier: "b2InstructionStepID",
    title: "",
    text:
        "For the upcoming questions, please consider... \n\nWhich of the following diabetes areas are currently a problem for you? \n\n\nPress 'Continue' to go to the questions");

// B2 - 1
RPQuestionStep depressedChoiceQuestionStep = RPQuestionStep(
    identifier: "B2-1",
    title: "Feeling depressed when you think about living with diabetes?",
    answerFormat: likertProblemScaleAnswerFormat);

// B2 - 2
RPQuestionStep energyChoiceQuestionStep = RPQuestionStep(
    identifier: "B2-2",
    title:
        "Feeling that diabetes is taking up too much of your mental and physical energy?",
    answerFormat: likertProblemScaleAnswerFormat);

// B2 - 2b
RPQuestionStep energyChoiceQuestionStep2 = RPQuestionStep(
    identifier: "B2-2b",
    title:
        "Feeling that diabetes is taking up too much of your mental and physical energy?",
    answerFormat: likertProblemScaleAnswerFormat);

// B2 - 3
RPQuestionStep overwhelmedChoiceQuestionStep = RPQuestionStep(
    identifier: "B2-3",
    title: "Feeling overwhelmed by your diabetes?",
    answerFormat: likertProblemScaleAnswerFormat);

// B2 - 4
RPQuestionStep foodChoiceQuestionStep = RPQuestionStep(
    identifier: "B2-4",
    title: "Feeling constantly concerned about food and eating?",
    answerFormat: likertProblemScaleAnswerFormat);

// B2 - 5
RPQuestionStep aloneChoiceQuestionStep = RPQuestionStep(
    identifier: "B2-5",
    title: "Feeling alone with your diabetes?",
    answerFormat: likertProblemScaleAnswerFormat);

// B2 - 6
RPQuestionStep burnedOutChoiceQuestionStep = RPQuestionStep(
    identifier: "B2-6",
    title:
        "Feeling “burned out” by the constant effort needed to manage diabetes?",
    answerFormat: likertProblemScaleAnswerFormat);

RPCompletionStep paidCompletionStep =
    RPCompletionStep(identifier: "B2-7", title: "Finished", text: "Finished");

// Binst -> 1 -> 2 -> end
//          |    |
//         2b -> 3 -> 4 -> 5 -> 6 -> end
// Order of questions
// Binst, 1, 2, 2b, 3, 4, 5, 6, end

// PAID (B2) Branching:
RPStepJumpRule emotionalDistressBranchRule = RPStepJumpRule(answerMap: {
  0: energyChoiceQuestionStep.identifier,
  1: energyChoiceQuestionStep.identifier,
  // 2+ -> go to 2b with extended version after
  2: energyChoiceQuestionStep2.identifier,
  3: energyChoiceQuestionStep2.identifier,
  4: energyChoiceQuestionStep2.identifier,
});
RPStepJumpRule emotionalDistressBranchRule2 = RPStepJumpRule(answerMap: {
  0: paidCompletionStep.identifier,
  1: paidCompletionStep.identifier,
  // 2+ -> go to extended version.
  2: overwhelmedChoiceQuestionStep.identifier,
  3: overwhelmedChoiceQuestionStep.identifier,
  4: overwhelmedChoiceQuestionStep.identifier,
});

RPOrderedTask emotionalDistress = RPNavigableOrderedTask(
  identifier: "emotionalDistress",
  steps: [
    b2InstructionStep,
    depressedChoiceQuestionStep,
    energyChoiceQuestionStep,
    // question 2b for branching
    energyChoiceQuestionStep2,
    // Long version
    overwhelmedChoiceQuestionStep,
    foodChoiceQuestionStep,
    aloneChoiceQuestionStep,
    burnedOutChoiceQuestionStep,
    paidCompletionStep,
  ],
)
  ..setNavigationRuleForTriggerStepIdentifier(
      emotionalDistressBranchRule, depressedChoiceQuestionStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      emotionalDistressBranchRule2, energyChoiceQuestionStep.identifier);
