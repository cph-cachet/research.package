part of '../../../model.dart';

/// Class representing an Answer Format that lets participants input a
/// number (integer)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTextAnswerFormat extends RPAnswerFormat {
  /// Hint text shown in the TextField
  String? hintText;
  bool autoFocus;

  /// Force the keyboard not to have any suggestions, corrections, or auto completions
  /// This is important for writing tests, in which the speed and accuracy is important
  bool disableHelpers;

  RPTextAnswerFormat(
      {this.hintText, this.autoFocus = false, this.disableHelpers = false})
      : super();

  @override
  RPQuestionType get questionType => RPQuestionType.Text;

  @override
  Function get fromJsonFunction => _$RPTextAnswerFormatFromJson;
  factory RPTextAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPTextAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPTextAnswerFormatToJson(this);
}
