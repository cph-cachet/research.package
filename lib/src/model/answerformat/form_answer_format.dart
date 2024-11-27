part of '../../../model.dart';

/// Class representing the Answer Format for Form Questions (Multiple questions
/// at the same time on the same page)
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class RPFormAnswerFormat extends RPAnswerFormat {
  RPFormAnswerFormat() : super() {
    questionType = RPQuestionType.Form;
  }

  @override
  RPQuestionType get questionType => RPQuestionType.Form;

  @override
  Function get fromJsonFunction => _$RPFormAnswerFormatFromJson;
  factory RPFormAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson<RPFormAnswerFormat>(json);
  @override
  Map<String, dynamic> toJson() => _$RPFormAnswerFormatToJson(this);
}
