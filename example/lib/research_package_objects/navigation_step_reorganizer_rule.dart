import 'package:research_package/model.dart';

/////////////////////////////////////
/// RPStepReorganizerRule Example ///
/////////////////////////////////////

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

RPStepReorganizerRule alphabetReorganizerRule =
    RPStepReorganizerRule(reorderingMap: {
  3: instructionStepD.identifier,
  2: instructionStepC.identifier,
  1: instructionStepB.identifier,
  0: instructionStepA.identifier
});

RPNavigableOrderedTask stepReorganizerNavigationExample =
    RPNavigableOrderedTask(
  identifier: "NavigableTaskID",
  steps: [
    alphabetQuestionStep,
    instructionStepA,
    instructionStepB,
    instructionStepC,
    instructionStepD,
  ],
)..setNavigationRuleForTriggerStepIdentifier(
        alphabetReorganizerRule, alphabetQuestionStep.identifier);
