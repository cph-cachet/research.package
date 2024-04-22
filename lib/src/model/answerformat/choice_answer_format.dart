part of '../../../model.dart';

/// Class representing an Answer Format that lets participants choose from a
/// fixed set of choices.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPChoiceAnswerFormat extends RPAnswerFormat {
  /// An array of available [RPChoice] objects which represent the choices to
  /// the participant.
  List<RPChoice> choices;

  /// The answer style - single or multiple choice.
  RPChoiceAnswerStyle answerStyle;

  /// Returns an initialized choice answer format with the given [ChoiceAnswerStyle]
  /// and the set of [RPChoice]s.
  RPChoiceAnswerFormat({required this.answerStyle, required this.choices})
      : super() {
    questionType = (answerStyle == RPChoiceAnswerStyle.SingleChoice)
        ? RPQuestionType.SingleChoice
        : RPQuestionType.MultipleChoice;
  }

  @override
  Function get fromJsonFunction => _$RPChoiceAnswerFormatFromJson;
  factory RPChoiceAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPChoiceAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPChoiceAnswerFormatToJson(this);
}

/// The choice object which the participant can choose during a [RPQuestionStep]
/// with [RPChoiceAnswerFormat].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPChoice extends Serializable {
  /// The text to display.
  String text;

  /// The value of this choice - for example `4` on a 0-5 scale.
  int value;

  /// The detailed text to show if needed.
  /// Shown as a Info-icon which takes the user to a detail page with the [detailText]
  String? detailText;

  /// If set to `true`, then the user can enter the text instead of the default
  /// [text] which was provided. The [value] remains the same.
  /// By default it is set to false.
  /// [text] will be shown as a `hintText`
  bool isFreeText = false;

  /// Default constructor.
  RPChoice({
    required this.text,
    required this.value,
    this.isFreeText = false,
    this.detailText,
  }) : super();

  @override
  Function get fromJsonFunction => _$RPChoiceFromJson;
  factory RPChoice.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPChoice;
  @override
  Map<String, dynamic> toJson() => _$RPChoiceToJson(this);
}
