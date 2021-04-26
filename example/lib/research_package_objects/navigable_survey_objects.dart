import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

///
/// CHOICES
///

List<RPImageChoice> images = [
  RPImageChoice(
      image: Image.asset('assets/images/very-sad.png'),
      value: 0,
      description: 'Feeling very sad'),
  RPImageChoice(
      image: Image.asset('assets/images/sad.png'),
      value: 1,
      description: 'Feeling sad'),
  RPImageChoice(
      image: Image.asset('assets/images/ok.png'),
      value: 2,
      description: 'Feeling ok'),
  RPImageChoice(
      image: Image.asset('assets/images/happy.png'),
      value: 3,
      description: 'Feeling happy'),
  RPImageChoice(
      image: Image.asset('assets/images/very-happy.png'),
      value: 4,
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

List<RPChoice> alphabet = [
  RPChoice(text: "D", value: 3),
  RPChoice(text: "C", value: 2),
  RPChoice(text: "B", value: 1),
  RPChoice(text: "A", value: 0),
];

///
/// ANSWER FORMATS
///

RPBooleanAnswerFormat yesNoAnswerFormat =
    RPBooleanAnswerFormat(trueText: "Yes", falseText: "No");
RPImageChoiceAnswerFormat imageChoiceAnswerFormat =
    RPImageChoiceAnswerFormat(choices: images);
RPIntegerAnswerFormat nrOfCigarettesAnswerFormat =
    RPIntegerAnswerFormat(minValue: 0, maxValue: 200, suffix: "cigarettes");
RPChoiceAnswerFormat who5AnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice, choices: who5Choices);
RPChoiceAnswerFormat joyfulActivitiesAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: joyfulActivities);
RPChoiceAnswerFormat numbersAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: numbers);
RPChoiceAnswerFormat alphabetAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: alphabet);
RPChoiceAnswerFormat instrumentsAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice, choices: instruments);
RPIntegerAnswerFormat minutesIntegerAnswerFormat =
    RPIntegerAnswerFormat(minValue: 0, maxValue: 10000, suffix: "minutes");
RPChoiceAnswerFormat guitarAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.MultipleChoice, choices: guitarReasons);

///
/// STEPS
///

RPQuestionStep smokingQuestionStep = RPQuestionStep.withAnswerFormat(
    "smokingQuestionId", "Do you smoke?", yesNoAnswerFormat);

RPQuestionStep imageChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "imageStepID",
  "Indicate you mood by selecting a picture!",
  imageChoiceAnswerFormat,
);

RPQuestionStep nrOfCigarettesQuestionStep = RPQuestionStep.withAnswerFormat(
    "nrOfCigarettesQuestionStepID",
    "How many cigarettes do you smoke a day?",
    nrOfCigarettesAnswerFormat);

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "instructionID",
  title: "Welcome!",
  detailText: "For the sake of science of course...",
)..text =
    "Please fill out this questionnaire!\n\nIn this questionnaire answers to some questions will determine what other questions you will get. You can not skip these question, although you are free to skip the other questions.";

RPQuestionStep singleChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "singleChoiceQuestionStepID",
  "I have felt cheerful and in good spirits",
  who5AnswerFormat,
);

RPQuestionStep multiChoiceQuestionStep1 = RPQuestionStep.withAnswerFormat(
  "multiChoiceQuestionStepID1",
  "What makes you happy?",
  joyfulActivitiesAnswerFormat,
);

RPQuestionStep multiChoiceQuestionStep2 = RPQuestionStep.withAnswerFormat(
  "multiChoiceQuestionStepID2",
  "Choose (a) number(s)",
  numbersAnswerFormat,
);

RPQuestionStep alphabetQuestionStep = RPQuestionStep.withAnswerFormat(
  "alphabetQuestionStepID",
  "Choose (a) letter(s)",
  alphabetAnswerFormat,
);

RPInstructionStep instructionStepA = RPInstructionStep(
    identifier: "instructionStepAID", title: "A", detailText: "A detail")
  ..text = "text";
RPInstructionStep instructionStepB = RPInstructionStep(
    identifier: "instructionStepBID", title: "B", detailText: "B detail")
  ..text = "text";
