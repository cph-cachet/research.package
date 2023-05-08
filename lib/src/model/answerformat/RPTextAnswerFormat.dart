part of research_package_model;

/// Class representing an Answer Format that lets participants input a
/// number (integer)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTextAnswerFormat extends RPAnswerFormat {
  /// Hint text shown in the TextField
  String? hintText;
  bool autoFocus;

  RPTextAnswerFormat({this.hintText, this.autoFocus = false}) : super();

  @override
  RPQuestionType get questionType => RPQuestionType.Text;

  @override
  Function get fromJsonFunction => _$RPTextAnswerFormatFromJson;
  factory RPTextAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPTextAnswerFormat;
  @override
  Map<String, dynamic> toJson() => _$RPTextAnswerFormatToJson(this);
}
