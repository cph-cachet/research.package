part of research_package_model;

/// Class representing an Answer Format that lets participants choose between true or false (yes or no) options
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPBooleanAnswerFormat extends RPAnswerFormat {
  String _trueText;
  String _falseText;

  RPBooleanAnswerFormat();

  RPBooleanAnswerFormat.withParams(this._trueText, this._falseText);

  @override
  get questionType {
    return QuestionType.Boolean;
  }
  /// The text shown for the ```true``` option
  String get trueText => _trueText;

  /// The text shown for the ```false``` option
  String get falseText => _falseText;

  // Setters for make it possible to deserialize
  set trueText(String trueText) {
    this._trueText = trueText;
  }

  set falseText(String falseText) {
    this._falseText = falseText;
  }

  factory RPBooleanAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPBooleanAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPBooleanAnswerFormatToJson(this);
}
