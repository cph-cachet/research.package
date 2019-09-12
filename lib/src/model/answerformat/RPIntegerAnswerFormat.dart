part of research_package_model;

// TODO: not implemented yet
/// Not fully implemented yet
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

  int get maxValue => _maxValue;

  int get minValue => _minValue;

  /// The text to show after the input field. If '''null''' then no text is shown.
  String get suffix => _suffix;

  set maxValue(int maxValue) {
    this._maxValue = maxValue;
  }

  set minValue(int minValue) {
    this._minValue = minValue;
  }

  @override
  Widget get questionBody {
    return RPUIIntegerQuestionBody(this);
  }
  //TODO: Validation?

  factory RPIntegerAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPIntegerAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPIntegerAnswerFormatToJson(this);
}
