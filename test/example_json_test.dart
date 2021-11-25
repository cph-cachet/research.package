import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:research_package/research_package.dart';

import '../example/lib/research_package_objects/infomed_consent_objects.dart';
import '../example/lib/research_package_objects/linear_survey_objects.dart';
import '../example/lib/research_package_objects/other_navigable_survey_examples.dart';

/// These tests takes the examples from the example app and tests de/serialization.
void main() {
  String _encode(Object object) =>
      const JsonEncoder.withIndent(' ').convert(object);

  setUp(() {
    // create two dummy RPTask to register json deserialization functions for RP
    RPTask(identifier: 'ignored');
  });

  group('Consent Document', () {
    test('Consent Document -> JSON', () {
      print(_encode(consentTask));

      expect(consentTask.steps.length, 4);
    });

    test('Consent Document -> JSON -> Consent Document :: deep assert',
        () async {
      final consentJson = _encode(consentTask);

      RPOrderedTask consent = RPOrderedTask.fromJson(
          json.decode(consentJson) as Map<String, dynamic>);
      expect(_encode(consent), equals(consentJson));
    });

    test('JSON file -> Consent Document', () async {
      String plainJson = File('test/json/consent_task.json').readAsStringSync();

      RPOrderedTask consent = RPOrderedTask.fromJson(
          json.decode(plainJson) as Map<String, dynamic>);

      expect(consent.steps.length, 4);
      expect(
          consent.steps.first.identifier, consentTask.steps.first.identifier);
      print(_encode(consent));
    });
  });

  group('Linear Survey', () {
    test('Linear Survey -> JSON', () {
      print(_encode(linearSurveyTask));
    });

    test('Linear Survey -> JSON -> Linear Survey :: deep assert', () async {
      final surveyJson = _encode(linearSurveyTask);

      RPOrderedTask survey = RPOrderedTask.fromJson(
          json.decode(surveyJson) as Map<String, dynamic>);
      expect(_encode(survey), equals(surveyJson));
    });

    test('JSON file -> Linear Survey', () async {
      String surveyJson =
          File('test/json/linear_survey.json').readAsStringSync();

      RPOrderedTask survey = RPOrderedTask.fromJson(
          json.decode(surveyJson) as Map<String, dynamic>);

      expect(survey.steps.length, linearSurveyTask.steps.length);
      expect(survey.steps.first.identifier,
          linearSurveyTask.steps.first.identifier);
      print(_encode(survey));
    });
  });

  group('Navigable Survey', () {
    test('Navigable Survey -> JSON', () {
      print(_encode(emotionalDistress));
    });

    test('Navigable Survey -> JSON -> Navigable Survey :: deep assert',
        () async {
      final surveyJson = _encode(emotionalDistress);

      RPNavigableOrderedTask emotional = RPNavigableOrderedTask.fromJson(
          json.decode(surveyJson) as Map<String, dynamic>);
      expect(_encode(emotional), equals(surveyJson));
    });

    test('JSON file -> Navigable Survey', () async {
      String surveyJson =
          File('test/json/navigable_survey.json').readAsStringSync();

      RPNavigableOrderedTask emotional = RPNavigableOrderedTask.fromJson(
          json.decode(surveyJson) as Map<String, dynamic>);

      expect(emotional.steps.length, emotionalDistress.steps.length);
      expect(emotional.steps.first.identifier,
          emotionalDistress.steps.first.identifier);
      print(_encode(emotional));
    });
  });
}
