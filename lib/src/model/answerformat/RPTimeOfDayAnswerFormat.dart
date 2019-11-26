part of research_package_model;

/// Class representing an Answer Format that lets participants choose from a fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTimeOfDayAnswerFormat extends RPAnswerFormat {
  RPTimeOfDayAnswerFormat();

  factory RPTimeOfDayAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$RPTimeOfDayAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPTimeOfDayAnswerFormatToJson(this);
}
