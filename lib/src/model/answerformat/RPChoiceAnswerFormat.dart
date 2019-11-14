part of research_package_model;

/// Class representing an Answer Format that lets participants choose from a fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPChoiceAnswerFormat extends RPAnswerFormat {
  List<RPChoice> _choices;
  ChoiceAnswerStyle answerStyle;

  RPChoiceAnswerFormat();

  /// Returns an initialized choice answer format with the given [ChoiceAnswerStyle] and the set of [RPChoice]s.
  RPChoiceAnswerFormat.withParams(this.answerStyle, this._choices) {
    questionType =
        answerStyle == ChoiceAnswerStyle.SingleChoice ? QuestionType.SingleChoice : QuestionType.MultipleChoice;
  }

  /// An array of available [RPChoice] objects which represent the choices to the participant.
  get choices => this._choices;

  set choices(List<RPChoice> choices) {
    this._choices = choices;
  }

  factory RPChoiceAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPChoiceAnswerFormatToJson(this);
}

/// The choice object which the participant can choose during a [RPQuestionStep] with [RPChoiceAnswerFormat].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPChoice {
  String _text;
  dynamic _value;
  String _detailText;

  RPChoice();

  /// Default constructor with [detailText] set to ```null```.
  RPChoice.withParams(String text, dynamic value) {
    this._text = text;
    this._value = value;
    this._detailText = null;
  }

  /// Constructor with the option to provide [detailText]
  RPChoice.withDetailText(this._text, this._value, this._detailText);

  /// The text to display
  get text => this._text;

  set text(String text) {
    this._text = text;
  }

  /// The value of the choice
  get value => this._value;

  set value(dynamic value) {
    this._value = value;
  }

  get detailText => this._detailText;

  set detailText(String detailText) {
    this._detailText = detailText;
  }

  factory RPChoice.fromJson(Map<String, dynamic> json) => _$RPChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$RPChoiceToJson(this);
}
