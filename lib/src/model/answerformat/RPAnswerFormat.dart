part of research_package_model;

/// A base (abstract) class for different Answer Formats.
///
/// The Answer Format describes the format how a question can be answered.
/// Research Package uses [RPQuestionStep] and [RPFormStep] ([RPQuestionStep]s
/// on a single page) to represent a question in a survey.
/// Each questions needs to have an associated Answer Format.
/// Note:
/// *This class should be an abstract class but since we need to
/// serialize it we have to provide a constructor and factory. There's no better solution found yet.
/// Used in [RPStepResult]*
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPAnswerFormat extends Serializable {
  /// The Question Type of the Answer Format. Should be implemented in the subclasses.
  late RPQuestionType questionType;

  /// The default constructor. The appropriate subclass of RPAnswerFormat
  /// should be used instead of this directly.
  RPAnswerFormat() : super();

  Function get fromJsonFunction => _$RPAnswerFormatFromJson;
  factory RPAnswerFormat.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPAnswerFormat;
  Map<String, dynamic> toJson() => _$RPAnswerFormatToJson(this);
}

enum RPQuestionType {
  None,
  Scale,
  SingleChoice,
  MultipleChoice,
  Decimal,
  Integer,
  Boolean,
  Text,
  TimeOfDay,
  DateAndTime,
  Date,
  Duration,
  ImageChoice,
  // Eligibility,
  // TimeInterval,
  // Location,

  /// The AnswerFormat used by [RPFormStep].
  ///
  /// It's only for indication that the step is not an [RPQuestionStep] but a
  /// Form Step which includes multiple items.
  /// [RPFormStep] knows automatically that this is it's QuestionType.
  /// There's no need of specifying it.
  Form
}

/// Available types for [RPChoiceAnswerFormat]
enum RPChoiceAnswerStyle {
  /// The participant allowed to choose only a single option from the given set
  SingleChoice,

  /// The participant allowed only to choose multiple option from the given set
  MultipleChoice,
}

/// For choosing Date, Time or DateAndTime sub-answerformat
enum RPDateTimeAnswerStyle {
  DateAndTime,
  Date,
  TimeOfDay,
}
