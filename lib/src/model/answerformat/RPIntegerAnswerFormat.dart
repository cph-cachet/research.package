part of research_package_model;

/// Class representing an Answer Format that lets participants input a
/// number (integer)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPIntegerAnswerFormat extends RPAnswerFormat {
  /// The minimum value of the range. The participant can not proceed if the
  /// number is outside the range.
  int minValue;

  /// The maximum value of the range. The participant can not proceed if the
  /// number is outside the range.
  int maxValue;

  /// The text to show after the input field.
  /// If `null` then no text is shown.
  String? suffix;

  RPIntegerAnswerFormat(
      {required this.minValue, required this.maxValue, this.suffix})
      : super();

  @override
  get questionType => RPQuestionType.Integer;

  Function get fromJsonFunction => _$RPIntegerAnswerFormatFromJson;
  factory RPIntegerAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPIntegerAnswerFormat;
  Map<String, dynamic> toJson() => _$RPIntegerAnswerFormatToJson(this);
}
