import 'package:test/test.dart';
import 'dart:convert';
import 'package:research_package/research_package.dart';

/// Tests are focusing mainly on Object -> JSON direction since the current
/// use-case for Research Package doesn't include the other way around,
/// only uploading results to server
void main() {
  String _encode(Object object) =>
      const JsonEncoder.withIndent(' ').convert(object);

  RPConsentSignature signature =
      RPConsentSignature.withIdentifier("signatureID");

  RPConsentSection overviewSection =
      RPConsentSection.withParams(RPConsentSectionType.Overview)
        ..summary = "Welcome to this survey"
        ..content = "Overview content";

  RPConsentSection dataGatheringSection =
      RPConsentSection.withParams(RPConsentSectionType.DataGathering)
        ..summary = "This is a summary for Data Gathering."
        ..content = "Data Gathering content";

  RPConsentDocument consentDocument = RPConsentDocument.withParams(
    'WHO5 Consent',
    [
      overviewSection,
      dataGatheringSection,
    ],
  );
  consentDocument.addSignature(signature);

  List<RPChoice> choices = [
    RPChoice(text: "All of the time", value: 5),
    RPChoice(text: "Most of the time", value: 4),
    RPChoice(text: "More than half of the time", value: 3),
    RPChoice(text: "Less than half of the time", value: 2),
    RPChoice(text: "Some of the time", value: 1),
    RPChoice(text: "At no time", value: 0),
  ];

  RPChoiceAnswerFormat choiceAnswerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice,
    choices: choices,
  );

  RPQuestionStep choiceQuestionStep1 = RPQuestionStep(
    "questionStep1ID",
    title: "I have felt cheerful and in good spirits",
    answerFormat: choiceAnswerFormat,
  );

  RPQuestionStep choiceQuestionStep2 = RPQuestionStep(
    "questionStep2ID",
    title: "I have felt calm and relaxed",
    answerFormat: choiceAnswerFormat,
  );

  RPFormStep formStep = RPFormStep(
    'form_step_1',
    steps: [choiceQuestionStep1, choiceQuestionStep2],
    title: 'A form w. questions',
  );

  RPStepResult stepResult1 = RPStepResult(choiceQuestionStep1);
  stepResult1.identifier = choiceQuestionStep1.identifier;
  stepResult1.setResult(5);

  RPStepResult stepResult2 = RPStepResult(choiceQuestionStep2);
  stepResult2.identifier = choiceQuestionStep1.identifier;
  stepResult2.setResult(1);

  RPTaskResult surveyTaskResult = RPTaskResult("surveyTaskResultID");
  surveyTaskResult.setStepResultForIdentifier("questionID1", stepResult1);
  surveyTaskResult.setStepResultForIdentifier("questionID2", stepResult2);

  RPSignatureResult signatureResult = RPSignatureResult.withParams(
      "TestFirstName",
      "TestLastName",
      "pngbytes in form of a long long string");

  RPConsentSignatureResult consentSignatureResult = RPConsentSignatureResult(
      'consentSignatureID', consentDocument, signatureResult);

  RPConsentReviewStep consentReviewStep =
      RPConsentReviewStep('consentReviewStepID', consentDocument);

  RPStepResult consentReviewStepResult = RPStepResult(consentReviewStep);
  consentReviewStepResult.setResult(consentSignatureResult);

  RPTaskResult consentTaskResult = RPTaskResult("consentTaskResultID");
  consentTaskResult.setStepResultForIdentifier(
      "signature", consentReviewStepResult);

  setUp(() {
    // register all json serialization functions.
    registerFromJsonFunctions();
  });

  group('Consent Document', () {
    test('RPConsentDocument -> JSON', () {
      print(_encode(consentDocument));

      expect(consentDocument.title, "WHO5 Consent");
    });

    test('JSON -> RPConsentDocument, assert document title', () {
      final consentDocumentJson = _encode(consentDocument);

      RPConsentDocument consentDocument_2 = RPConsentDocument.fromJson(
          json.decode(consentDocumentJson) as Map<String, dynamic>);
      expect(consentDocument_2.title, consentDocument.title);

      print(_encode(consentDocument_2));
    });

    // Consent Section

    test('RPConsentSection -> JSON', () {
      print(_encode(overviewSection));

      expect(overviewSection.content, "Overview content");
    });

    test('JSON -> RPConsentDocument, assert document title', () {
      final consentDocumentJson = _encode(consentDocument);

      RPConsentDocument consentDocument_2 = RPConsentDocument.fromJson(
          json.decode(consentDocumentJson) as Map<String, dynamic>);
      expect(consentDocument_2.title, consentDocument.title);

      print(_encode(consentDocument_2));
    });

    test('RPConsentSignature -> JSON', () {
      print(_encode(signature));

      expect(signature.identifier, "signatureID");
    });

    test('JSON -> RPConsentSignature', () {
      final consentSignatureJson = _encode(signature);

      RPConsentSignature signature_2 = RPConsentSignature.fromJson(
          json.decode(consentSignatureJson) as Map<String, dynamic>);
      expect(signature_2.identifier, 'signatureID');

      print(_encode(signature_2));
    });
  });

  group('Choice Answer', () {
    test('RPAnswerFormat -> JSON', () {
      print(_encode(RPAnswerFormat()..questionType = RPQuestionType.Date));
    });

    test('RPChoiceAnswerFormat -> JSON', () {
      print(_encode(choiceAnswerFormat));

      expect(choiceAnswerFormat.choices, choices);
    });

    test('RPChoice -> JSON', () {
      print(_encode(choices.first));

      expect(choices.first.value, 5);
    });

    test('JSON -> RPChoiceAnswerFormat', () {
      final choiceJson = _encode(choiceAnswerFormat);

      RPAnswerFormat answers = RPAnswerFormat.fromJson(
          json.decode(choiceJson) as Map<String, dynamic>);
      expect(answers.runtimeType, RPChoiceAnswerFormat().runtimeType);
      expect(answers.questionType, RPQuestionType.SingleChoice);
      print(_encode(answers));
    });
  });

  group('Steps', () {
    test('RPQuestionStep -> JSON', () {
      print(_encode(choiceQuestionStep1));
    });

    test('RPInstructionStep -> JSON', () {
      print(_encode(RPInstructionStep('123',
          title: 'Jakob is here...', detailText: '... more details.')));
    });

    test('RPFormStep -> JSON', () {
      print(_encode(formStep));
    });

    test('JSON -> RPQuestionStep', () {
      final stepJson = _encode(choiceQuestionStep1);

      RPQuestionStep step = RPQuestionStep.fromJson(
          json.decode(stepJson) as Map<String, dynamic>);
      expect(step.runtimeType, RPQuestionStep('123').runtimeType);
      expect(step.identifier, choiceQuestionStep1.identifier);
      print(_encode(step));
    });
  });
  group('Results', () {
    test('RPStepResult -> JSON', () {
      print(_encode(stepResult1));
      expect(stepResult1.results["answer"], 5);
    });

    test('RPTaskResult (Survey) -> JSON', () {
      print(_encode(surveyTaskResult));
      expect(surveyTaskResult.results["questionID1"], stepResult1);
    });

    test('RPTaskResult (Consent Document) -> JSON', () {
      print(_encode(consentTaskResult));
      expect(consentTaskResult.results["signature"], consentReviewStepResult);
    });
  });
}
