// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RPAnswerFormat _$RPAnswerFormatFromJson(Map<String, dynamic> json) =>
    RPAnswerFormat()
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPAnswerFormatToJson(RPAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
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
      minValue: (json['minValue'] as num).toInt(),
      maxValue: (json['maxValue'] as num).toInt(),
      suffix: json['suffix'] as String?,
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPIntegerAnswerFormatToJson(
    RPIntegerAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['minValue'] = instance.minValue;
  val['maxValue'] = instance.maxValue;
  writeNotNull('suffix', instance.suffix);
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPDoubleAnswerFormat _$RPDoubleAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPDoubleAnswerFormat(
      minValue: (json['minValue'] as num).toDouble(),
      maxValue: (json['maxValue'] as num).toDouble(),
      suffix: json['suffix'] as String?,
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPDoubleAnswerFormatToJson(
    RPDoubleAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['minValue'] = instance.minValue;
  val['maxValue'] = instance.maxValue;
  writeNotNull('suffix', instance.suffix);
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPChoiceAnswerFormat _$RPChoiceAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPChoiceAnswerFormat(
      answerStyle:
          $enumDecode(_$RPChoiceAnswerStyleEnumMap, json['answerStyle']),
      choices: (json['choices'] as List<dynamic>)
          .map((e) => RPChoice.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPChoiceAnswerFormatToJson(
    RPChoiceAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  val['choices'] = instance.choices.map((e) => e.toJson()).toList();
  val['answerStyle'] = _$RPChoiceAnswerStyleEnumMap[instance.answerStyle]!;
  return val;
}

const _$RPChoiceAnswerStyleEnumMap = {
  RPChoiceAnswerStyle.SingleChoice: 'SingleChoice',
  RPChoiceAnswerStyle.MultipleChoice: 'MultipleChoice',
};

RPChoice _$RPChoiceFromJson(Map<String, dynamic> json) => RPChoice(
      text: json['text'] as String,
      value: (json['value'] as num).toInt(),
      isFreeText: json['isFreeText'] as bool? ?? false,
      detailText: json['detailText'] as String?,
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
  writeNotNull('detailText', instance.detailText);
  val['isFreeText'] = instance.isFreeText;
  return val;
}

RPFormAnswerFormat _$RPFormAnswerFormatFromJson(Map<String, dynamic> json) =>
    RPFormAnswerFormat()
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPFormAnswerFormatToJson(RPFormAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPSliderAnswerFormat _$RPSliderAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPSliderAnswerFormat(
      minValue: (json['minValue'] as num).toDouble(),
      maxValue: (json['maxValue'] as num).toDouble(),
      divisions: (json['divisions'] as num).toInt(),
      prefix: json['prefix'] as String? ?? '',
      suffix: json['suffix'] as String? ?? '',
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPSliderAnswerFormatToJson(
    RPSliderAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['minValue'] = instance.minValue;
  val['maxValue'] = instance.maxValue;
  val['divisions'] = instance.divisions;
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
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
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPImageChoiceAnswerFormatToJson(
    RPImageChoiceAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['choices'] = instance.choices.map((e) => e.toJson()).toList();
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  return val;
}

RPImageChoice _$RPImageChoiceFromJson(Map<String, dynamic> json) =>
    RPImageChoice(
      imageUrl: json['imageUrl'] as String,
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
  val['imageUrl'] = instance.imageUrl;
  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  val['description'] = instance.description;
  return val;
}

RPDateTimeAnswerFormat _$RPDateTimeAnswerFormatFromJson(
        Map<String, dynamic> json) =>
    RPDateTimeAnswerFormat(
      dateTimeAnswerStyle: $enumDecode(
          _$RPDateTimeAnswerStyleEnumMap, json['dateTimeAnswerStyle']),
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPDateTimeAnswerFormatToJson(
    RPDateTimeAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
  val['dateTimeAnswerStyle'] =
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
      hintText: json['hintText'] as String?,
      autoFocus: json['autoFocus'] as bool? ?? false,
      disableHelpers: json['disableHelpers'] as bool? ?? false,
    )
      ..$type = json['__type'] as String?
      ..questionType =
          $enumDecode(_$RPQuestionTypeEnumMap, json['questionType']);

Map<String, dynamic> _$RPTextAnswerFormatToJson(RPTextAnswerFormat instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  writeNotNull('hintText', instance.hintText);
  val['autoFocus'] = instance.autoFocus;
  val['disableHelpers'] = instance.disableHelpers;
  val['questionType'] = _$RPQuestionTypeEnumMap[instance.questionType]!;
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
  val['signatures'] = instance.signatures.map((e) => e.toJson()).toList();
  val['title'] = instance.title;
  val['sections'] = instance.sections.map((e) => e.toJson()).toList();
  return val;
}

RPConsentSection _$RPConsentSectionFromJson(Map<String, dynamic> json) =>
    RPConsentSection(
      type: $enumDecode(_$RPConsentSectionTypeEnumMap, json['type']),
      title: json['title'] as String?,
      summary: json['summary'] as String?,
      content: json['content'] as String?,
      dataTypes: (json['dataTypes'] as List<dynamic>?)
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
  writeNotNull(
      'dataTypes', instance.dataTypes?.map((e) => e.toJson()).toList());
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
      requiresName: json['requiresName'] as bool? ?? true,
      requiresSignatureImage: json['requiresSignatureImage'] as bool? ?? true,
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
  val['requiresName'] = instance.requiresName;
  val['requiresSignatureImage'] = instance.requiresSignatureImage;
  return val;
}

RPVisualConsentStep _$RPVisualConsentStepFromJson(Map<String, dynamic> json) =>
    RPVisualConsentStep(
      identifier: json['identifier'] as String,
      consentDocument: RPConsentDocument.fromJson(
          json['consentDocument'] as Map<String, dynamic>),
    )
      ..$type = json['__type'] as String?
      ..title = json['title'] as String
      ..text = json['text'] as String?
      ..optional = json['optional'] as bool
      ..footnote = json['footnote'] as String?;

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
  writeNotNull('footnote', instance.footnote);
  val['consentDocument'] = instance.consentDocument.toJson();
  return val;
}

RPConsentReviewStep _$RPConsentReviewStepFromJson(Map<String, dynamic> json) =>
    RPConsentReviewStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      text: json['text'] as String?,
      consentDocument: RPConsentDocument.fromJson(
          json['consentDocument'] as Map<String, dynamic>),
      reasonForConsent: json['reasonForConsent'] as String?,
    )
      ..$type = json['__type'] as String?
      ..optional = json['optional'] as bool
      ..footnote = json['footnote'] as String?;

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
  writeNotNull('footnote', instance.footnote);
  val['consentDocument'] = instance.consentDocument.toJson();
  writeNotNull('reasonForConsent', instance.reasonForConsent);
  return val;
}

RPDataTypeSection _$RPDataTypeSectionFromJson(Map<String, dynamic> json) =>
    RPDataTypeSection(
      dataName: json['dataName'] as String,
      dataInformation: json['dataInformation'] as String,
    )..$type = json['__type'] as String?;

Map<String, dynamic> _$RPDataTypeSectionToJson(RPDataTypeSection instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('__type', instance.$type);
  val['dataName'] = instance.dataName;
  val['dataInformation'] = instance.dataInformation;
  return val;
}

RPStep _$RPStepFromJson(Map<String, dynamic> json) => RPStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      text: json['text'] as String?,
      optional: json['optional'] as bool? ?? false,
      footnote: json['footnote'] as String?,
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
  writeNotNull('footnote', instance.footnote);
  return val;
}

RPFormStep _$RPFormStepFromJson(Map<String, dynamic> json) => RPFormStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      optional: json['optional'] as bool? ?? false,
      autoSkip: json['autoSkip'] as bool? ?? false,
      timeout: json['timeout'] == null
          ? const Duration(seconds: 0)
          : Duration(microseconds: (json['timeout'] as num).toInt()),
      questions: (json['questions'] as List<dynamic>)
          .map((e) => RPQuestionStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      saveResultsOnAutoSkip: json['saveResultsOnAutoSkip'] as bool? ?? false,
      forceWait: json['forceWait'] as bool? ?? false,
      footnote: json['footnote'] as String?,
    )
      ..$type = json['__type'] as String?
      ..text = json['text'] as String?
      ..answerFormat =
          RPAnswerFormat.fromJson(json['answerFormat'] as Map<String, dynamic>)
      ..placeholder = json['placeholder'] as String?
      ..autoFocus = json['autoFocus'] as bool;

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
  writeNotNull('footnote', instance.footnote);
  val['answerFormat'] = instance.answerFormat.toJson();
  writeNotNull('placeholder', instance.placeholder);
  val['autoSkip'] = instance.autoSkip;
  val['timeout'] = instance.timeout.inMicroseconds;
  val['autoFocus'] = instance.autoFocus;
  val['questions'] = instance.questions.map((e) => e.toJson()).toList();
  val['saveResultsOnAutoSkip'] = instance.saveResultsOnAutoSkip;
  val['forceWait'] = instance.forceWait;
  return val;
}

RPQuestionStep _$RPQuestionStepFromJson(Map<String, dynamic> json) =>
    RPQuestionStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      optional: json['optional'] as bool? ?? false,
      answerFormat:
          RPAnswerFormat.fromJson(json['answerFormat'] as Map<String, dynamic>),
      autoSkip: json['autoSkip'] as bool? ?? false,
      timeout: json['timeout'] == null
          ? const Duration(seconds: 0)
          : Duration(microseconds: (json['timeout'] as num).toInt()),
      autoFocus: json['autoFocus'] as bool? ?? false,
      footnote: json['footnote'] as String?,
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
  writeNotNull('footnote', instance.footnote);
  val['answerFormat'] = instance.answerFormat.toJson();
  writeNotNull('placeholder', instance.placeholder);
  val['autoSkip'] = instance.autoSkip;
  val['timeout'] = instance.timeout.inMicroseconds;
  val['autoFocus'] = instance.autoFocus;
  return val;
}

RPInstructionStep _$RPInstructionStepFromJson(Map<String, dynamic> json) =>
    RPInstructionStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      text: json['text'] as String?,
      optional: json['optional'] as bool? ?? false,
      detailText: json['detailText'] as String?,
      imagePath: json['imagePath'] as String?,
      footnote: json['footnote'] as String?,
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
  writeNotNull('footnote', instance.footnote);
  writeNotNull('detailText', instance.detailText);
  writeNotNull('imagePath', instance.imagePath);
  return val;
}

RPCompletionStep _$RPCompletionStepFromJson(Map<String, dynamic> json) =>
    RPCompletionStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      text: json['text'] as String?,
      optional: json['optional'] as bool? ?? false,
    )
      ..$type = json['__type'] as String?
      ..footnote = json['footnote'] as String?;

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
  writeNotNull('footnote', instance.footnote);
  return val;
}

RPActivityStep _$RPActivityStepFromJson(Map<String, dynamic> json) =>
    RPActivityStep(
      identifier: json['identifier'] as String,
      includeInstructions: json['includeInstructions'] as bool? ?? true,
      includeResults: json['includeResults'] as bool? ?? true,
    )
      ..$type = json['__type'] as String?
      ..title = json['title'] as String
      ..text = json['text'] as String?
      ..optional = json['optional'] as bool
      ..footnote = json['footnote'] as String?;

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
  writeNotNull('footnote', instance.footnote);
  val['includeInstructions'] = instance.includeInstructions;
  val['includeResults'] = instance.includeResults;
  return val;
}

