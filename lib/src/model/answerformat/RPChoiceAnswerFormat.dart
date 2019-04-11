part of research_package_model;

/// Class representing an Answer Format that lets participants choose from a fixed set of choices.
class RPChoiceAnswerFormat extends RPAnswerFormat {
  List<RPChoice> _choices;
  ChoiceAnswerStyle _answerStyle;

  /// Returns an initialized choice answer format with the given [ChoiceAnswerStyle] and the set of [RPChoice]s.
  RPChoiceAnswerFormat(this._answerStyle, this._choices);

  /// An array of available [RPChoice] objects which represent the choices to the participant.
  get choices => this._choices;

  @override
  get questionType {
    return _answerStyle == ChoiceAnswerStyle.SingleChoice ? QuestionType.SingleChoice : QuestionType.MultipleChoice;
  }

  /// The widget (UI representation) of the Answer Format
  ///
  ///
  @override
  Widget get questionBody {
    return RPUIChoiceQuestionBody(this);
  }
}

/// The choice object which the participant can choose during a [RPQuestionStep] with [RPChoiceAnswerFormat].
class RPChoice<T> {
  String _text;
  T _value;
  String _detailText;

  /// Default constructor with [detailText] set to ```null```.
  RPChoice(String text, T value) {
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

  set value(T value) {
    this._value = value;
  }

  get detailText => this._detailText;

  set detailText(String detailText) {
    this._detailText = detailText;
  }
}
