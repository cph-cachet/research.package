// GENERATED CODE - DO NOT MODIFY BY HAND

part of research_package_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RPAnswerFormat _$RPAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPAnswerFormat()
    ..questionType =
        _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPAnswerFormatToJson(RPAnswerFormat instance) =>
    <String, dynamic>{
      'question_type': _$RPQuestionTypeEnumMap[instance.questionType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
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
    suffix: json['suffix'] as String?,
  )..questionType =
      _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPIntegerAnswerFormatToJson(
    RPIntegerAnswerFormat instance) {
  final val = <String, dynamic>{
    'min_value': instance.minValue,
    'max_value': instance.maxValue,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('suffix', instance.suffix);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType];
  return val;
}

RPChoiceAnswerFormat _$RPChoiceAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPChoiceAnswerFormat(
    answerStyle:
        _$enumDecode(_$RPChoiceAnswerStyleEnumMap, json['answer_style']),
    choices: (json['choices'] as List<dynamic>)
        .map((e) => RPChoice.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..questionType =
      _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPChoiceAnswerFormatToJson(
        RPChoiceAnswerFormat instance) =>
    <String, dynamic>{
      'question_type': _$RPQuestionTypeEnumMap[instance.questionType],
      'choices': instance.choices,
      'answer_style': _$RPChoiceAnswerStyleEnumMap[instance.answerStyle],
    };

const _$RPChoiceAnswerStyleEnumMap = {
  RPChoiceAnswerStyle.SingleChoice: 'SingleChoice',
  RPChoiceAnswerStyle.MultipleChoice: 'MultipleChoice',
};

RPChoice _$RPChoiceFromJson(Map<String, dynamic> json) {
  return RPChoice(
    text: json['text'] as String,
    value: json['value'] as int,
    isFreeText: json['is_free_text'] as bool,
    detailText: json['detail_text'] as String?,
  );
}

Map<String, dynamic> _$RPChoiceToJson(RPChoice instance) {
  final val = <String, dynamic>{
    'text': instance.text,
    'value': instance.value,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detail_text', instance.detailText);
  val['is_free_text'] = instance.isFreeText;
  return val;
}

RPFormAnswerFormat _$RPFormAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPFormAnswerFormat()
    ..questionType =
        _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPFormAnswerFormatToJson(RPFormAnswerFormat instance) =>
    <String, dynamic>{
      'question_type': _$RPQuestionTypeEnumMap[instance.questionType],
    };

RPSliderAnswerFormat _$RPSliderAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPSliderAnswerFormat(
    minValue: (json['min_value'] as num).toDouble(),
    maxValue: (json['max_value'] as num).toDouble(),
    divisions: json['divisions'] as int,
    prefix: json['prefix'] as String?,
    suffix: json['suffix'] as String?,
  )..questionType =
      _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPSliderAnswerFormatToJson(
    RPSliderAnswerFormat instance) {
  final val = <String, dynamic>{
    'min_value': instance.minValue,
    'max_value': instance.maxValue,
    'divisions': instance.divisions,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType];
  return val;
}

RPImageChoiceAnswerFormat _$RPImageChoiceAnswerFormatFromJson(
    Map<String, dynamic> json) {
  return RPImageChoiceAnswerFormat(
    choices: (json['choices'] as List<dynamic>)
        .map((e) => RPImageChoice.fromJson(e as Map<String, dynamic>))
        .toList(),
  )..questionType =
      _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPImageChoiceAnswerFormatToJson(
        RPImageChoiceAnswerFormat instance) =>
    <String, dynamic>{
      'choices': instance.choices,
      'question_type': _$RPQuestionTypeEnumMap[instance.questionType],
    };

RPImageChoice _$RPImageChoiceFromJson(Map<String, dynamic> json) {
  return RPImageChoice(
    imageUrl: json['image_url'] as String,
    key: json['key'] as String?,
    value: json['value'],
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$RPImageChoiceToJson(RPImageChoice instance) {
  final val = <String, dynamic>{
    'image_url': instance.imageUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  val['description'] = instance.description;
  return val;
}

RPDateTimeAnswerFormat _$RPDateTimeAnswerFormatFromJson(
    Map<String, dynamic> json) {
  return RPDateTimeAnswerFormat(
    dateTimeAnswerStyle: _$enumDecode(
        _$RPDateTimeAnswerStyleEnumMap, json['date_time_answer_style']),
  )..questionType =
      _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPDateTimeAnswerFormatToJson(
        RPDateTimeAnswerFormat instance) =>
    <String, dynamic>{
      'question_type': _$RPQuestionTypeEnumMap[instance.questionType],
      'date_time_answer_style':
          _$RPDateTimeAnswerStyleEnumMap[instance.dateTimeAnswerStyle],
    };

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
  )..questionType =
      _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPBooleanAnswerFormatToJson(
        RPBooleanAnswerFormat instance) =>
    <String, dynamic>{
      'true_text': instance.trueText,
      'false_text': instance.falseText,
      'question_type': _$RPQuestionTypeEnumMap[instance.questionType],
    };

RPTextAnswerFormat _$RPTextAnswerFormatFromJson(Map<String, dynamic> json) {
  return RPTextAnswerFormat(
    hintText: json['hint_text'] as String?,
  )..questionType =
      _$enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);
}

Map<String, dynamic> _$RPTextAnswerFormatToJson(RPTextAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('hint_text', instance.hintText);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType];
  return val;
}

RPConsentDocument _$RPConsentDocumentFromJson(Map<String, dynamic> json) {
  return RPConsentDocument(
    json['title'] as String,
    (json['sections'] as List<dynamic>)
        .map((e) => RPConsentSection.fromJson(e as Map<String, dynamic>))
        .toList(),
  )
    ..signatures = (json['signatures'] as List<dynamic>)
        .map((e) => RPConsentSignature.fromJson(e as Map<String, dynamic>))
        .toList()
    ..signaturePageTitle = json['signature_page_title'] as String?
    ..signaturePageContent = json['signature_page_content'] as String?;
}

Map<String, dynamic> _$RPConsentDocumentToJson(RPConsentDocument instance) {
  final val = <String, dynamic>{
    'signatures': instance.signatures,
    'title': instance.title,
    'sections': instance.sections,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('signature_page_title', instance.signaturePageTitle);
  writeNotNull('signature_page_content', instance.signaturePageContent);
  return val;
}

RPConsentSection _$RPConsentSectionFromJson(Map<String, dynamic> json) {
  return RPConsentSection(
    type: _$enumDecode(_$RPConsentSectionTypeEnumMap, json['type']),
    title: json['title'] as String?,
  )
    ..formalTitle = json['formal_title'] as String?
    ..summary = json['summary'] as String?
    ..content = json['content'] as String?
    ..dataTypes = (json['data_types'] as List<dynamic>?)
        ?.map((e) => RPDataTypeSection.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$RPConsentSectionToJson(RPConsentSection instance) {
  final val = <String, dynamic>{
    'type': _$RPConsentSectionTypeEnumMap[instance.type],
    'title': instance.title,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

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
    identifier: json['identifier'] as String,
    title: json['title'] as String?,
    requiresName: json['requires_name'] as bool,
    requiresSignatureImage: json['requires_signature_image'] as bool,
  );
}

Map<String, dynamic> _$RPConsentSignatureToJson(RPConsentSignature instance) {
  final val = <String, dynamic>{
    'requires_name': instance.requiresName,
    'requires_signature_image': instance.requiresSignatureImage,
    'identifier': instance.identifier,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  return val;
}

RPVisualConsentStep _$RPVisualConsentStepFromJson(Map<String, dynamic> json) {
  return RPVisualConsentStep(
    json['identifier'] as String,
    RPConsentDocument.fromJson(
        json['consent_document'] as Map<String, dynamic>),
  )
    ..title = json['title'] as String
    ..text = json['text'] as String
    ..optional = json['optional'] as bool;
}

Map<String, dynamic> _$RPVisualConsentStepToJson(
        RPVisualConsentStep instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'title': instance.title,
      'text': instance.text,
      'optional': instance.optional,
      'consent_document': instance.consentDocument,
    };

RPConsentReviewStep _$RPConsentReviewStepFromJson(Map<String, dynamic> json) {
  return RPConsentReviewStep(
    identifier: json['identifier'] as String,
    consentDocument: RPConsentDocument.fromJson(
        json['consent_document'] as Map<String, dynamic>),
  )
    ..title = json['title'] as String
    ..optional = json['optional'] as bool
    ..text = json['text'] as String
    ..reasonForConsent = json['reason_for_consent'] as String?;
}

Map<String, dynamic> _$RPConsentReviewStepToJson(RPConsentReviewStep instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
    'title': instance.title,
    'optional': instance.optional,
    'consent_document': instance.consentDocument,
    'text': instance.text,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('reason_for_consent', instance.reasonForConsent);
  return val;
}

RPDataTypeSection _$RPDataTypeSectionFromJson(Map<String, dynamic> json) {
  return RPDataTypeSection(
    json['data_name'] as String,
    json['data_information'] as String,
  );
}

Map<String, dynamic> _$RPDataTypeSectionToJson(RPDataTypeSection instance) =>
    <String, dynamic>{
      'data_name': instance.dataName,
      'data_information': instance.dataInformation,
    };

RPStep _$RPStepFromJson(Map<String, dynamic> json) {
  return RPStep(
    identifier: json['identifier'] as String,
    title: json['title'] as String,
    optional: json['optional'] as bool,
  )..text = json['text'] as String;
}

Map<String, dynamic> _$RPStepToJson(RPStep instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'title': instance.title,
      'text': instance.text,
      'optional': instance.optional,
    };

RPFormStep _$RPFormStepFromJson(Map<String, dynamic> json) {
  return RPFormStep(
    identifier: json['identifier'] as String,
    steps: (json['steps'] as List<dynamic>)
        .map((e) => RPQuestionStep.fromJson(e as Map<String, dynamic>))
        .toList(),
    title: json['title'] as String,
    optional: json['optional'] as bool,
  )
    ..text = json['text'] as String
    ..answerFormat =
        RPAnswerFormat.fromJson(json['answer_format'] as Map<String, dynamic>)
    ..placeholder = json['placeholder'] as String?;
}

Map<String, dynamic> _$RPFormStepToJson(RPFormStep instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
    'title': instance.title,
    'text': instance.text,
    'optional': instance.optional,
    'answer_format': instance.answerFormat,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('placeholder', instance.placeholder);
  val['steps'] = instance.steps;
  return val;
}

RPQuestionStep _$RPQuestionStepFromJson(Map<String, dynamic> json) {
  return RPQuestionStep(
    identifier: json['identifier'] as String,
    answerFormat:
        RPAnswerFormat.fromJson(json['answer_format'] as Map<String, dynamic>),
    title: json['title'] as String,
    optional: json['optional'] as bool,
  )
    ..text = json['text'] as String
    ..placeholder = json['placeholder'] as String?;
}

Map<String, dynamic> _$RPQuestionStepToJson(RPQuestionStep instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
    'title': instance.title,
    'text': instance.text,
    'optional': instance.optional,
    'answer_format': instance.answerFormat,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('placeholder', instance.placeholder);
  return val;
}

RPInstructionStep _$RPInstructionStepFromJson(Map<String, dynamic> json) {
  return RPInstructionStep(
    json['identifier'] as String,
    title: json['title'] as String,
    detailText: json['detail_text'] as String?,
    footnote: json['footnote'] as String?,
    imagePath: json['image_path'] as String?,
  )
    ..text = json['text'] as String
    ..optional = json['optional'] as bool;
}

Map<String, dynamic> _$RPInstructionStepToJson(RPInstructionStep instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
    'title': instance.title,
    'text': instance.text,
    'optional': instance.optional,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('detail_text', instance.detailText);
  writeNotNull('footnote', instance.footnote);
  writeNotNull('image_path', instance.imagePath);
  return val;
}

RPCompletionStep _$RPCompletionStepFromJson(Map<String, dynamic> json) {
  return RPCompletionStep(
    identifier: json['identifier'] as String,
    title: json['title'] as String,
  )
    ..text = json['text'] as String
    ..optional = json['optional'] as bool;
}

Map<String, dynamic> _$RPCompletionStepToJson(RPCompletionStep instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'title': instance.title,
      'text': instance.text,
      'optional': instance.optional,
    };

RPOrderedTask _$RPOrderedTaskFromJson(Map<String, dynamic> json) {
  return RPOrderedTask(
    identifier: json['identifier'] as String,
    steps: (json['steps'] as List<dynamic>)
        .map((e) => RPStep.fromJson(e as Map<String, dynamic>))
        .toList(),
    closeAfterFinished: json['close_after_finished'] as bool,
  );
}

Map<String, dynamic> _$RPOrderedTaskToJson(RPOrderedTask instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'close_after_finished': instance.closeAfterFinished,
      'steps': instance.steps,
    };

RPNavigableOrderedTask _$RPNavigableOrderedTaskFromJson(
    Map<String, dynamic> json) {
  return RPNavigableOrderedTask(
    identifier: json['identifier'] as String,
    steps: (json['steps'] as List<dynamic>)
        .map((e) => RPStep.fromJson(e as Map<String, dynamic>))
        .toList(),
    closeAfterFinished: json['close_after_finished'],
    shouldReportProgress: json['should_report_progress'] as bool,
  );
}

Map<String, dynamic> _$RPNavigableOrderedTaskToJson(
        RPNavigableOrderedTask instance) =>
    <String, dynamic>{
      'identifier': instance.identifier,
      'close_after_finished': instance.closeAfterFinished,
      'steps': instance.steps,
      'should_report_progress': instance.shouldReportProgress,
    };

RPTask _$RPTaskFromJson(Map<String, dynamic> json) {
  return RPTask(
    identifier: json['identifier'] as String,
    closeAfterFinished: json['close_after_finished'] as bool,
  );
}

Map<String, dynamic> _$RPTaskToJson(RPTask instance) => <String, dynamic>{
      'identifier': instance.identifier,
      'close_after_finished': instance.closeAfterFinished,
    };

RPTaskResult _$RPTaskResultFromJson(Map<String, dynamic> json) {
  return RPTaskResult(
    identifier: json['identifier'] as String,
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
  final val = <String, dynamic>{
    'identifier': instance.identifier,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  val['results'] = instance.results;
  return val;
}

RPStepResult _$RPStepResultFromJson(Map<String, dynamic> json) {
  return RPStepResult(
    identifier: json['identifier'] as String,
    answerFormat: json['answer_format'] == null
        ? null
        : RPAnswerFormat.fromJson(
            json['answer_format'] as Map<String, dynamic>),
  )
    ..startDate = json['start_date'] == null
        ? null
        : DateTime.parse(json['start_date'] as String)
    ..endDate = json['end_date'] == null
        ? null
        : DateTime.parse(json['end_date'] as String)
    ..questionTitle = json['question_title'] as String
    ..results = json['results'] as Map<String, dynamic>;
}

Map<String, dynamic> _$RPStepResultToJson(RPStepResult instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  val['question_title'] = instance.questionTitle;
  val['results'] = instance.results;
  writeNotNull('answer_format', instance.answerFormat);
  return val;
}

RPConsentSignatureResult _$RPConsentSignatureResultFromJson(
    Map<String, dynamic> json) {
  return RPConsentSignatureResult(
    json['identifier'] as String,
    RPConsentDocument.fromJson(
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
    ..userID = json['user_i_d'] as String?;
}

Map<String, dynamic> _$RPConsentSignatureResultToJson(
    RPConsentSignatureResult instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('start_date', instance.startDate?.toIso8601String());
  writeNotNull('end_date', instance.endDate?.toIso8601String());
  val['consent_document'] = instance.consentDocument;
  writeNotNull('signature', instance.signature);
  writeNotNull('user_i_d', instance.userID);
  return val;
}

RPSignatureResult _$RPSignatureResultFromJson(Map<String, dynamic> json) {
  return RPSignatureResult()
    ..firstName = json['first_name'] as String?
    ..lastName = json['last_name'] as String?
    ..signatureImage = json['signature_image'] as String?;
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
