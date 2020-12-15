import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

///
/// CHOICES
///

List<RPImageChoice> images = [
  RPImageChoice.withParams(Image.asset('assets/images/very-sad.png'), 0, 'Feeling very sad'),
  RPImageChoice.withParams(Image.asset('assets/images/sad.png'), 0, 'Feeling sad'),
  RPImageChoice.withParams(Image.asset('assets/images/ok.png'), 0, 'Feeling ok'),
  RPImageChoice.withParams(Image.asset('assets/images/happy.png'), 0, 'Feeling happy'),
  RPImageChoice.withParams(Image.asset('assets/images/very-happy.png'), 0, 'Feeling very happy'),
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

List<RPChoice> who5Choices = [
  RPChoice.withParams("All of the time", 5),
  RPChoice.withParams("Most of the time", 4),
  RPChoice.withParams("More than half of the time", 3),
  RPChoice.withParams("Less than half of the time", 2),
  RPChoice.withParams("Some of the time", 1),
  RPChoice.withParams("At no time", 0),
];

List<RPChoice> instruments = [
  RPChoice.withParams("Piano", 1),
  RPChoice.withParams("Guitar", 0),
];

List<RPChoice> guitarReasons = [
  RPChoice.withParams("Fun", 3),
  RPChoice.withParams("Easy to play", 2),
  RPChoice.withParams("Charming", 1),
  RPChoice.withParams("Popular", 0),
];

List<RPChoice> numbers = [
  RPChoice.withParams("Four", 3),
  RPChoice.withParams("Three", 2),
  RPChoice.withParams("Two", 1),
  RPChoice.withParams("One", 0),
];

List<RPChoice> alphabet = [
  RPChoice.withParams("D", 3),
  RPChoice.withParams("C", 2),
  RPChoice.withParams("B", 1),
  RPChoice.withParams("A", 0),
];

///
/// ANSWER FORMATS
///

RPBooleanAnswerFormat yesNoAnswerFormat = RPBooleanAnswerFormat.withParams("Yes", "No");
RPImageChoiceAnswerFormat imageChoiceAnswerFormat = RPImageChoiceAnswerFormat.withParams(images);
RPIntegerAnswerFormat nrOfCigarettesAnswerFormat = RPIntegerAnswerFormat.withParams(0, 200, "cigarettes");
RPChoiceAnswerFormat who5AnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, who5Choices);
RPChoiceAnswerFormat joyfulActivitiesAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, joyfulActivities);
RPChoiceAnswerFormat numbersAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, numbers);
RPChoiceAnswerFormat alphabetAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, alphabet);
RPChoiceAnswerFormat instrumentsAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, instruments);
RPIntegerAnswerFormat minutesIntegerAnswerFormat = RPIntegerAnswerFormat.withParams(0, 10000, "minutes");
RPChoiceAnswerFormat guitarAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, guitarReasons);

///
/// STEPS
///

RPQuestionStep smokingQuestionStep =
    RPQuestionStep.withAnswerFormat("smokingQuestionId", "Do you smoke?", yesNoAnswerFormat);

RPQuestionStep imageChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "imageStepID",
  "Indicate you mood by selecting a picture!",
  imageChoiceAnswerFormat,
);

RPQuestionStep nrOfCigarettesQuestionStep = RPQuestionStep.withAnswerFormat(
    "nrOfCigarettesQuestionStepID", "How many cigarettes do you smoke a day?", nrOfCigarettesAnswerFormat);

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

RPInstructionStep instructionStepA =
    RPInstructionStep(identifier: "instructionStepAID", title: "A", detailText: "A detail")..text = "text";
RPInstructionStep instructionStepB =
    RPInstructionStep(identifier: "instructionStepBID", title: "B", detailText: "B detail")..text = "text";
RPInstructionStep instructionStepC =
    RPInstructionStep(identifier: "instructionStepCID", title: "C", detailText: "C detail")..text = "text";
RPInstructionStep instructionStepD =
    RPInstructionStep(identifier: "instructionStepDID", title: "D", detailText: "D detail")..text = "text";

RPQuestionStep instrumentChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "instrumentChoiceQuestionStepID", "Which instrument are you playing?", instrumentsAnswerFormat);
RPQuestionStep minutesQuestionStep = RPQuestionStep.withAnswerFormat(
    "minutesQuestionStepID", "How many minutes do you spend practicing a week?", minutesIntegerAnswerFormat);
RPFormStep formStep = RPFormStep.withTitle(
  "formstepID",
  [instrumentChoiceQuestionStep, minutesQuestionStep],
  "Questions about music",
  optional: true,
);

RPQuestionStep guitarChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "guitarChoiceQuestionStepID", "Why did you start playing the guitar?", guitarAnswerFormat);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

///
/// PREDICATES
///

RPResultPredicate singleChoicePredicate = RPResultPredicate.forChoiceQuestionResult(
    resultSelector: RPResultSelector.forStepId("singleChoiceQuestionStepID"),
    expectedValue: [5],
    choiceQuestionResultPredicateMode: ChoiceQuestionResultPredicateMode.ExactMatch);

