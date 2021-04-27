/// The domain model part of Research Package.
/// Contains the "building blocks" for creating surveys and obtaining informed consents.
/// Holds the different types of result classes.
/// Also responsible for the streams and BLoC classes to provide communication channels
/// between different parts of the package. ([BlocQuestion], [BlocTask])
/// For the UI representations of the classes visit the [research_package_ui] library.

library research_package_model;

// Imports
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

// the carp core domain model incl. polymorphic json serialization
import 'package:carp_core/carp_common/carp_core_common.dart';

// Importing the UI library from Research Package
import 'package:research_package/ui.dart';

// JSON
part 'model.g.dart';

// Library elements
part 'src/model/answerformat/RPAnswerFormat.dart';
part 'src/model/answerformat/RPIntegerAnswerFormat.dart';
part 'src/model/answerformat/RPChoiceAnswerFormat.dart';
part 'src/model/answerformat/RPFormAnswerFormat.dart';
part 'src/model/answerformat/RPSliderAnswerFormat.dart';
part 'src/model/answerformat/RPImageChoiceAnswerFormat.dart';
part 'src/model/answerformat/RPDateTimeAnswerFormat.dart';
part 'src/model/answerformat/RPBooleanAnswerFormat.dart';
part 'src/model/answerformat/RPTextAnswerFormat.dart';

part 'src/model/consent/RPConsentDocument.dart';
part 'src/model/consent/RPConsentSection.dart';
part 'src/model/consent/RPConsentSignature.dart';
part 'src/model/consent/RPVisualConsentStep.dart';
part 'src/model/consent/RPConsentReviewStep.dart';
part 'src/model/consent/RPDataTypeSection.dart';

part 'src/model/step/RPStep.dart';
part 'src/model/step/RPFormStep.dart';
part 'src/model/step/RPQuestionStep.dart';
part 'src/model/step/RPInstructionStep.dart';
part 'src/model/step/RPCompletionStep.dart';

part 'src/model/task/RPOrderedTask.dart';
part 'src/model/task/RPNavigableOrderedTask.dart';
part 'src/model/task/RPStepNavigationRule.dart';
part 'src/model/task/RPDirectStepNavigationRule.dart';
part 'src/model/task/RPPredicateStepNavigationRule.dart';
part 'src/model/task/RPPStepReorganizerRule.dart';
part 'src/model/task/RPStepJumpRule.dart';
//part 'src/model/task/RPSkipStepNavigationRule.dart';
//part 'src/model/task/RPStepModifier.dart';
part 'src/model/task/RPResultPredicate.dart';
part 'src/model/task/RPTask.dart';

part 'src/model/result/RPResult.dart';
part 'src/model/result/RPTaskResult.dart';
part 'src/model/result/RPStepResult.dart';
//part 'src/model/result/RPQuestionBodyResult.dart';
part 'src/model/result/RPConsentSignatureResult.dart';
part 'src/model/result/RPSignatureResult.dart';

// Protocols
part 'src/model/Abstracts.dart';

// BLoCs
part 'src/model/blocs/BlocTask.dart';
part 'src/model/blocs/BlocQuestion.dart';

bool _fromJsonFunctionsRegistrered = false;

/// Register all the fromJson functions for the deployment domain classes.
void registerFromJsonFunctions() {
  if (_fromJsonFunctionsRegistrered) return;
  _fromJsonFunctionsRegistrered = true;

  // AnswerFormat classes
  FromJsonFactory().register(RPAnswerFormat());
  FromJsonFactory().register(RPBooleanAnswerFormat());
  FromJsonFactory().register(RPChoiceAnswerFormat());
  FromJsonFactory().register(RPChoice());
  FromJsonFactory().register(RPDateTimeAnswerFormat());
  FromJsonFactory().register(RPFormAnswerFormat());
  FromJsonFactory().register(RPImageChoiceAnswerFormat());
  FromJsonFactory().register(RPImageChoice());
  FromJsonFactory().register(RPIntegerAnswerFormat());
  FromJsonFactory().register(RPSliderAnswerFormat());
  FromJsonFactory().register(RPTextAnswerFormat());

  // Steps classes
  FromJsonFactory().register(RPStep(''));
  FromJsonFactory().register(RPQuestionStep(''));
  FromJsonFactory().register(RPInstructionStep(''));
  FromJsonFactory().register(RPFormStep(''));
  FromJsonFactory().register(RPCompletionStep(''));

  // Consent Document classes
  FromJsonFactory().register(RPConsentReviewStep('', null));
  FromJsonFactory().register(RPVisualConsentStep('', null));

  // Tasks classes
  FromJsonFactory().register(RPOrderedTask('', []));
  FromJsonFactory().register(RPNavigableOrderedTask('', []));
  FromJsonFactory().register(RPDataTypeSection('', ''));
}

// auto generate json code (.g files) with:
//   flutter pub run build_runner build --delete-conflicting-outputs
