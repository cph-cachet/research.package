part of '../../../model.dart';

/// Class representing the Answer Format for Form Questions (Multiple questions
/// at the same time on the same page)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPFormAnswerFormat extends RPAnswerFormat {
  RPFormAnswerFormat() : super() {
    questionType = RPQuestionType.Form;
  }

  @override
  RPQuestionType get questionType => RPQuestionType.Form;

  @override
  Function get fromJsonFunction => _$RPFormAnswerFormatFromJson;
  factory RPFormAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPFormAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPFormAnswerFormatToJson(this);
}
