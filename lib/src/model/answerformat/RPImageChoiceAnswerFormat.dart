part of research_package_model;

/// Class representing an Answer Format that lets participants choose an image from a set of images.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPImageChoiceAnswerFormat extends RPAnswerFormat {
  List<RPImageChoice> choices;

  RPImageChoiceAnswerFormat(this.choices);

  @override
  get questionType {
    return QuestionType.ImageChoice;
  }

  factory RPImageChoiceAnswerFormat.fromJson(Map<String, dynamic> json) =>
      _$RPImageChoiceAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPImageChoiceAnswerFormatToJson(this);
}

/// The image choice object which the participants can choose from, during a [RPQuestionStep] with [RPImageChoiceAnswerFormat]
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPImageChoice {
  @JsonKey(ignore: true)
  Image image;
  dynamic value;
  String description;

  RPImageChoice(this.image, this.value, this.description);

  factory RPImageChoice.fromJson(Map<String, dynamic> json) => _$RPImageChoiceFromJson(json);
  Map<String, dynamic> toJson() => <String, dynamic>{
        'description': this.description,
        'value': this.value,

        // To avoid JSON issues, a string representation is used.
        // Future development will see a ByteData / Uint8List format
        'image': this.image.toString(),
      };
}
