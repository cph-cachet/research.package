part of research_package_model;

/// Class representing an Answer Format that lets participants choose from a
/// fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPDateTimeAnswerFormat extends RPAnswerFormat {
  RPDateTimeAnswerStyle dateTimeAnswerStyle;

  RPDateTimeAnswerFormat({required this.dateTimeAnswerStyle}) : super();

  // factory RPDateTimeAnswerFormat.fromJson(Map<String, dynamic> json) =>
  //     FromJsonFactory().fromJson(json);
  factory RPDateTimeAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPDateTimeAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPDateTimeAnswerFormatToJson(this);
}
