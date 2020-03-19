import 'package:flutter/widgets.dart';
import 'package:research_package/model.dart';

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

RPBooleanAnswerFormat yesNoAnswerFormat = RPBooleanAnswerFormat.withParams("Yes", "No");
RPImageChoiceAnswerFormat imageChoiceAnswerFormat = RPImageChoiceAnswerFormat.withParams(images);
RPIntegerAnswerFormat nrOfCigarettesAnswerFormat = RPIntegerAnswerFormat.withParams(0, 200, "cigarettes");
RPChoiceAnswerFormat who5AnswerFormat = RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, who5Choices);
RPChoiceAnswerFormat joyfulActivitiesAnswerFormat =
    RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.MultipleChoice, joyfulActivities);

RPQuestionStep smokingQuestion =
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

RPQuestionStep singleChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "singleChoiceQuestionStepID",
  "I have felt cheerful and in good spirits",
  who5AnswerFormat,
);

RPQuestionStep multiChoiceQuestionStep = RPQuestionStep.withAnswerFormat(
  "multiChoiceQuestionStepID",
  "What makes you happy?",
  joyfulActivitiesAnswerFormat,
);

RPResultPredicate singleChoicePredicate = RPResultPredicate.forChoiceQuestionResult(
    resultSelector: RPResultSelector.forStepId("singleChoiceQuestionStepID"), expectedValue: [5]);

RPResultPredicate multiChoicePredicate = RPResultPredicate.forChoiceQuestionResult(
    resultSelector: RPResultSelector.forStepId("multiChoiceQuestionStepID"), expectedValue: [0, 6]);

RPResultPredicate yesSmokingPredicate = RPResultPredicate.forBooleanQuestionResult(
    resultSelector: RPResultSelector.forStepId("smokingQuestionId"), expectedValue: true);

RPResultPredicate noSmokingPredicate = RPResultPredicate.forBooleanQuestionResult(
    resultSelector: RPResultSelector.forStepId("smokingQuestionId"), expectedValue: false);

RPPredicateStepNavigationRule smokingNavigationRule = RPPredicateStepNavigationRule(
  {
//    yesSmokingPredicate: nrOfCigarettesQuestionStep.identifier,
//    noSmokingPredicate: imageChoiceQuestionStep.identifier,
    noSmokingPredicate: afterNoSmokingStep.identifier,
  },
);

RPPredicateStepNavigationRule singleChoiceNavigationRule = RPPredicateStepNavigationRule(
  {
    singleChoicePredicate: imageChoiceQuestionStep.identifier,
  },
);

RPPredicateStepNavigationRule multiChoiceNavigationRule = RPPredicateStepNavigationRule(
  {
    multiChoicePredicate: imageChoiceQuestionStep.identifier,
  },
);

RPCompletionStep completionStep = RPCompletionStep("completionID")
  ..title = "Finished"
  ..text = "Thank you for filling out the survey!";

RPNavigableOrderedTask navigableSurveyTask = RPNavigableOrderedTask(
  "NavigableTaskID",
  [
    instructionStep,
//    multiChoiceQuestionStep,
//    singleChoiceQuestionStep,
    smokingQuestion,
    nrOfCigarettesQuestionStep,
//    imageChoiceQuestionStep,
    afterNoSmokingStep,
    afterYesSmokingStep,
    completionStep,
  ],
)
  ..setNavigationRuleForTriggerStepIdentifier(smokingNavigationRule, smokingQuestion.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(singleChoiceNavigationRule, singleChoiceQuestionStep.identifier)
  ..setNavigationRuleForTriggerStepIdentifier(multiChoiceNavigationRule, multiChoiceQuestionStep.identifier);

//RPDirectStepNavigationRule navigationRuleAfterSmokingResult =
//    RPDirectStepNavigationRule(imageChoiceQuestionStep.identifier);
