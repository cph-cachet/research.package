part of research_package_model;

/// Class representing an Answer Format that lets participants choose from a fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPDateTimeAnswerFormat extends RPAnswerFormat {
  DateTimeAnswerStyle dateTimeAnswerStyle;

  RPDateTimeAnswerFormat();

  RPDateTimeAnswerFormat.withParams(this.dateTimeAnswerStyle);

  factory RPDateTimeAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$RPDateTimeAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPDateTimeAnswerFormatToJson(this);
}
