part of '../../../model.dart';

/// Class representing an Answer Format that lets participants input a integer.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPIntegerAnswerFormat extends RPAnswerFormat {
  /// The minimum value of the range. The participant can not proceed if the
  /// number is outside the range.
  int minValue;

  /// The maximum value of the range. The participant can not proceed if the
  /// number is outside the range.
  int maxValue;

  /// The text to show after the input field.
  /// If `null` then no text is shown.
  String? suffix;

  RPIntegerAnswerFormat(
      {required this.minValue, required this.maxValue, this.suffix})
      : super();

  @override
  RPQuestionType get questionType => RPQuestionType.Integer;

  @override
  Function get fromJsonFunction => _$RPIntegerAnswerFormatFromJson;
  factory RPIntegerAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPIntegerAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPIntegerAnswerFormatToJson(this);
}
