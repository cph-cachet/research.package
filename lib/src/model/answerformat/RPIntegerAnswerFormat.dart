part of research_package_model;

// TODO: not implemented yet
/// Not fully implemented yet
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPIntegerAnswerFormat extends RPAnswerFormat {
  int _minValue;
  int _maxValue;

  RPIntegerAnswerFormat();

  RPIntegerAnswerFormat.withParams(this._minValue, this._maxValue);

  @override
  get questionType {
    return QuestionType.Integer;
  }

  int get maxValue => _maxValue;

  int get minValue => _minValue;

  set maxValue(int maxValue) {
    this._maxValue = maxValue;
  }

  set minValue(int minValue) {
    this._minValue = minValue;
  }

  //TODO: Validation?

  factory RPIntegerAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPIntegerAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPIntegerAnswerFormatToJson(this);
}