RPTimerStep _$RPTimerStepFromJson(Map<String, dynamic> json) => RPTimerStep(
      identifier: json['identifier'] as String,
      title: json['title'] as String,
      optional: json['optional'] as bool? ?? false,
      timeout: Duration(microseconds: (json['timeout'] as num).toInt()),
      playSound: json['playSound'] as bool? ?? false,
      autoSkip: json['autoSkip'] as bool? ?? false,
      showTime: json['showTime'] as bool? ?? true,
      footnote: json['footnote'] as String?,
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
  writeNotNull('footnote', instance.footnote);
  val['timeout'] = instance.timeout.inMicroseconds;
  val['playSound'] = instance.playSound;
  val['autoSkip'] = instance.autoSkip;
  val['showTime'] = instance.showTime;
  return val;
}

RPOrderedTask _$RPOrderedTaskFromJson(Map<String, dynamic> json) =>
    RPOrderedTask(
      identifier: json['identifier'] as String,
      closeAfterFinished: json['closeAfterFinished'] as bool? ?? true,
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
  val['closeAfterFinished'] = instance.closeAfterFinished;
  val['steps'] = instance.steps.map((e) => e.toJson()).toList();
  return val;
}

RPNavigableOrderedTask _$RPNavigableOrderedTaskFromJson(
        Map<String, dynamic> json) =>
    RPNavigableOrderedTask(
      identifier: json['identifier'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => RPStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      closeAfterFinished: json['closeAfterFinished'] as bool? ?? true,
    )
      ..$type = json['__type'] as String?
      ..stepNavigationRules =
          (json['stepNavigationRules'] as Map<String, dynamic>).map(
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
  val['closeAfterFinished'] = instance.closeAfterFinished;
  val['steps'] = instance.steps.map((e) => e.toJson()).toList();
  val['stepNavigationRules'] =
      instance.stepNavigationRules.map((k, e) => MapEntry(k, e.toJson()));
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
      destinationStepIdentifier: json['destinationStepIdentifier'] as String,
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
  val['destinationStepIdentifier'] = instance.destinationStepIdentifier;
  return val;
}

RPStepReorganizerRule _$RPStepReorganizerRuleFromJson(
        Map<String, dynamic> json) =>
    RPStepReorganizerRule(
      reorderingMap: (json['reorderingMap'] as Map<String, dynamic>).map(
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
  val['reorderingMap'] =
      instance.reorderingMap.map((k, e) => MapEntry(k.toString(), e));
  return val;
}

RPStepJumpRule _$RPStepJumpRuleFromJson(Map<String, dynamic> json) =>
    RPStepJumpRule(
      answerMap: (json['answerMap'] as Map<String, dynamic>).map(
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
  val['answerMap'] =
      instance.answerMap.map((k, e) => MapEntry(k.toString(), e));
  return val;
}

RPTask _$RPTaskFromJson(Map<String, dynamic> json) => RPTask(
      identifier: json['identifier'] as String,
      closeAfterFinished: json['closeAfterFinished'] as bool? ?? false,
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
  val['closeAfterFinished'] = instance.closeAfterFinished;
  return val;
}

RPResult _$RPResultFromJson(Map<String, dynamic> json) => RPResult(
      identifier: json['identifier'] as String,
    )
      ..startDate = json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String)
      ..endDate = json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String);

Map<String, dynamic> _$RPResultToJson(RPResult instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  return val;
}

RPTaskResult _$RPTaskResultFromJson(Map<String, dynamic> json) => RPTaskResult(
      identifier: json['identifier'] as String,
    )
      ..startDate = json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String)
      ..endDate = json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String)
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

  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  val['results'] = instance.results.map((k, e) => MapEntry(k, e.toJson()));
  return val;
}

