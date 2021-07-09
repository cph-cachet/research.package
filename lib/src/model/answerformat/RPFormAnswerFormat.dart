part of research_package_model;

/// Class representing the Answer Format for Form Questions (Multiple questions
/// at the same time on the same page)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPFormAnswerFormat extends RPAnswerFormat {
  RPFormAnswerFormat() : super() {
    questionType = RPQuestionType.Form;
  }

  @override
  get questionType => RPQuestionType.Form;

  Function get fromJsonFunction => _$RPFormAnswerFormatFromJson;
  factory RPFormAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPFormAnswerFormat;
  Map<String, dynamic> toJson() => _$RPFormAnswerFormatToJson(this);
}
