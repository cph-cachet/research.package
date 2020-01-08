part of research_package_model;

/// Class representing an Answer Format that lets participants choose an image from a set of images.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPImageChoiceAnswerFormat extends RPAnswerFormat {
  List<RPImageChoice> _choices;

  RPImageChoiceAnswerFormat();

  /// Returns an initialized [RPImageChoiceAnswerFormat] with the given list of [RPImageChoice]s.
  RPImageChoiceAnswerFormat.withParams(this._choices);

  @override
  get questionType {
    return QuestionType.ImageChoice;
  }

  /// A list of available [RPImageChoice] objects which represent the choices to the participants.
  List<RPImageChoice> get choices => _choices;

  set choices(List<RPImageChoice> choices) {
    this._choices = choices;
  }

  factory RPImageChoiceAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$RPImageChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPImageChoiceAnswerFormatToJson(this);
}

/// The image choice object which the participants can choose from, during a [RPQuestionStep] with [RPImageChoiceAnswerFormat]
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPImageChoice {
  @JsonKey(ignore: true)
  Image _image;
  dynamic _value;
  String _description;

  RPImageChoice();

  /// Default constructor.
  RPImageChoice.withParams(this._image, this._value, this._description);

  /// The description fitting the image. Is displayed when selected.
  get description => this._description;

  set description(String description) {
    this._description = description;
  }

  /// The value of the choice.
  get value => this._value;

  set value(dynamic value) {
    this._value = value;
  }

  /// The image portraying the choice.
  get image => this._image;

  set image(Image image) {
    this._image = image;
  }

  factory RPImageChoice.fromJson(Map<String, dynamic> json) =>
      _$RPImageChoiceFromJson(json);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'description': this._description,
        'value': this._value,

        // To avoid JSON issues, a string representation is used.
        // Future development will see a ByteData / Uint8List format
        'image': this._image.toString(),
      };
}
