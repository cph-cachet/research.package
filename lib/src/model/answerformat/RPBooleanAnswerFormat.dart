part of research_package_model;

/// Class representing an answer format that lets participants choose between
/// true or false (yes or no) options.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPBooleanAnswerFormat extends RPAnswerFormat {
  /// The text shown for the `true` option
  String trueText;

  /// The text shown for the `false` option
  String falseText;

  RPBooleanAnswerFormat({required this.trueText, required this.falseText})
      : super();

  @override
  get questionType => RPQuestionType.Boolean;

  // factory RPBooleanAnswerFormat.fromJson(Map<String, dynamic> json) =>
  //     FromJsonFactory().fromJson(json);
  factory RPBooleanAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPBooleanAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPBooleanAnswerFormatToJson(this);
}
