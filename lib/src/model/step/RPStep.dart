part of research_package_model;


/// The base class for steps which can compose a task.
///
/// Each [RPStep] object represents one logical piece of data entry or activity in a larger task.
/// Whether your app is giving instructions, presenting a form or survey,
/// obtaining consent, or running an active task, everything in the Research Package framework
/// is a collection of steps ([RPStep] objects), which together form a task (an [RPTask] object)
abstract class RPStep {
  final String _identifier;
//  bool _optional;
  String _title;
  String _text;
  Widget _stepWidget;

  /// Default constructor. Returns a step with the given identifier
  RPStep(this._identifier);

  /// Returns a step object with the given [title]. Different types of Steps are using the [title] text differently.
  RPStep.withTitle(this._identifier, this._title);

  /// A unique identifier of the Step. This identifier connects the Step to its result ([RPResult]) object.
  String get identifier => _identifier;

//  /// Not implemented yet
//  bool get optional => _optional;

  /// The title text. Different types of Steps are using the [title] text differently.
  ///
  /// For e.g. the [title] of [RPCompletionStep] is rendered in the middle of the screen while the
  /// [title] of an [RPQuestionStep] is the text of the actual question.
  String get title => _title;

  /// The text of the Step. Different types of Steps are using the [text] text differently.
  ///
  /// For e.g. the [text] of [RPCompletionStep] is rendered in the middle of the screen while the
  /// [RPQuestionStep] does not even use it.
  String get text => _text;

  /// The widget (UI representation) of the step. [RPQuestionStep]s don't have it because their UI representation depends on the Answer Format.
  /// Their Answer Format is assessed by [RPUIQuestionStep] or [RPUIFormStep] and they return the corresponding UI.
  ///
  /// When needed, it should be overridden to fit the different types of Steps.
  Widget get stepWidget => _stepWidget;

//  set optional(bool optional) {
//    this._optional = optional;
//  }

  set title(String title) {
    this._title = title;
  }

  set text(String text) {
    this._text = text;
  }
}

/// Status to be sent to the Bloc so the Task Widget is notified about the navigation
enum StepStatus { Finished, Canceled, Ongoing, Back }
