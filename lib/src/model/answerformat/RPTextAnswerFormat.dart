part of research_package_model;

/// Class representing an Answer Format that lets participants input a
/// number (integer)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTextAnswerFormat extends RPAnswerFormat {
  /// Hint text shown in the TextField
  String? hintText;

  RPTextAnswerFormat({this.hintText}) : super();

  @override
  get questionType => RPQuestionType.Text;

  // factory RPTextAnswerFormat.fromJson(Map<String, dynamic> json) =>
  //     FromJsonFactory().fromJson(json);
  factory RPTextAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPTextAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPTextAnswerFormatToJson(this);
}
