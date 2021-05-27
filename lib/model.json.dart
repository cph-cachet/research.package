// GENERATED CODE - DO NOT MODIFY BY HAND

part of research_package_model;

bool _fromJsonFunctionsRegistrered = false;

/// Register all the fromJson functions for the deployment domain classes.
void _registerFromJsonFunctions() {
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
  FromJsonFactory().register(RPConsentDocument('', []));
  FromJsonFactory().register(RPConsentSection(RPConsentSectionType.AboutUs));
  FromJsonFactory().register(RPConsentSignature(''));

  // Tasks classes
  FromJsonFactory().register(RPOrderedTask('', []));
  FromJsonFactory().register(RPNavigableOrderedTask('', []));
  FromJsonFactory().register(RPDataTypeSection('', ''));
}

// auto generate json code (.g files) with:
//   flutter pub run build_runner build --delete-conflicting-outputs