RPResultPredicate exactMultiChoicePredicate = RPResultPredicate.forChoiceQuestionResult(
    resultSelector: RPResultSelector.forStepId("multiChoiceQuestionStepID1"),
    expectedValue: [0, 6],
    choiceQuestionResultPredicateMode: ChoiceQuestionResultPredicateMode.ExactMatch);

RPResultPredicate containingMultiChoicePredicate = RPResultPredicate.forChoiceQuestionResult(
    resultSelector: RPResultSelector.forStepId("multiChoiceQuestionStepID2"),
    expectedValue: [1],
    choiceQuestionResultPredicateMode: ChoiceQuestionResultPredicateMode.Containing);

RPResultPredicate yesSmokingPredicate = RPResultPredicate.forBooleanQuestionResult(
    resultSelector: RPResultSelector.forStepId("smokingQuestionId"), expectedValue: true);

RPResultPredicate noSmokingPredicate = RPResultPredicate.forBooleanQuestionResult(
    resultSelector: RPResultSelector.forStepId("smokingQuestionId"), expectedValue: false);

RPResultPredicate instrumentChoicePredicate = RPResultPredicate.forChoiceQuestionResult(
    resultSelector: RPResultSelector.forStepIdInFormStep("instrumentChoiceQuestionStepID"),
    expectedValue: [1],
    choiceQuestionResultPredicateMode: ChoiceQuestionResultPredicateMode.ExactMatch);

///
/// NAVIGATION RULES
///

RPPredicateStepNavigationRule smokingNavigationRule = RPPredicateStepNavigationRule(
  {
    noSmokingPredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule singleChoiceNavigationRule = RPPredicateStepNavigationRule(
  {
    singleChoicePredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule exactMultiChoiceNavigationRule = RPPredicateStepNavigationRule(
  {
    exactMultiChoicePredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule containingMultiChoiceNavigationRule = RPPredicateStepNavigationRule(
  {
    containingMultiChoicePredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule guitarNavigationRule = RPPredicateStepNavigationRule(
  {
    instrumentChoicePredicate: smokingQuestionStep.identifier,
  },
);

RPStepReorganizerRule alphabetReorganizerRule = RPStepReorganizerRule(alphabetQuestionStep.identifier, {
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
  ..setNavigationRuleForTriggerStepIdentifier(smokingNavigationRule, smokingQuestionStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(singleChoiceNavigationRule, singleChoiceQuestionStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      exactMultiChoiceNavigationRule, multiChoiceQuestionStep1.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(guitarNavigationRule, formStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(
      containingMultiChoiceNavigationRule, multiChoiceQuestionStep2.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(alphabetReorganizerRule, alphabetQuestionStep.identifier);

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
  RPChoice.withParams("Not a problem", 0),
  RPChoice.withParams("Minor problem", 1),
  RPChoice.withParams("Moderate problem", 2),
  RPChoice.withParams("Somewhat serious problem", 3),
  RPChoice.withParams("Serious problem", 4),
];
RPChoiceAnswerFormat likertProblemScaleAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, likertProblemScaleAnswers);

// PAID
// B2 SHORT (Long has been archived if later necessary)
RPInstructionStep b2InstructionStep = RPInstructionStep(title: "", identifier: "b2InstructionStepID")
  ..text =
      "For the upcoming questions, please consider... \n\nWhich of the following diabetes areas are currently a problem for you? \n\n\nPress 'Continue' to go to the questions";

// B2 - 1
RPQuestionStep depressedChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "B2-1", "Feeling depressed when you think about living with diabetes?", likertProblemScaleAnswerFormat);

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
    "B2-3", "Feeling overwhelmed by your diabetes?", likertProblemScaleAnswerFormat);

// B2 - 4
RPQuestionStep foodChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "B2-4", "Feeling constantly concerned about food and eating?", likertProblemScaleAnswerFormat);

// B2 - 5
RPQuestionStep aloneChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
    "B2-5", "Feeling alone with your diabetes?", likertProblemScaleAnswerFormat);

// B2 - 6
RPQuestionStep burnedOutChoiceQuestionStep = RPQuestionStep.withAnswerFormat("B2-6",
    "Feeling “burned out” by the constant effort needed to manage diabetes?", likertProblemScaleAnswerFormat);

RPCompletionStep paidCompletionStep = RPCompletionStep("B2-7")
  ..title = "Finished"
  ..text = "Finished";

// Binst -> 1 -> 2 -> end
//          |    |
//         2b -> 3 -> 4 -> 5 -> 6 -> end
// Order of questions
// Binst, 1, 2, 2b, 3, 4, 5, 6, end

// PAID (B2) Branching:
RPStepJumpRule emotionalDistressBranchRule = RPStepJumpRule(depressedChoiceQuestionStep.identifier, {
  0: energyChoiceQuestionStep.identifier,
  1: energyChoiceQuestionStep.identifier,
  // 2+ -> go to 2b with extended version after
  2: energyChoiceQuestionStep2.identifier,
  3: energyChoiceQuestionStep2.identifier,
  4: energyChoiceQuestionStep2.identifier,
});
RPStepJumpRule emotionalDistressBranchRule2 = RPStepJumpRule(energyChoiceQuestionStep.identifier, {
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