RPStepResult _$RPStepResultFromJson(Map<String, dynamic> json) => RPStepResult(
      identifier: json['identifier'] as String,
      questionTitle: json['questionTitle'] as String,
      answerFormat:
          RPAnswerFormat.fromJson(json['answerFormat'] as Map<String, dynamic>),
    )
      ..startDate = json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String)
      ..endDate = json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String)
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

  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  val['questionTitle'] = instance.questionTitle;
  val['results'] = instance.results;
  val['answerFormat'] = instance.answerFormat.toJson();
  return val;
}

RPConsentSignatureResult _$RPConsentSignatureResultFromJson(
        Map<String, dynamic> json) =>
    RPConsentSignatureResult(
      identifier: json['identifier'] as String,
      consentDocument: RPConsentDocument.fromJson(
          json['consentDocument'] as Map<String, dynamic>),
      signature: json['signature'] == null
          ? null
          : RPSignatureResult.fromJson(
              json['signature'] as Map<String, dynamic>),
    )
      ..startDate = json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String)
      ..endDate = json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String)
      ..userId = json['userId'] as String?;

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

  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  val['consentDocument'] = instance.consentDocument.toJson();
  writeNotNull('signature', instance.signature?.toJson());
  writeNotNull('userId', instance.userId);
  return val;
}

