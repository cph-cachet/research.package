part of '../../../model.dart';

/// Class representing an Answer Format that lets participants use a slider
/// to choose a value.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPSliderAnswerFormat extends RPAnswerFormat {
  /// The minimum value of the range.
  double minValue;

  /// The maximum value of the range.
  double maxValue;

  /// The divisions of the range.
  int divisions;

  /// The prefix displayed before the value.
  String? prefix;

  /// The suffix displayed after yhe value.
  String? suffix;

  RPSliderAnswerFormat({
    required this.minValue,
    required this.maxValue,
    required this.divisions,
    this.prefix = '',
    this.suffix = '',
  }) : super();

  @override
  RPQuestionType get questionType => RPQuestionType.Scale;

  @override
  Function get fromJsonFunction => _$RPSliderAnswerFormatFromJson;
  factory RPSliderAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPSliderAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPSliderAnswerFormatToJson(this);
}
