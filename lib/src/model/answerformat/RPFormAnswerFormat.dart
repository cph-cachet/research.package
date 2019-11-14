part of research_package_model;

/// Class representing the Answer Format for Form Questions (Multiple questions at the same time on the same page)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPFormAnswerFormat extends RPAnswerFormat {
  RPFormAnswerFormat() {
    questionType = QuestionType.Form;
  }

  @override
  get questionType {
    return QuestionType.Form;
  }

  factory RPFormAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPFormAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPFormAnswerFormatToJson(this);
}