RPInstructionStep instructionStepC = RPInstructionStep(
    identifier: "instructionStepCID", title: "C", detailText: "C detail")
  ..text = "text";
RPInstructionStep instructionStepD = RPInstructionStep(
    identifier: "instructionStepDID", title: "D", detailText: "D detail")
  ..text = "text";

RPQuestionStep instrumentChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "instrumentChoiceQuestionStepID",
    "Which instrument are you playing?",
    instrumentsAnswerFormat);
RPQuestionStep minutesQuestionStep = RPQuestionStep.withAnswerFormat(
    "minutesQuestionStepID",
    "How many minutes do you spend practicing a week?",
    minutesIntegerAnswerFormat);
RPFormStep formStep = RPFormStep.withTitle(
  "formstepID",
  [instrumentChoiceQuestionStep, minutesQuestionStep],
  "Questions about music",
  optional: true,
);

RPQuestionStep guitarChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "guitarChoiceQuestionStepID",
    "Why did you start playing the guitar?",
    guitarAnswerFormat);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

///
/// PREDICATES
///

RPResultPredicate singleChoicePredicate =
    RPResultPredicate.forChoiceQuestionResult(
        resultSelector:
            RPResultSelector.forStepId("singleChoiceQuestionStepID"),
        expectedValue: [5],
        choiceQuestionResultPredicateMode:
            ChoiceQuestionResultPredicateMode.ExactMatch);

RPResultPredicate exactMultiChoicePredicate =
    RPResultPredicate.forChoiceQuestionResult(
        resultSelector:
            RPResultSelector.forStepId("multiChoiceQuestionStepID1"),
        expectedValue: [0, 6],
        choiceQuestionResultPredicateMode:
            ChoiceQuestionResultPredicateMode.ExactMatch);

RPResultPredicate containingMultiChoicePredicate =
    RPResultPredicate.forChoiceQuestionResult(
        resultSelector:
            RPResultSelector.forStepId("multiChoiceQuestionStepID2"),
        expectedValue: [1],
        choiceQuestionResultPredicateMode:
            ChoiceQuestionResultPredicateMode.Containing);

RPResultPredicate yesSmokingPredicate =
    RPResultPredicate.forBooleanQuestionResult(
        resultSelector: RPResultSelector.forStepId("smokingQuestionId"),
        expectedValue: true);

RPResultPredicate noSmokingPredicate =
    RPResultPredicate.forBooleanQuestionResult(
        resultSelector: RPResultSelector.forStepId("smokingQuestionId"),
        expectedValue: false);

RPResultPredicate instrumentChoicePredicate =
    RPResultPredicate.forChoiceQuestionResult(
        resultSelector: RPResultSelector.forStepIdInFormStep(
            "instrumentChoiceQuestionStepID"),
        expectedValue: [1],
        choiceQuestionResultPredicateMode:
            ChoiceQuestionResultPredicateMode.ExactMatch);

///
/// NAVIGATION RULES
///

