part of research_package_model;

/// The concrete subclass of [RPStep] that represents a step in which a single
/// question is presented to the user.
///
/// When a Task Widget presents an Question Step object, it instantiates an
/// [RPUIQuestionStep] object to present the step. The actual visual presentation
/// depends on the answer format ([RPAnswerFormat]).
/// When you need to present more than one question at the same time, it can be
/// appropriate to use [RPFormStep] instead of [RPQuestionStep].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPQuestionStep extends RPStep {
  /// The answer format which describes the format how a question can be answered.
  RPAnswerFormat answerFormat;

  /// The placeholder text for the Question Steps using an answer format which
  /// requires text entry
  String? placeholder;

  /// Creates a Question Step populated with title (text of the question) and
  /// answer format on which the actual layout depends
  RPQuestionStep(
      {required String identifier,
      required this.answerFormat,
      required String title,
      bool optional = false})
      : super(identifier: identifier, title: title, optional: optional);

  /// The widget (UI representation) of the step.
  ///
  /// This gets initialized when a Question Step has been added to a Task which
  /// is later presented by an [RPUITask] widget.
  @override
  Widget get stepWidget => RPUIQuestionStep(this);

  Function get fromJsonFunction => _$RPQuestionStepFromJson;
  factory RPQuestionStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPQuestionStep;
  Map<String, dynamic> toJson() => _$RPQuestionStepToJson(this);
}
