part of research_package_model;

/// Class representing an Answer Format that lets participants choose from a fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPChoiceAnswerFormat extends RPAnswerFormat {
  List<RPChoice> _choices;
  ChoiceAnswerStyle answerStyle;

  RPChoiceAnswerFormat(this.answerStyle, this._choices) {
    questionType = answerStyle == ChoiceAnswerStyle.SingleChoice
        ? QuestionType.SingleChoice
        : QuestionType.MultipleChoice;
  }

  /// An array of available [RPChoice] objects which represent the choices to the participant.
  List<RPChoice> get choices => this._choices;

  set choices(List<RPChoice> choices) {
    this._choices = choices;
  }

  factory RPChoiceAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPChoiceAnswerFormatToJson(this);
}

/// The choice object which the participant can choose during a [RPQuestionStep] with [RPChoiceAnswerFormat].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPChoice {
  String text;
  int value;
  String? detailText;
  bool isFreeText;

  RPChoice(this.text, this.value, {this.isFreeText = false, this.detailText});

  factory RPChoice.fromJson(Map<String, dynamic> json) => _$RPChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$RPChoiceToJson(this);
}
