part of research_package_model;

/// Class representing an Answer Format that lets participants choose from a
/// fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPDateTimeAnswerFormat extends RPAnswerFormat {
  RPDateTimeAnswerStyle dateTimeAnswerStyle;

  RPDateTimeAnswerFormat({required this.dateTimeAnswerStyle}) : super();

  Function get fromJsonFunction => _$RPDateTimeAnswerFormatFromJson;
  // factory RPDateTimeAnswerFormat.fromJson(Map<String, dynamic> json) =>
  //     FromJsonFactory().fromJson(json);
  Map<String, dynamic> toJson() => _$RPDateTimeAnswerFormatToJson(this);
}
