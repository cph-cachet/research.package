part of research_package_model;

/// A base (abstract) class for different Answer Formats.
///
/// The Answer Format describes the format how a question can be answered.
/// Research Package uses [RPQuestionStep] to represent a question in a survey.
/// Each questions needs to have an associated Answer Format.
/// Note:
/// *This class should be an abstract class but since we need to
/// serialize it we have to provide a constructor and factory. There's no better solution found yet.
/// Used in [RPStepResult]*
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPAnswerFormat {
  Widget _questionBody;

  /// The Question Type of the Answer Format. Should be implemented in the subclasses.
  QuestionType questionType;

  /// The default constructor. The appropriate subclass of RPAnswerFormat should be used instead of this directly.
  RPAnswerFormat();

  // Returns the QuestionType for this answer format. Implement this in your subclass
  // It's for approximation, what kind of data the answer will return.
  // Also, they are _almost_ the same as the questionResult classes in RK
//  QuestionType get questionType => QuestionType.None; // TODO: Investigate more what's this for

  /// The widget (UI representation)
  ///
  /// Each type has its own [questionBody] widget so it's overridden in every subclass.
  Widget get questionBody => _questionBody;

  factory RPAnswerFormat.fromJson(Map<String, dynamic> json) => _$RPAnswerFormatFromJson(json);
  Map<String, dynamic> toJson() => _$RPAnswerFormatToJson(this);
}

enum QuestionType {
  None,
  Scale,
  SingleChoice,
  MultipleChoice,
  Decimal,
  Integer,
  Boolean,
  Eligibility,
  Text,
  TimeOfDay,
  DateAndTime,
  Date,
  TimeInterval,
  Duration,
  Location,
  Form
}

//enum ScaleAnswerStyle {
//  Default,
//  Percent,
//  Buttons,
//}

/// Available types for [RPChoiceAnswerFormat]
enum ChoiceAnswerStyle {
  /// The participant allowed to choose only a single option from the given set
  SingleChoice,

  /// The participant allowed only to choose multiple option from the given set
  MultipleChoice,
}

//enum DateAnswerStyle {
//  DateAndTime,
//  Date,
//  TimeOfDay,
//}
//
//enum NumberFormattingStyle {
//  Default,
//  Percent
//}
