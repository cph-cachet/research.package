import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

List<RPImageChoice> images = [
  RPImageChoice.withParams(Image.asset('assets/images/very-sad.png'), 0, 'Feeling very sad'),
  RPImageChoice.withParams(Image.asset('assets/images/sad.png'), 0, 'Feeling sad'),
  RPImageChoice.withParams(Image.asset('assets/images/ok.png'), 0, 'Feeling ok'),
  RPImageChoice.withParams(Image.asset('assets/images/happy.png'), 0, 'Feeling happy'),
  RPImageChoice.withParams(Image.asset('assets/images/very-happy.png'), 0, 'Feeling very happy'),
];

RPBooleanAnswerFormat yesNoAnswerFormat = RPBooleanAnswerFormat.withParams("Yes", "No");
RPImageChoiceAnswerFormat imageChoiceAnswerFormat = RPImageChoiceAnswerFormat.withParams(images);
RPIntegerAnswerFormat nrOfCigarettesAnswerFormat = RPIntegerAnswerFormat.withParams(0, 200, "cigarettes");

RPQuestionStep smokingQuestion =
    RPQuestionStep.withAnswerFormat("smokingQuestionId", "Do you smoke?", yesNoAnswerFormat);

RPQuestionStep imageChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "imageStepID",
  "Indicate you mood by selecting a picture!",
  imageChoiceAnswerFormat,
);

RPQuestionStep nrOfCigarettesQuestionStep =
RPQuestionStep.withAnswerFormat("nrOfCigarettesQuestionStepID", "How many cigarettes do you smoke a day?", nrOfCigarettesAnswerFormat);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPInstructionStep instructionStep = RPInstructionStep(
  identifier: "instructionID",
  title: "Welcome!",
  detailText: "For the sake of science of course...",
)..text =
    "Please fill out this questionnaire!\n\nIn this questionnaire answers to some questions will determine what other questions you will get. You can not skip these question, although you are free to skip the other questions.";

RPInstructionStep afterYesSmokingStep = RPInstructionStep(
  identifier: "yesSmokingStepId",
  title: "Oh no :(",
  detailText: "You should quit!",
)..text = "We're sorry that you are smoking bruh";

RPInstructionStep afterNoSmokingStep = RPInstructionStep(
  identifier: "noSmokingStepId",
  title: "Yea boi :)",
  detailText: "Keep it up!",
)..text = "You are a healthy dude";

RPResultPredicate yesSmokingPredicate = RPResultPredicate.forBooleanQuestionResult(
    resultSelector: RPResultSelector.forStepId("smokingQuestionId"), expectedValue: true);

RPResultPredicate noSmokingPredicate = RPResultPredicate.forBooleanQuestionResult(
    resultSelector: RPResultSelector.forStepId("smokingQuestionId"), expectedValue: false);

RPPredicateStepNavigationRule smokingNavigationRule = RPPredicateStepNavigationRule(
  {
//    yesSmokingPredicate: nrOfCigarettesQuestionStep.identifier,
    noSmokingPredicate: imageChoiceQuestionStep.identifier,
  },
);

RPDirectStepNavigationRule navigationRuleAfterSmokingResult = RPDirectStepNavigationRule(imageChoiceQuestionStep.identifier);

RPNavigableOrderedTask navigableSurveyTask = RPNavigableOrderedTask(
  "NavigableTaskID",
  [
    instructionStep,
    smokingQuestion,
    nrOfCigarettesQuestionStep,
    imageChoiceQuestionStep,
    completionStep,
  ],
)
  ..setNavigationRuleForTriggerStepIdentifier(smokingNavigationRule, smokingQuestion.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(navigationRuleAfterSmokingResult, afterYesSmokingStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(navigationRuleAfterSmokingResult, afterNoSmokingStep.identifier);
