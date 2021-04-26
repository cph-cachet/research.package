// GENERATED CODE - DO NOT MODIFY BY HAND

part of research_package_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RPAnswerFormat _$RPAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPAnswerFormat()
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPAnswerFormatToJson(RPAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$RPQuestionTypeEnumMap = {
  RPQuestionType.None: 'None',
  RPQuestionType.Scale: 'Scale',
  RPQuestionType.SingleChoice: 'SingleChoice',
  RPQuestionType.MultipleChoice: 'MultipleChoice',
  RPQuestionType.Decimal: 'Decimal',
  RPQuestionType.Integer: 'Integer',
  RPQuestionType.Boolean: 'Boolean',
  RPQuestionType.Eligibility: 'Eligibility',
  RPQuestionType.Text: 'Text',
  RPQuestionType.TimeOfDay: 'TimeOfDay',
  RPQuestionType.DateAndTime: 'DateAndTime',
  RPQuestionType.Date: 'Date',
  RPQuestionType.TimeInterval: 'TimeInterval',
  RPQuestionType.Duration: 'Duration',
  RPQuestionType.Location: 'Location',
  RPQuestionType.ImageChoice: 'ImageChoice',
  RPQuestionType.Form: 'Form',
};

RPIntegerAnswerFormat _$RPIntegerAnswerFormatFromJson(
    Map<String, dynamic> json) {
  return RPIntegerAnswerFormat(
    minValue: json['min_value'] as int,
    maxValue: json['max_value'] as int,
    suffix: json['suffix'] as String,
  )
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPIntegerAnswerFormatToJson(
    RPIntegerAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('min_value', instance.minValue);
  writeNotNull('max_value', instance.maxValue);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  return val;
}

RPChoiceAnswerFormat _$RPChoiceAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPChoiceAnswerFormat(
    answerStyle: _$enumDecodeNullable(
        _$RPChoiceAnswerStyleEnumMap, json['answer_style']),
    choices: (json['choices'] as List)
        ?.map((e) =>
            e == null ? null : RPChoice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPChoiceAnswerFormatToJson(
    RPChoiceAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  writeNotNull('choices', instance.choices);
  writeNotNull(
      'answer_style', _$RPChoiceAnswerStyleEnumMap[instance.answerStyle]);
  return val;
}

const _$RPChoiceAnswerStyleEnumMap = {
  RPChoiceAnswerStyle.SingleChoice: 'SingleChoice',
  RPChoiceAnswerStyle.MultipleChoice: 'MultipleChoice',
};

RPChoice _$RPChoiceFromJson(Map<String, dynamic> json) {
  return RPChoice(
    text: json['text'] as String,
    value: json['value'] as int,
    isFreeText: json['is_free_text'] as bool,
    detailText: json['detail_text'] as String,
  )..$type = json[r'$type'] as String;
}

Map<String, dynamic> _$RPChoiceToJson(RPChoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('text', instance.text);
  writeNotNull('value', instance.value);
  writeNotNull('detail_text', instance.detailText);
  writeNotNull('is_free_text', instance.isFreeText);
  return val;
}

RPFormAnswerFormat _$RPFormAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPFormAnswerFormat()
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPFormAnswerFormatToJson(RPFormAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  return val;
}

RPSliderAnswerFormat _$RPSliderAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPSliderAnswerFormat(
    minValue: (json['min_value'] as num)?.toDouble(),
    maxValue: (json['max_value'] as num)?.toDouble(),
    divisions: json['divisions'] as int,
    prefix: json['prefix'] as String,
    suffix: json['suffix'] as String,
  )
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPSliderAnswerFormatToJson(
    RPSliderAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('min_value', instance.minValue);
  writeNotNull('max_value', instance.maxValue);
  writeNotNull('divisions', instance.divisions);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  return val;
}

RPImageChoiceAnswerFormat _$RPImageChoiceAnswerFormatFromJson(
    Map<String, dynamic> json) {
  return RPImageChoiceAnswerFormat(
    choices: (json['choices'] as List)
        ?.map((e) => e == null
            ? null
            : RPImageChoice.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPImageChoiceAnswerFormatToJson(
    RPImageChoiceAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('choices', instance.choices);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  return val;
}

RPImageChoice _$RPImageChoiceFromJson(Map<String, dynamic> json) {
  return RPImageChoice(
    key: json['key'] as String,
    value: json['value'],
    description: json['description'] as String,
  )..$type = json[r'$type'] as String;
}

Map<String, dynamic> _$RPImageChoiceToJson(RPImageChoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  writeNotNull('description', instance.description);
  return val;
}

RPDateTimeAnswerFormat _$RPDateTimeAnswerFormatFromJson(
    Map<String, dynamic> json) {
  return RPDateTimeAnswerFormat(
    dateTimeAnswerStyle: _$enumDecodeNullable(
        _$RPDateTimeAnswerStyleEnumMap, json['date_time_answer_style']),
  )
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPDateTimeAnswerFormatToJson(
    RPDateTimeAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  writeNotNull('date_time_answer_style',
      _$RPDateTimeAnswerStyleEnumMap[instance.dateTimeAnswerStyle]);
  return val;
}

const _$RPDateTimeAnswerStyleEnumMap = {
  RPDateTimeAnswerStyle.DateAndTime: 'DateAndTime',
  RPDateTimeAnswerStyle.Date: 'Date',
  RPDateTimeAnswerStyle.TimeOfDay: 'TimeOfDay',
};

RPBooleanAnswerFormat _$RPBooleanAnswerFormatFromJson(
    Map<String, dynamic> json) {
  return RPBooleanAnswerFormat(
    trueText: json['true_text'] as String,
    falseText: json['false_text'] as String,
  )
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPBooleanAnswerFormatToJson(
    RPBooleanAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('true_text', instance.trueText);
  writeNotNull('false_text', instance.falseText);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  return val;
}

RPTextAnswerFormat _$RPTextAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPTextAnswerFormat(
    hintText: json['hint_text'] as String,
  )
    ..$type = json[r'$type'] as String
    ..questionType =
        _$enumDecodeNullable(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPTextAnswerFormatToJson(RPTextAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('hint_text', instance.hintText);
  writeNotNull('question_type', _$RPQuestionTypeEnumMap[instance.questionType]);
  return val;
}

RPConsentDocument _$RPConsentDocumentFromJson(Map<String, dynamic> json) {
  return RPConsentDocument(
    json['title'] as String,
    (json['sections'] as List)
        ?.map((e) => e == null
            ? null
            : RPConsentSection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..signatures = (json['signatures'] as List)
        ?.map((e) => e == null
            ? null
            : RPConsentSignature.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..signaturePageTitle = json['signature_page_title'] as String
    ..signaturePageContent = json['signature_page_content'] as String;
}

Map<String, dynamic> _$RPConsentDocumentToJson(RPConsentDocument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('signatures', instance.signatures);
  writeNotNull('title', instance.title);
  writeNotNull('sections', instance.sections);
  writeNotNull('signature_page_title', instance.signaturePageTitle);
  writeNotNull('signature_page_content', instance.signaturePageContent);
  return val;
}

RPConsentSection _$RPConsentSectionFromJson(Map<String, dynamic> json) {
  return RPConsentSection(
    _$enumDecode(_$RPConsentSectionTypeEnumMap, json['type']),
  )
    ..title = json['title'] as String
    ..formalTitle = json['formal_title'] as String
    ..summary = json['summary'] as String
    ..content = json['content'] as String
    ..dataTypes = (json['data_types'] as List)
        ?.map((e) => e == null
            ? null
            : RPDataTypeSection.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$RPConsentSectionToJson(RPConsentSection instance) {
  final val = <String, dynamic>{
    'type': _$RPConsentSectionTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('formal_title', instance.formalTitle);
  writeNotNull('summary', instance.summary);
  writeNotNull('content', instance.content);
  writeNotNull('data_types', instance.dataTypes);
  return val;
}

const _$RPConsentSectionTypeEnumMap = {
  RPConsentSectionType.Overview: 'Overview',
  RPConsentSectionType.DataGathering: 'DataGathering',
  RPConsentSectionType.Privacy: 'Privacy',
  RPConsentSectionType.DataUse: 'DataUse',
  RPConsentSectionType.TimeCommitment: 'TimeCommitment',
  RPConsentSectionType.Duration: 'Duration',
  RPConsentSectionType.StudyTasks: 'StudyTasks',
  RPConsentSectionType.StudySurvey: 'StudySurvey',
  RPConsentSectionType.Withdrawing: 'Withdrawing',
  RPConsentSectionType.YourRights: 'YourRights',
  RPConsentSectionType.Welcome: 'Welcome',
  RPConsentSectionType.AboutUs: 'AboutUs',
  RPConsentSectionType.Goals: 'Goals',
  RPConsentSectionType.Benefits: 'Benefits',
  RPConsentSectionType.DataHandling: 'DataHandling',
  RPConsentSectionType.UserDataCollection: 'UserDataCollection',
  RPConsentSectionType.PassiveDataCollection: 'PassiveDataCollection',
  RPConsentSectionType.Custom: 'Custom',
};

RPConsentSignature _$RPConsentSignatureFromJson(Map<String, dynamic> json) {
  return RPConsentSignature(
    json['identifier'] as String,
    title: json['title'] as String,
    requiresName: json['requires_name'] as bool,
    requiresSignatureImage: json['requires_signature_image'] as bool,
    requiresBirthDate: json['requires_birth_date'] as bool,
  );
}

Map<String, dynamic> _$RPConsentSignatureToJson(RPConsentSignature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('requires_name', instance.requiresName);
  writeNotNull('requires_signature_image', instance.requiresSignatureImage);
  writeNotNull('requires_birth_date', instance.requiresBirthDate);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('title', instance.title);
  return val;
}

RPVisualConsentStep _$RPVisualConsentStepFromJson(Map<String, dynamic> json) {
  return RPVisualConsentStep(
    json['identifier'] as String,
    json['consent_document'] == null
        ? null
        : RPConsentDocument.fromJson(
            json['consent_document'] as Map<String, dynamic>),
  )
    ..$type = json[r'$type'] as String
    ..title = json['title'] as String
    ..text = json['text'] as String
    ..optional = json['optional'] as bool;
}

Map<String, dynamic> _$RPVisualConsentStepToJson(RPVisualConsentStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('title', instance.title);
  writeNotNull('text', instance.text);
  writeNotNull('optional', instance.optional);
  writeNotNull('consent_document', instance.consentDocument);
  return val;
}

RPConsentReviewStep _$RPConsentReviewStepFromJson(Map<String, dynamic> json) {
  return RPConsentReviewStep(
    json['identifier'] as String,
    json['consent_document'] == null
        ? null
        : RPConsentDocument.fromJson(
            json['consent_document'] as Map<String, dynamic>),
  )
    ..$type = json[r'$type'] as String
    ..title = json['title'] as String
    ..optional = json['optional'] as bool
    ..text = json['text'] as String
    ..reasonForConsent = json['reason_for_consent'] as String;
}

Map<String, dynamic> _$RPConsentReviewStepToJson(RPConsentReviewStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('title', instance.title);
  writeNotNull('optional', instance.optional);
  writeNotNull('consent_document', instance.consentDocument);
  writeNotNull('text', instance.text);
  writeNotNull('reason_for_consent', instance.reasonForConsent);
  return val;
}

RPDataTypeSection _$RPDataTypeSectionFromJson(Map<String, dynamic> json) {
  return RPDataTypeSection(
    json['data_name'] as String,
    json['data_information'] as String,
  )..$type = json[r'$type'] as String;
}

Map<String, dynamic> _$RPDataTypeSectionToJson(RPDataTypeSection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('data_name', instance.dataName);
  writeNotNull('data_information', instance.dataInformation);
  return val;
}

RPStep _$RPStepFromJson(Map<String, dynamic> json) {
  return RPStep(
    json['identifier'] as String,
    title: json['title'] as String,
    optional: json['optional'] as bool,
  )
    ..$type = json[r'$type'] as String
    ..text = json['text'] as String;
}

Map<String, dynamic> _$RPStepToJson(RPStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('title', instance.title);
  writeNotNull('text', instance.text);
  writeNotNull('optional', instance.optional);
  return val;
}

RPFormStep _$RPFormStepFromJson(Map<String, dynamic> json) {
  return RPFormStep(
    json['identifier'] as String,
    steps: (json['steps'] as List)
        ?.map((e) => e == null
            ? null
            : RPQuestionStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    title: json['title'] as String,
    optional: json['optional'] as bool,
  )
    ..$type = json[r'$type'] as String
    ..text = json['text'] as String
    ..placeholder = json['placeholder'] as String
    ..answerFormat = json['answer_format'] == null
        ? null
        : RPAnswerFormat.fromJson(
            json['answer_format'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RPFormStepToJson(RPFormStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('title', instance.title);
  writeNotNull('text', instance.text);
  writeNotNull('optional', instance.optional);
  writeNotNull('placeholder', instance.placeholder);
  writeNotNull('steps', instance.steps);
  writeNotNull('answer_format', instance.answerFormat);
  return val;
}

RPQuestionStep _$RPQuestionStepFromJson(Map<String, dynamic> json) {
  return RPQuestionStep(
    json['identifier'] as String,
    answerFormat: json['answer_format'] == null
        ? null
        : RPAnswerFormat.fromJson(
            json['answer_format'] as Map<String, dynamic>),
    title: json['title'] as String,
    optional: json['optional'] as bool,
  )
    ..$type = json[r'$type'] as String
    ..text = json['text'] as String
    ..placeholder = json['placeholder'] as String;
}

Map<String, dynamic> _$RPQuestionStepToJson(RPQuestionStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('title', instance.title);
  writeNotNull('text', instance.text);
  writeNotNull('optional', instance.optional);
  writeNotNull('answer_format', instance.answerFormat);
  writeNotNull('placeholder', instance.placeholder);
  return val;
}

RPInstructionStep _$RPInstructionStepFromJson(Map<String, dynamic> json) {
  return RPInstructionStep(
    json['identifier'] as String,
    title: json['title'] as String,
    detailText: json['detail_text'] as String,
    footnote: json['footnote'] as String,
    imagePath: json['image_path'] as String,
  )
    ..$type = json[r'$type'] as String
    ..text = json['text'] as String
    ..optional = json['optional'] as bool;
}

Map<String, dynamic> _$RPInstructionStepToJson(RPInstructionStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('title', instance.title);
  writeNotNull('text', instance.text);
  writeNotNull('optional', instance.optional);
  writeNotNull('detail_text', instance.detailText);
  writeNotNull('footnote', instance.footnote);
  writeNotNull('image_path', instance.imagePath);
  return val;
}

RPCompletionStep _$RPCompletionStepFromJson(Map<String, dynamic> json) {
  return RPCompletionStep(
    json['identifier'] as String,
  )
    ..$type = json[r'$type'] as String
    ..title = json['title'] as String
    ..text = json['text'] as String
    ..optional = json['optional'] as bool;
}

Map<String, dynamic> _$RPCompletionStepToJson(RPCompletionStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('title', instance.title);
  writeNotNull('text', instance.text);
  writeNotNull('optional', instance.optional);
  return val;
}

RPOrderedTask _$RPOrderedTaskFromJson(Map<String, dynamic> json) {
  return RPOrderedTask(
    json['identifier'] as String,
    (json['steps'] as List)
        ?.map((e) =>
            e == null ? null : RPStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    closeAfterFinished: json['close_after_finished'] as bool,
  )..$type = json[r'$type'] as String;
}

Map<String, dynamic> _$RPOrderedTaskToJson(RPOrderedTask instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('close_after_finished', instance.closeAfterFinished);
  writeNotNull('steps', instance.steps);
  return val;
}

RPNavigableOrderedTask _$RPNavigableOrderedTaskFromJson(
    Map<String, dynamic> json) {
  return RPNavigableOrderedTask(
    json['identifier'] as String,
    (json['steps'] as List)
        ?.map((e) =>
            e == null ? null : RPStep.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    closeAfterFinished: json['close_after_finished'],
    shouldReportProgress: json['should_report_progress'],
  )..$type = json[r'$type'] as String;
}

Map<String, dynamic> _$RPNavigableOrderedTaskToJson(
    RPNavigableOrderedTask instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(r'$type', instance.$type);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('close_after_finished', instance.closeAfterFinished);
  writeNotNull('steps', instance.steps);
  writeNotNull('should_report_progress', instance.shouldReportProgress);
  return val;
}

RPTaskResult _$RPTaskResultFromJson(Map<String, dynamic> json) {
  return RPTaskResult(
    json['identifier'] as String,
  )
    ..startDate = json['start_date'] == null
        ? null
        : DateTime.parse(json['start_date'] as String)
    ..endDate = json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String)
    ..results = json['results'] as Map<String, dynamic>;
}

Map<String, dynamic> _$RPTaskResultToJson(RPTaskResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('results', instance.results);
  return val;
}

RPStepResult _$RPStepResultFromJson(Map<String, dynamic> json) {
  return RPStepResult()
    ..identifier = json['identifier'] as String
    ..startDate = json['start_date'] == null
        ? null
        : DateTime.parse(json['start_date'] as String)
    ..endDate = json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String)
    ..questionTitle = json['question_title'] as String
    ..results = json['results'] as Map<String, dynamic>
    ..answerFormat = json['answer_format'] == null
        ? null
        : RPAnswerFormat.fromJson(
            json['answer_format'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RPStepResultToJson(RPStepResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('question_title', instance.questionTitle);
  writeNotNull('results', instance.results);
  writeNotNull('answer_format', instance.answerFormat);
  return val;
}

RPConsentSignatureResult _$RPConsentSignatureResultFromJson(
    Map<String, dynamic> json) {
  return RPConsentSignatureResult(
    json['identifier'] as String,
    json['consent_document'] == null
        ? null
        : RPConsentDocument.fromJson(
            json['consent_document'] as Map<String, dynamic>),
    json['signature'] == null
        ? null
        : RPSignatureResult.fromJson(json['signature'] as Map<String, dynamic>),
  )
    ..startDate = json['start_date'] == null
        ? null
        : DateTime.parse(json['start_date'] as String)
    ..endDate = json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String)
    ..userID = json['user_i_d'] as String;
}

Map<String, dynamic> _$RPConsentSignatureResultToJson(
    RPConsentSignatureResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identifier', instance.identifier);
  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  writeNotNull('consent_document', instance.consentDocument);
  writeNotNull('signature', instance.signature);
  writeNotNull('user_i_d', instance.userID);
  return val;
}

RPSignatureResult _$RPSignatureResultFromJson(Map<String, dynamic> json) {
  return RPSignatureResult()
    ..firstName = json['first_name'] as String
    ..lastName = json['last_name'] as String
    ..signatureImage = json['signature_image'] as String;
}

Map<String, dynamic> _$RPSignatureResultToJson(RPSignatureResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('signature_image', instance.signatureImage);
  return val;
}
