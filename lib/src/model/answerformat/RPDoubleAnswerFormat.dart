part of '../../../model.dart';

/// Class representing an Answer Format that lets participants input a
/// decimal number (double)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPDoubleAnswerFormat extends RPAnswerFormat {
  /// The minimum value of the range. The participant can not proceed if the
  /// number is outside the range.
  double minValue;

  /// The maximum value of the range. The participant can not proceed if the
  /// number is outside the range.
  double maxValue;

  /// The text to show after the input field.
  /// If `null` then no text is shown.
  String? suffix;

  RPDoubleAnswerFormat(
      {required this.minValue, required this.maxValue, this.suffix})
      : super();

  @override
  RPQuestionType get questionType => RPQuestionType.Double;

  @override
  Function get fromJsonFunction => _$RPDoubleAnswerFormatFromJson;
  factory RPDoubleAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPDoubleAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPDoubleAnswerFormatToJson(this);
}
