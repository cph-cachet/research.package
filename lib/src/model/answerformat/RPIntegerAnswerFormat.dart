part of research_package_model;

/// Class representing an Answer Format that lets participants input a number (integer)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPIntegerAnswerFormat extends RPAnswerFormat {
  int _minValue;
  int _maxValue;
  String _suffix;

  RPIntegerAnswerFormat();

  RPIntegerAnswerFormat.withParams(this._minValue, this._maxValue, [this._suffix]);

  @override
  get questionType {
    return QuestionType.Integer;
  }
  /// The maximum value of the range. The participant can not proceed if the number is outside the range.
  int get maxValue => _maxValue;

  /// The minimum value of the range. The participant can not proceed if the number is outside the range.
  int get minValue => _minValue;

  /// The text to show after the input field. If '''null''' then no text is shown.
  String get suffix => _suffix;

  set maxValue(int maxValue) {
    this._maxValue = maxValue;
  }

  set minValue(int minValue) {
    this._minValue = minValue;
  }

  factory RPIntegerAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPIntegerAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPIntegerAnswerFormatToJson(this);
}
