import 'package:test/test.dart';
import 'dart:convert';
import 'package:research_package/research_package.dart';

void main() {
  // Tests are focusing mainly on Object -> JSON direction since the current
  // use-case for Research Package doesn't include the other way around, only uploading results to server
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
    RPChoice.withParams("All of the time", 5),
    RPChoice.withParams("Most of the time", 4),
    RPChoice.withParams("More than half of the time", 3),
    RPChoice.withParams("Less than half of the time", 2),
    RPChoice.withParams("Some of the time", 1),
    RPChoice.withParams("At no time", 0),
  ];

  RPChoiceAnswerFormat choiceAnswerFormat =
      RPChoiceAnswerFormat.withParams(ChoiceAnswerStyle.SingleChoice, choices);

  RPQuestionStep choiceQuestionStep1 = RPQuestionStep.withAnswerFormat(
    "questionStep1ID",
    "I have felt cheerful and in good spirits",
    choiceAnswerFormat,
  );

  RPQuestionStep choiceQuestionStep2 = RPQuestionStep.withAnswerFormat(
      "questionStep2ID", "I have felt calm and relaxed", choiceAnswerFormat);

  RPStepResult stepResult1 = RPStepResult.withParams(choiceQuestionStep1);
  stepResult1.identifier = choiceQuestionStep1.identifier;
  stepResult1.setResult(5);

  RPStepResult stepResult2 = RPStepResult.withParams(choiceQuestionStep2);
  stepResult2.identifier = choiceQuestionStep1.identifier;
  stepResult2.setResult(1);

  RPTaskResult surveyTaskResult = RPTaskResult.withParams("surveyTaskResultID");
  surveyTaskResult.setStepResultForIdentifier("questionID1", stepResult1);
  surveyTaskResult.setStepResultForIdentifier("questionID2", stepResult2);

  RPSignatureResult signatureResult = RPSignatureResult.withParams(
      "TestFirstName",
      "TestLastName",
      "pngbytes in form of a long long string");

  RPConsentSignatureResult consentSignatureResult =
      RPConsentSignatureResult.withParams(
          'consentSignatureID', consentDocument, signatureResult);

  RPConsentReviewStep consentReviewStep =
      RPConsentReviewStep('consentReviewStepID', consentDocument);

  RPStepResult consentReviewStepResult =
      RPStepResult.withParams(consentReviewStep);
  consentReviewStepResult.setResult(consentSignatureResult);

  RPTaskResult consentTaskResult =
      RPTaskResult.withParams("consentTaskResultID");
  consentTaskResult.setStepResultForIdentifier(
      "signature", consentReviewStepResult);

  // Consent Document - including the test of encoding of RPConsentSection

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

  // Choice Answer Format

  group('Choice Answer', () {
    test('RPChoiceAnswerFormat -> JSON', () {
      print(_encode(choiceAnswerFormat));

      expect(choiceAnswerFormat.choices, choices);
    });

    test('RPChoice -> JSON', () {
      print(_encode(choices.first));

      expect(choices.first.value, 5);
    });

    test('JSON -> RPChoice', () {
      final choiceJson = _encode(choices.first);

      RPChoice choice_2 =
          RPChoice.fromJson(json.decode(choiceJson) as Map<String, dynamic>);
      expect(choice_2.value, 5);
      print(_encode(choice_2));
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
