// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RPAnswerFormat _$RPAnswerFormatFromJson(Map<String, dynamic> json) =>
    RPAnswerFormat()
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPAnswerFormatToJson(RPAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

const _$RPQuestionTypeEnumMap = {
  RPQuestionType.None: 'None',
  RPQuestionType.Scale: 'Scale',
  RPQuestionType.SingleChoice: 'SingleChoice',
  RPQuestionType.MultipleChoice: 'MultipleChoice',
  RPQuestionType.Decimal: 'Decimal',
  RPQuestionType.Integer: 'Integer',
  RPQuestionType.Boolean: 'Boolean',
  RPQuestionType.Text: 'Text',
  RPQuestionType.TimeOfDay: 'TimeOfDay',
  RPQuestionType.DateAndTime: 'DateAndTime',
  RPQuestionType.Date: 'Date',
  RPQuestionType.Duration: 'Duration',
  RPQuestionType.ImageChoice: 'ImageChoice',
  RPQuestionType.Double: 'Double',
  RPQuestionType.Form: 'Form',
};

RPIntegerAnswerFormat _$RPIntegerAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPIntegerAnswerFormat(
      minValue: json['min_value'] as int,
      maxValue: json['max_value'] as int,
      suffix: json['suffix'] as String?,
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPIntegerAnswerFormatToJson(
    RPIntegerAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['min_value'] = instance.minValue;
  val['max_value'] = instance.maxValue;
  writeNotNull('suffix', instance.suffix);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPDoubleAnswerFormat _$RPDoubleAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPDoubleAnswerFormat(
      minValue: (json['min_value'] as num).toDouble(),
      maxValue: (json['max_value'] as num).toDouble(),
      suffix: json['suffix'] as String?,
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPDoubleAnswerFormatToJson(
    RPDoubleAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['min_value'] = instance.minValue;
  val['max_value'] = instance.maxValue;
  writeNotNull('suffix', instance.suffix);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPChoiceAnswerFormat _$RPChoiceAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPChoiceAnswerFormat(
      answerStyle:
          $enumDecode(_$RPChoiceAnswerStyleEnumMap, json['answer_style']),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => RPChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPChoiceAnswerFormatToJson(
    RPChoiceAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  val['choices'] = instance.choices;
  val['answer_style'] = _$RPChoiceAnswerStyleEnumMap[instance.answerStyle]!;
  return val;
}

const _$RPChoiceAnswerStyleEnumMap = {
  RPChoiceAnswerStyle.SingleChoice: 'SingleChoice',
  RPChoiceAnswerStyle.MultipleChoice: 'MultipleChoice',
};

RPChoice _$RPChoiceFromJson(Map<String, dynamic> json) => RPChoice(
      text: json['text'] as String,
      value: json['value'] as int,
      isFreeText: json['is_free_text'] as bool? ?? false,
      detailText: json['detail_text'] as String?,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPChoiceToJson(RPChoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['text'] = instance.text;
  val['value'] = instance.value;
  writeNotNull('detail_text', instance.detailText);
  val['is_free_text'] = instance.isFreeText;
  return val;
}

RPFormAnswerFormat _$RPFormAnswerFormatFromJson(Map<String, dynamic> json) =>
    RPFormAnswerFormat()
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPFormAnswerFormatToJson(RPFormAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPSliderAnswerFormat _$RPSliderAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPSliderAnswerFormat(
      minValue: (json['min_value'] as num).toDouble(),
      maxValue: (json['max_value'] as num).toDouble(),
      divisions: json['divisions'] as int,
      prefix: json['prefix'] as String? ?? '',
      suffix: json['suffix'] as String? ?? '',
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPSliderAnswerFormatToJson(
    RPSliderAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['min_value'] = instance.minValue;
  val['max_value'] = instance.maxValue;
  val['divisions'] = instance.divisions;
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPImageChoiceAnswerFormat _$RPImageChoiceAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPImageChoiceAnswerFormat(
      choices: (json['choices'] as List<dynamic>)
          .map((e) => RPImageChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPImageChoiceAnswerFormatToJson(
    RPImageChoiceAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['choices'] = instance.choices;
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPImageChoice _$RPImageChoiceFromJson(Map<String, dynamic> json) =>
    RPImageChoice(
      imageUrl: json['image_url'] as String,
      key: json['key'] as String?,
      value: json['value'],
      description: json['description'] as String,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPImageChoiceToJson(RPImageChoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['image_url'] = instance.imageUrl;
  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  val['description'] = instance.description;
  return val;
}

RPDateTimeAnswerFormat _$RPDateTimeAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPDateTimeAnswerFormat(
      dateTimeAnswerStyle: $enumDecode(
          _$RPDateTimeAnswerStyleEnumMap, json['date_time_answer_style']),
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPDateTimeAnswerFormatToJson(
    RPDateTimeAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  val['date_time_answer_style'] =
      _$RPDateTimeAnswerStyleEnumMap[instance.dateTimeAnswerStyle]!;
  return val;
}

const _$RPDateTimeAnswerStyleEnumMap = {
  RPDateTimeAnswerStyle.DateAndTime: 'DateAndTime',
  RPDateTimeAnswerStyle.Date: 'Date',
  RPDateTimeAnswerStyle.TimeOfDay: 'TimeOfDay',
};

RPTextAnswerFormat _$RPTextAnswerFormatFromJson(Map<String, dynamic> json) =>
    RPTextAnswerFormat(
      hintText: json['hint_text'] as String?,
      autoFocus: json['auto_focus'] as bool? ?? false,
      disableHelpers: json['disable_helpers'] as bool? ?? false,
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['question_type']);

Map<String, dynamic> _$RPTextAnswerFormatToJson(RPTextAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  writeNotNull('hint_text', instance.hintText);
  val['auto_focus'] = instance.autoFocus;
  val['disable_helpers'] = instance.disableHelpers;
  val['question_type'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPConsentDocument _$RPConsentDocumentFromJson(Map<String, dynamic> json) =>
    RPConsentDocument(
      title: json['title'] as String,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => RPConsentSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..$type = json['__type'] as String?
      ..signatures = (json['signatures'] as List<dynamic>)
          .map((e) => RPConsentSignature.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RPConsentDocumentToJson(RPConsentDocument instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['signatures'] = instance.signatures;
  val['title'] = instance.title;
  val['sections'] = instance.sections;
  return val;
}

RPConsentSection _$RPConsentSectionFromJson(Map<String, dynamic> json) =>
    RPConsentSection(
      type: $enumDecode(_$RPConsentSectionTypeEnumMap, json['type']),
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      content: json['content'] as String?,
      dataTypes: (json['data_types'] as List<dynamic>?)
          ?.map((e) => RPDataTypeSection.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPConsentSectionToJson(RPConsentSection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['type'] = _$RPConsentSectionTypeEnumMap[instance.type]!;
  val['title'] = instance.title;
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
  RPConsentSectionType.Location: 'Location',
  RPConsentSectionType.Health: 'Health',
  RPConsentSectionType.UserDataCollection: 'UserDataCollection',
  RPConsentSectionType.PassiveDataCollection: 'PassiveDataCollection',
  RPConsentSectionType.Custom: 'Custom',
};

RPConsentSignature _$RPConsentSignatureFromJson(Map<String, dynamic> json) =>
    RPConsentSignature(
      identifier: json['identifier'] as String,
      title: json['title'] as String?,
      requiresName: json['requires_name'] as bool? ?? true,
      requiresSignatureImage: json['requires_signature_image'] as bool? ?? true,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPConsentSignatureToJson(RPConsentSignature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  writeNotNull('title', instance.title);
  val['requires_name'] = instance.requiresName;
  val['requires_signature_image'] = instance.requiresSignatureImage;
  return val;
}

RPVisualConsentStep _$RPVisualConsentStepFromJson(Map<String, dynamic> json) =>
    RPVisualConsentStep(
      identifier: json['identifier'] as String,
      consentDocument: RPConsentDocument.fromJson(
          json['consent_document'] as Map<String, dynamic>),
    )
      ..$type = json['__type'] as String?
      ..title = json['title'] as String
      ..text = json['text'] as String?
      ..optional = json['optional'] as bool;

Map<String, dynamic> _$RPVisualConsentStepToJson(RPVisualConsentStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  val['consent_document'] = instance.consentDocument;
  return val;
}

RPConsentReviewStep _$RPConsentReviewStepFromJson(Map<String, dynamic> json) =>
    RPConsentReviewStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      text: json['text'] as String?,
      consentDocument: RPConsentDocument.fromJson(
          json['consent_document'] as Map<String, dynamic>),
      reasonForConsent: json['reason_for_consent'] as String?,
    )
      ..$type = json['__type'] as String?
      ..optional = json['optional'] as bool;

Map<String, dynamic> _$RPConsentReviewStepToJson(RPConsentReviewStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  val['consent_document'] = instance.consentDocument;
  writeNotNull('reason_for_consent', instance.reasonForConsent);
  return val;
}

RPDataTypeSection _$RPDataTypeSectionFromJson(Map<String, dynamic> json) =>
    RPDataTypeSection(
      dataName: json['data_name'] as String,
      dataInformation: json['data_information'] as String,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPDataTypeSectionToJson(RPDataTypeSection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['data_name'] = instance.dataName;
  val['data_information'] = instance.dataInformation;
  return val;
}

RPStep _$RPStepFromJson(Map<String, dynamic> json) => RPStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      text: json['text'] as String?,
      optional: json['optional'] as bool? ?? false,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPStepToJson(RPStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  return val;
}

RPFormStep _$RPFormStepFromJson(Map<String, dynamic> json) => RPFormStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      optional: json['optional'] as bool? ?? false,
      autoSkip: json['auto_skip'] as bool? ?? false,
      timeout: json['timeout'] == null
          ? const Duration(seconds: 0)
          : Duration(microseconds: json['timeout'] as int),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => RPQuestionStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      saveResultsOnAutoSkip:
          json['save_results_on_auto_skip'] as bool? ?? false,
      forceWait: json['force_wait'] as bool? ?? false,
    )
      ..$type = json['__type'] as String?
      ..text = json['text'] as String?
      ..answerFormat =
          RPAnswerFormat.fromJson(json['answer_format'] as Map<String, dynamic>)
      ..placeholder = json['placeholder'] as String?
      ..autoFocus = json['auto_focus'] as bool;

Map<String, dynamic> _$RPFormStepToJson(RPFormStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  val['answer_format'] = instance.answerFormat;
  writeNotNull('placeholder', instance.placeholder);
  val['auto_skip'] = instance.autoSkip;
  val['timeout'] = instance.timeout.inMicroseconds;
  val['auto_focus'] = instance.autoFocus;
  val['questions'] = instance.questions;
  val['save_results_on_auto_skip'] = instance.saveResultsOnAutoSkip;
  val['force_wait'] = instance.forceWait;
  return val;
}

RPQuestionStep _$RPQuestionStepFromJson(Map<String, dynamic> json) =>
    RPQuestionStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      optional: json['optional'] as bool? ?? false,
      answerFormat: RPAnswerFormat.fromJson(
          json['answer_format'] as Map<String, dynamic>),
      autoSkip: json['auto_skip'] as bool? ?? false,
      timeout: json['timeout'] == null
          ? const Duration(seconds: 0)
          : Duration(microseconds: json['timeout'] as int),
      autoFocus: json['auto_focus'] as bool? ?? false,
    )
      ..$type = json['__type'] as String?
      ..text = json['text'] as String?
      ..placeholder = json['placeholder'] as String?;

Map<String, dynamic> _$RPQuestionStepToJson(RPQuestionStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  val['answer_format'] = instance.answerFormat;
  writeNotNull('placeholder', instance.placeholder);
  val['auto_skip'] = instance.autoSkip;
  val['timeout'] = instance.timeout.inMicroseconds;
  val['auto_focus'] = instance.autoFocus;
  return val;
}

RPInstructionStep _$RPInstructionStepFromJson(Map<String, dynamic> json) =>
    RPInstructionStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      text: json['text'] as String?,
      optional: json['optional'] as bool? ?? false,
      detailText: json['detail_text'] as String?,
      footnote: json['footnote'] as String?,
      imagePath: json['image_path'] as String?,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPInstructionStepToJson(RPInstructionStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  writeNotNull('detail_text', instance.detailText);
  writeNotNull('footnote', instance.footnote);
  writeNotNull('image_path', instance.imagePath);
  return val;
}

RPCompletionStep _$RPCompletionStepFromJson(Map<String, dynamic> json) =>
    RPCompletionStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      text: json['text'] as String?,
      optional: json['optional'] as bool? ?? false,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPCompletionStepToJson(RPCompletionStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  return val;
}

RPActivityStep _$RPActivityStepFromJson(Map<String, dynamic> json) =>
    RPActivityStep(
      identifier: json['identifier'] as String,
      includeInstructions: json['include_instructions'] as bool? ?? true,
      includeResults: json['include_results'] as bool? ?? true,
    )
      ..$type = json['__type'] as String?
      ..title = json['title'] as String
      ..text = json['text'] as String?
      ..optional = json['optional'] as bool;

Map<String, dynamic> _$RPActivityStepToJson(RPActivityStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  val['include_instructions'] = instance.includeInstructions;
  val['include_results'] = instance.includeResults;
  return val;
}

RPTimerStep _$RPTimerStepFromJson(Map<String, dynamic> json) => RPTimerStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      optional: json['optional'] as bool? ?? false,
      timeout: Duration(microseconds: json['timeout'] as int),
      playSound: json['play_sound'] as bool? ?? false,
      autoSkip: json['auto_skip'] as bool? ?? false,
      showTime: json['show_time'] as bool? ?? true,
    )
      ..$type = json['__type'] as String?
      ..text = json['text'] as String?;

Map<String, dynamic> _$RPTimerStepToJson(RPTimerStep instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['title'] = instance.title;
  writeNotNull('text', instance.text);
  val['optional'] = instance.optional;
  val['timeout'] = instance.timeout.inMicroseconds;
  val['play_sound'] = instance.playSound;
  val['auto_skip'] = instance.autoSkip;
  val['show_time'] = instance.showTime;
  return val;
}

RPOrderedTask _$RPOrderedTaskFromJson(Map<String, dynamic> json) =>
    RPOrderedTask(
      identifier: json['identifier'] as String,
      closeAfterFinished: json['close_after_finished'] as bool? ?? true,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RPStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPOrderedTaskToJson(RPOrderedTask instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['close_after_finished'] = instance.closeAfterFinished;
  val['steps'] = instance.steps;
  return val;
}

RPNavigableOrderedTask _$RPNavigableOrderedTaskFromJson(
        Map<String, dynamic> json) =>
    RPNavigableOrderedTask(
      identifier: json['identifier'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RPStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      closeAfterFinished: json['close_after_finished'] as bool? ?? true,
    )
      ..$type = json['__type'] as String?
      ..stepNavigationRules =
          (json['step_navigation_rules'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k, RPStepNavigationRule.fromJson(e as Map<String, dynamic>)),
      );

Map<String, dynamic> _$RPNavigableOrderedTaskToJson(
    RPNavigableOrderedTask instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['close_after_finished'] = instance.closeAfterFinished;
  val['steps'] = instance.steps;
  val['step_navigation_rules'] = instance.stepNavigationRules;
  return val;
}

RPStepNavigationRule _$RPStepNavigationRuleFromJson(
        Map<String, dynamic> json) =>
    RPStepNavigationRule()..$type = json['__type'] as String?;

Map<String, dynamic> _$RPStepNavigationRuleToJson(
    RPStepNavigationRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  return val;
}

RPDirectStepNavigationRule _$RPDirectStepNavigationRuleFromJson(
        Map<String, dynamic> json) =>
    RPDirectStepNavigationRule(
      destinationStepIdentifier: json['destination_step_identifier'] as String,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPDirectStepNavigationRuleToJson(
    RPDirectStepNavigationRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['destination_step_identifier'] = instance.destinationStepIdentifier;
  return val;
}

RPStepReorganizerRule _$RPStepReorganizerRuleFromJson(
        Map<String, dynamic> json) =>
    RPStepReorganizerRule(
      reorderingMap: (json['reordering_map'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPStepReorganizerRuleToJson(
    RPStepReorganizerRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['reordering_map'] =
      instance.reorderingMap.map((k, e) => MapEntry(k.toString(), e));
  return val;
}

RPStepJumpRule _$RPStepJumpRuleFromJson(Map<String, dynamic> json) =>
    RPStepJumpRule(
      answerMap: (json['answer_map'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPStepJumpRuleToJson(RPStepJumpRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['answer_map'] =
      instance.answerMap.map((k, e) => MapEntry(k.toString(), e));
  return val;
}

RPTask _$RPTaskFromJson(Map<String, dynamic> json) => RPTask(
      identifier: json['identifier'] as String,
      closeAfterFinished: json['close_after_finished'] as bool? ?? false,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPTaskToJson(RPTask instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['identifier'] = instance.identifier;
  val['close_after_finished'] = instance.closeAfterFinished;
  return val;
}

RPResult _$RPResultFromJson(Map<String, dynamic> json) => RPResult(
      identifier: json['identifier'] as String,
    )
      ..startDate = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..endDate = json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String);

Map<String, dynamic> _$RPResultToJson(RPResult instance) {
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
  return val;
}

RPTaskResult _$RPTaskResultFromJson(Map<String, dynamic> json) => RPTaskResult(
      identifier: json['identifier'] as String,
    )
      ..startDate = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..endDate = json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String)
      ..results = (json['results'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, RPResult.fromJson(e as Map<String, dynamic>)),
      );

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

RPStepResult _$RPStepResultFromJson(Map<String, dynamic> json) => RPStepResult(
      identifier: json['identifier'] as String,
      questionTitle: json['question_title'] as String,
      answerFormat: RPAnswerFormat.fromJson(
          json['answer_format'] as Map<String, dynamic>),
    )
      ..startDate = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..endDate = json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String)
      ..results = json['results'] as Map<String, dynamic>;

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
  val['answer_format'] = instance.answerFormat;
  return val;
}

RPConsentSignatureResult _$RPConsentSignatureResultFromJson(
        Map<String, dynamic> json) =>
    RPConsentSignatureResult(
      identifier: json['identifier'] as String,
      consentDocument: RPConsentDocument.fromJson(
          json['consent_document'] as Map<String, dynamic>),
      signature: json['signature'] == null
          ? null
          : RPSignatureResult.fromJson(
              json['signature'] as Map<String, dynamic>),
    )
      ..startDate = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..endDate = json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String)
      ..userID = json['user_i_d'] as String?;

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

RPSignatureResult _$RPSignatureResultFromJson(Map<String, dynamic> json) =>
    RPSignatureResult(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      signatureImage: json['signature_image'] as String?,
    );

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

RPNoResult _$RPNoResultFromJson(Map<String, dynamic> json) => RPNoResult(
      identifier: json['identifier'] as String,
    )
      ..startDate = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..endDate = json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String);

Map<String, dynamic> _$RPNoResultToJson(RPNoResult instance) {
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
  return val;
}

RPActivityResult _$RPActivityResultFromJson(Map<String, dynamic> json) =>
    RPActivityResult(
      identifier: json['identifier'] as String,
    )
      ..startDate = json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String)
      ..endDate = json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String)
      ..results = json['results'] as Map<String, dynamic>
      ..stepTimes =
          StepTimes.fromJson(json['step_times'] as Map<String, dynamic>)
      ..interactions = (json['interactions'] as List<dynamic>)
          .map((e) => Interaction.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RPActivityResultToJson(RPActivityResult instance) {
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
  val['step_times'] = instance.stepTimes;
  val['interactions'] = instance.interactions;
  return val;
}

Interaction _$InteractionFromJson(Map<String, dynamic> json) => Interaction(
      DateTime.parse(json['time'] as String),
      json['correctness'] as String,
      json['type'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$InteractionToJson(Interaction instance) =>
    <String, dynamic>{
      'time': instance.time.toIso8601String(),
      'correctness': instance.correctness,
      'type': instance.type,
      'description': instance.description,
    };

StepTimes _$StepTimesFromJson(Map<String, dynamic> json) => StepTimes()
  ..instructionStarted = json['instruction_started'] == null
      ? null
      : DateTime.parse(json['instruction_started'] as String)
  ..instructionEnded = json['instruction_ended'] == null
      ? null
      : DateTime.parse(json['instruction_ended'] as String)
  ..testShown = json['test_shown'] == null
      ? null
      : DateTime.parse(json['test_shown'] as String)
  ..testStarted = json['test_started'] == null
      ? null
      : DateTime.parse(json['test_started'] as String)
  ..testEnded = json['test_ended'] == null
      ? null
      : DateTime.parse(json['test_ended'] as String)
  ..resultsShown = json['results_shown'] == null
      ? null
      : DateTime.parse(json['results_shown'] as String)
  ..resultsClosed = json['results_closed'] == null
      ? null
      : DateTime.parse(json['results_closed'] as String);

Map<String, dynamic> _$StepTimesToJson(StepTimes instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'instruction_started', instance.instructionStarted?.toIso8601String());
  writeNotNull(
      'instruction_ended', instance.instructionEnded?.toIso8601String());
  writeNotNull('test_shown', instance.testShown?.toIso8601String());
  writeNotNull('test_started', instance.testStarted?.toIso8601String());
  writeNotNull('test_ended', instance.testEnded?.toIso8601String());
  writeNotNull('results_shown', instance.resultsShown?.toIso8601String());
  writeNotNull('results_closed', instance.resultsClosed?.toIso8601String());
  return val;
}
