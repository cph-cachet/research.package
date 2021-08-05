part of research_package_model;

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

  Function get fromJsonFunction => _$RPDateTimeAnswerFormatFromJson;
  factory RPDateTimeAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPDateTimeAnswerFormat;
  Map<String, dynamic> toJson() => _$RPDateTimeAnswerFormatToJson(this);
}
