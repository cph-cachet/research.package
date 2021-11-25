import 'package:research_package/model.dart';

//////////////////////////////////////////
/// RPDirectStepNavigationRule Example ///
//////////////////////////////////////////

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
// You will jump past this
RPInstructionStep instructionStepYouWontSee = RPInstructionStep(
    identifier: "instructionStepAID",
    title: "You wont see me",
    detailText: "Detail",
    text: "You jumped past me");

// You will jump past this
RPInstructionStep instructionStepYouWontSee2 = RPInstructionStep(
    identifier: "instructionStepYouWontSee2ID",
    title: "You wont see me",
    detailText: "Detail",
    text: "You jumped past me");

// You will jump past this
RPInstructionStep instructionStepYouWontSee3 = RPInstructionStep(
    identifier: "instructionStepYouWontSee3ID",
    title: "You wont see me",
    detailText: "Detail",
    text: "You jumped past me");

// You will jump to this!
RPInstructionStep instructionStepYouWillSee = RPInstructionStep(
    identifier: "instructionStepYouWillSeeID",
    title: "You will jump to me",
    detailText: "Detail",
    text:
        "You jumped to me and didnt see the other steps - thats how the direct navigation step works");

RPDirectStepNavigationRule directStepNavigationRule =
    RPDirectStepNavigationRule(
        destinationStepIdentifier: instructionStepYouWillSee.identifier);

RPNavigableOrderedTask directNavigationExample = RPNavigableOrderedTask(
  identifier: "NavigableTaskID",
  steps: [
    alphabetQuestionStep,
    instructionStepYouWontSee,
    instructionStepYouWontSee2,
    instructionStepYouWontSee3,
    instructionStepYouWillSee,
  ],
)..setNavigationRuleForTriggerStepIdentifier(
    directStepNavigationRule, alphabetQuestionStep.identifier);
