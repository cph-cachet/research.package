part of research_package_model;

/// Not fully implemented yet
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPFormAnswerFormat extends RPAnswerFormat {
  RPFormAnswerFormat() {
    questionType = QuestionType.Form;
  }

  @override
  get questionType {
    return QuestionType.Form;
  }
}