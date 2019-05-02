part of research_package_model;

// TODO: not implemented yet
/// Not fully implemented yet
class RPIntegerAnswerFormat extends RPAnswerFormat {
  int _minValue;
  int _maxValue;

  RPIntegerAnswerFormat(this._minValue, this._maxValue);

  @override
  get questionType {
    return QuestionType.Integer;
  }

  int get maxValue => _maxValue;

  int get minValue => _minValue;

  //TODO: Validation?
}