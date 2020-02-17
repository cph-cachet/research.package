import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

List<RPChoice> yesNoChoices = [
  RPChoice.withParams("Yes", 1),
  RPChoice.withParams("No", 0),
];

RPChoiceAnswerFormat yesNoAnswerFormat = RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, yesNoChoices);
RPQuestionStep smokingQuestion =
    RPQuestionStep.withAnswerFormat("smokingQuestionId", "Do you smoke?", yesNoAnswerFormat);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "instructionID",
  title: "Welcome!",
  detailText: "For the sake of science of course...",
)..text =
    "Please fill out this questionnaire!\n\nIn this questionnaire answers to some questions will determine what other questions you will get. You can not skip these question, although you are free to skip the other questions.";

RPNavigableOrderedTask navigableSurveyTask = RPNavigableOrderedTask(
  "NavigableTaskID",
  [
    instructionStep,
    smokingQuestion,
    completionStep,
  ],
  [],
);
