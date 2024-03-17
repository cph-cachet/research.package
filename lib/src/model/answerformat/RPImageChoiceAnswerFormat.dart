part of '../../../model.dart';

/// Class representing an Answer Format that lets participants choose an image
/// from a set of images.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPImageChoiceAnswerFormat extends RPAnswerFormat {
  /// A list of available [RPImageChoice] objects which represent the choices to
  /// the participants.
  List<RPImageChoice> choices;

  /// Returns an initialized [RPImageChoiceAnswerFormat] with the given list of
  /// [RPImageChoice]s.
  RPImageChoiceAnswerFormat({required this.choices}) : super();

  @override
  RPQuestionType get questionType => RPQuestionType.ImageChoice;

  @override
  Function get fromJsonFunction => _$RPImageChoiceAnswerFormatFromJson;
  factory RPImageChoiceAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPImageChoiceAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPImageChoiceAnswerFormatToJson(this);
}

/// The image choice object which the participants can choose from, during a
/// [RPQuestionStep] with [RPImageChoiceAnswerFormat]
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPImageChoice extends Serializable {
  /// The image portraying the choice.
  String imageUrl;

  /// The key of the image if this is to be loaded from the images
  /// in the assets on the phone.
  /// Specify either the [image] or the [key].
  String? key;

  /// The value of the choice. Can be any type but MUST be serializable if this feature is used.
  dynamic value;

  /// The description fitting the image. Is displayed when selected.
  String description;

  RPImageChoice({
    required this.imageUrl,
    this.key,
    this.value,
    required this.description,
  }) : super();

  @override
  Function get fromJsonFunction => _$RPImageChoiceFromJson;
  factory RPImageChoice.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPImageChoice;
  @override
  Map<String, dynamic> toJson() => _$RPImageChoiceToJson(this);
}
