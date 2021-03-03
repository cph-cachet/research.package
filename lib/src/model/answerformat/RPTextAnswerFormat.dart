part of research_package_model;

/// Class representing an Answer Format that lets participants input a number (integer)
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTextAnswerFormat extends RPAnswerFormat {
  RPTextAnswerFormat();

  /// Constructor with params
  /// **Only exists to comply with the RP convention
  RPTextAnswerFormat.withParams();

  @override
  get questionType {
    return QuestionType.Text;
  }

  factory RPTextAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPTextAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPTextAnswerFormatToJson(this);
}