RPSignatureResult _$RPSignatureResultFromJson(Map<String, dynamic> json) =>
    RPSignatureResult(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      signatureImage: json['signatureImage'] as String?,
    );

Map<String, dynamic> _$RPSignatureResultToJson(RPSignatureResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('signatureImage', instance.signatureImage);
  return val;
}

RPNoResult _$RPNoResultFromJson(Map<String, dynamic> json) => RPNoResult(
      identifier: json['identifier'] as String,
    )
      ..startDate = json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String)
      ..endDate = json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String);

Map<String, dynamic> _$RPNoResultToJson(RPNoResult instance) {
  final val = <String, dynamic>{
    'identifier': instance.identifier,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  return val;
}

RPActivityResult _$RPActivityResultFromJson(Map<String, dynamic> json) =>
    RPActivityResult(
      identifier: json['identifier'] as String,
    )
      ..startDate = json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String)
      ..endDate = json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String)
      ..results = json['results'] as Map<String, dynamic>
      ..stepTimes =
          StepTimes.fromJson(json['stepTimes'] as Map<String, dynamic>)
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

  writeNotNull('startDate', instance.startDate?.toIso8601String());
  writeNotNull('endDate', instance.endDate?.toIso8601String());
  val['results'] = instance.results;
  val['stepTimes'] = instance.stepTimes.toJson();
  val['interactions'] = instance.interactions.map((e) => e.toJson()).toList();
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