RPPredicateStepNavigationRule smokingNavigationRule =
    RPPredicateStepNavigationRule(
  {
    noSmokingPredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule singleChoiceNavigationRule =
    RPPredicateStepNavigationRule(
  {
    singleChoicePredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule exactMultiChoiceNavigationRule =
    RPPredicateStepNavigationRule(
  {
    exactMultiChoicePredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule containingMultiChoiceNavigationRule =
    RPPredicateStepNavigationRule(
  {
    containingMultiChoicePredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule guitarNavigationRule =
    RPPredicateStepNavigationRule(
  {
    instrumentChoicePredicate: smokingQuestionStep.identifier,
  },
);

RPStepReorganizerRule alphabetReorganizerRule =
    RPStepReorganizerRule(alphabetQuestionStep.identifier, {
  3: instructionStepD.identifier,
  2: instructionStepC.identifier,
  1: instructionStepB.identifier,
  0: instructionStepA.identifier
});

///
/// TASK
///

RPNavigableOrderedTask navigableSurveyTask = RPNavigableOrderedTask(
  "NavigableTaskID",
  [
//    instructionStep,
//    formStep,
//    guitarChoiceQuestionStep,
//    smokingQuestionStep,
    alphabetQuestionStep,
    instructionStepA,
    instructionStepB,
    instructionStepC,
    instructionStepD,
//    nrOfCigarettesQuestionStep,
//    multiChoiceQuestionStep1,
    multiChoiceQuestionStep2,
//    singleChoiceQuestionStep,
    imageChoiceQuestionStep,
//    completionStep,
  ],
)
  ..setNavigationRuleForTriggerStepIdentifier(
      smokingNavigationRule, smokingQuestionStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      singleChoiceNavigationRule, singleChoiceQuestionStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      exactMultiChoiceNavigationRule, multiChoiceQuestionStep1.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      guitarNavigationRule, formStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      containingMultiChoiceNavigationRule, multiChoiceQuestionStep2.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      alphabetReorganizerRule, alphabetQuestionStep.identifier);

//RPDirectStepNavigationRule navigationRuleAfterSmokingResult =
//    RPDirectStepNavigationRule(imageChoiceQuestionStep.identifier);

////////
///
///
///
///
///
///

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
    title: "", identifier: "b2InstructionStepID")
  ..text =
      "For the upcoming questions, please consider... \n\nWhich of the following diabetes areas are currently a problem for you? \n\n\nPress 'Continue' to go to the questions";

// B2 - 1
RPQuestionStep depressedChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "B2-1",
    "Feeling depressed when you think about living with diabetes?",
    likertProblemScaleAnswerFormat);

// B2 - 2
RPQuestionStep energyChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "B2-2",
    "Feeling that diabetes is taking up too much of your mental and physical energy?",
    likertProblemScaleAnswerFormat);

// B2 - 2b
RPQuestionStep energyChoiceQuestionStep2 = RPQuestionStep.withAnswerFormat(
    "B2-2b",
    "Feeling that diabetes is taking up too much of your mental and physical energy?",
    likertProblemScaleAnswerFormat);

//TODO: Implement the branching
// B2 - 3
RPQuestionStep overwhelmedChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "B2-3",
    "Feeling overwhelmed by your diabetes?",
    likertProblemScaleAnswerFormat);

// B2 - 4
RPQuestionStep foodChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "B2-4",
    "Feeling constantly concerned about food and eating?",
    likertProblemScaleAnswerFormat);

// B2 - 5
RPQuestionStep aloneChoiceQuestionStep = RPQuestionStep.withAnswerFormat("B2-5",
    "Feeling alone with your diabetes?", likertProblemScaleAnswerFormat);

// B2 - 6
RPQuestionStep burnedOutChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "B2-6",
    "Feeling “burned out” by the constant effort needed to manage diabetes?",
    likertProblemScaleAnswerFormat);

RPCompletionStep paidCompletionStep = RPCompletionStep("B2-7")
  ..title = "Finished"
  ..text = "Finished";

// Binst -> 1 -> 2 -> end
//          |    |
//         2b -> 3 -> 4 -> 5 -> 6 -> end
// Order of questions
// Binst, 1, 2, 2b, 3, 4, 5, 6, end

// PAID (B2) Branching:
RPStepJumpRule emotionalDistressBranchRule =
    RPStepJumpRule(depressedChoiceQuestionStep.identifier, {
  0: energyChoiceQuestionStep.identifier,
  1: energyChoiceQuestionStep.identifier,
  // 2+ -> go to 2b with extended version after
  2: energyChoiceQuestionStep2.identifier,
  3: energyChoiceQuestionStep2.identifier,
  4: energyChoiceQuestionStep2.identifier,
});
RPStepJumpRule emotionalDistressBranchRule2 =
    RPStepJumpRule(energyChoiceQuestionStep.identifier, {
  0: paidCompletionStep.identifier,
  1: paidCompletionStep.identifier,
  // 2+ -> go to extended version.
  2: overwhelmedChoiceQuestionStep.identifier,
  3: overwhelmedChoiceQuestionStep.identifier,
  4: overwhelmedChoiceQuestionStep.identifier,
});

RPOrderedTask emotionalDistress = RPNavigableOrderedTask(
  "emotionalDistress",
  [
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
  closeAfterFinished: false,
)
  ..setNavigationRuleForTriggerStepIdentifier(
      emotionalDistressBranchRule, depressedChoiceQuestionStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      emotionalDistressBranchRule2, energyChoiceQuestionStep.identifier);
