import 'package:research_package/research_package.dart';

////////////////////////////////
/// RPStepJumpRule Example 1 ///
////////////////////////////////

// Answer format for Question 1
List<RPChoice> yesNo = [
  RPChoice(text: "Yes", value: 1),
  RPChoice(text: "No", value: 0),
];
RPChoiceAnswerFormat yesNoAnswerFormat = RPChoiceAnswerFormat(
  answerStyle: RPChoiceAnswerStyle.SingleChoice,
  choices: yesNo,
);

// Questions 1
RPQuestionStep smokingQuestionStep = RPQuestionStep(
    identifier: "smokingQuestionId",
    title: "Do you smoke?",
    answerFormat: yesNoAnswerFormat);

RPIntegerAnswerFormat nrOfCigarettesAnswerFormat =
    RPIntegerAnswerFormat(minValue: 0, maxValue: 200, suffix: "cigarettes");

// Question 2
RPQuestionStep nrOfCigarettesQuestionStep = RPQuestionStep(
    identifier: "nrOfCigarettesQuestionStepID",
    title: "How many cigarettes do you smoke a day?",
    answerFormat: nrOfCigarettesAnswerFormat);

// The rule that dictates how the survey should navigate based on the answer.
// If answer is 0, go to `nrOfCigarettesQuestionStep`
// otherwise if answer is 1, go to `completionStep`
RPStepJumpRule noSmokingJumpRule = RPStepJumpRule(answerMap: {
  1: nrOfCigarettesQuestionStep.identifier,
  0: completionStep.identifier,
});

// Completions step that indicates you are done with the survey
RPCompletionStep completionStep = RPCompletionStep(
    identifier: "completionID",
    title: "Finished",
    text: "Thank you for filling out the survey!");

RPNavigableOrderedTask stepJumpNavigationExample1 = RPNavigableOrderedTask(
  identifier: "NavigableTaskID",
  steps: [
    smokingQuestionStep,
    nrOfCigarettesQuestionStep,
    completionStep,
  ],
)..setNavigationRuleForTriggerStepIdentifier(
    noSmokingJumpRule, smokingQuestionStep.identifier);

////////////////////////////////
/// RPStepJumpRule Example 2 ///
////////////////////////////////

// Answer options
List<RPChoice> alphabet = [
  RPChoice(text: "D", value: 3),
  RPChoice(text: "C", value: 2),
  RPChoice(text: "B", value: 1),
  RPChoice(text: "A", value: 0),
];
RPChoiceAnswerFormat alphabetAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice, choices: alphabet);

// Question 1
RPQuestionStep alphabetQuestionStep = RPQuestionStep(
  identifier: "alphabetQuestionStepID",
  title: "Choose (a) letter(s)",
  answerFormat: alphabetAnswerFormat,
);

// Destinations:
// A
RPInstructionStep instructionStepA = RPInstructionStep(
    identifier: "instructionStepAID",
    title: "A",
    detailText: "A detail",
    text: "A");

// B
RPInstructionStep instructionStepB = RPInstructionStep(
    identifier: "instructionStepBID",
    title: "B",
    detailText: "B detail",
    text: "B");

// C
RPInstructionStep instructionStepC = RPInstructionStep(
    identifier: "instructionStepCID",
    title: "C",
    detailText: "C detail",
    text: "C");

// D
RPInstructionStep instructionStepD = RPInstructionStep(
    identifier: "instructionStepDID",
    title: "D",
    detailText: "D detail",
    text: "D");

RPStepJumpRule alphabetJumpRule = RPStepJumpRule(answerMap: {
  3: instructionStepD.identifier,
  2: instructionStepC.identifier,
  1: instructionStepB.identifier,
  0: instructionStepA.identifier
});

RPNavigableOrderedTask stepJumpNavigationExample2 = RPNavigableOrderedTask(
  identifier: "NavigableTaskID",
  steps: [
    alphabetQuestionStep,
    instructionStepA,
    instructionStepB,
    instructionStepC,
    instructionStepD,
  ],
)..setNavigationRuleForTriggerStepIdentifier(
    alphabetJumpRule, alphabetQuestionStep.identifier);
