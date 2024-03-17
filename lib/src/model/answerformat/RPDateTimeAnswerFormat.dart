part of '../../../model.dart';

/// Class representing an Answer Format that lets participants choose from a
/// fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPDateTimeAnswerFormat extends RPAnswerFormat {
  RPDateTimeAnswerStyle dateTimeAnswerStyle;

  RPDateTimeAnswerFormat({required this.dateTimeAnswerStyle}) : super() {
    questionType = (dateTimeAnswerStyle == RPDateTimeAnswerStyle.TimeOfDay)
        ? RPQuestionType.TimeOfDay
        : (dateTimeAnswerStyle == RPDateTimeAnswerStyle.Date)
            ? RPQuestionType.Date
            : RPQuestionType.DateAndTime;
  }

  @override
  Function get fromJsonFunction => _$RPDateTimeAnswerFormatFromJson;
  factory RPDateTimeAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPDateTimeAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPDateTimeAnswerFormatToJson(this);
}
