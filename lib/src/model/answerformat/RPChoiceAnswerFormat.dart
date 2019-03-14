part of research_package_model;

class RPChoiceAnswerFormat extends RPAnswerFormat {
  List<RPChoice> _choices;
  ChoiceAnswerStyle _answerStyle;

  RPChoiceAnswerFormat(this._answerStyle, this._choices);

  get choices => this._choices;

  @override
  get questionType {
    return _answerStyle == ChoiceAnswerStyle.SingleChoice ? QuestionType.SingleChoice : QuestionType.MultipleChoice;
  }

  @override
  Widget get stepBody {
    return RPUIChoiceQuestionBody(this);
  }


}

class RPChoice<T> {
  String _text;
  T _value;
  String _detailText;

  RPChoice(String text, T value) {
    this._text = text;
    this._value = value;
    this._detailText = null;
  }

  RPChoice.withDetailText(this._text, this._value, this._detailText);

  get text => this._text;

  set text(String text) {
    this._text = text;
  }

  get value => this._value;

  set value(T value) {
    this._value = value;
  }

  get detailText => this._detailText;

  set detailText(String detailText) {
    this._detailText = detailText;
  }
}
