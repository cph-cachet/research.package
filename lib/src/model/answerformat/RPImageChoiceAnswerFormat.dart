part of research_package_model;

/// Image
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPImageChoiceAnswerFormat extends RPAnswerFormat {
  List<RPImageChoice> _choices;
  //int _test;

  RPImageChoiceAnswerFormat();

  RPImageChoiceAnswerFormat.withParams(/* this._test, */ this._choices);

  @override
  get questionType {
    return QuestionType.ImageChoice;
  }
/* 
  int get test => _test;

  set test(int test) {
    this._test = test;
  } */

  List<RPImageChoice> get choices => _choices;

  set choices(List<RPImageChoice> choices) {
    this._choices = choices;
  }

  factory RPImageChoiceAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$RPImageChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPImageChoiceAnswerFormatToJson(this);
}

///
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPImageChoice {
  Image _image;
  dynamic _value;
  String _text;

  RPImageChoice();

  ///
  RPImageChoice.withParams(this._image, this._value, this._text);

  get text => this._text;

  set text(String text) {
    this._text = text;
  }

  get value => this._value;

  set value(dynamic value) {
    this._value = value;
  }

  get image => this._image;

  set image(Image image) {
    this._image = image;
  }

  factory RPImageChoice.fromJson(Map<String, dynamic> json) =>
      _$RPImageChoiceFromJson(json);
  Map<String, dynamic> toJson() => _$RPImageChoiceToJson(this);
}
