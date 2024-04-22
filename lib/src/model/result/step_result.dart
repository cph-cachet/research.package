part of '../../../model.dart';

/// The result from a [RPStep].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPStepResult extends RPResult {
  /// The title of the question.
  ///
  /// It is set by the [RPStep] and [RPUIFormStep] so it's easier to trace
  /// back this answer result from the step that initiated it.
  String questionTitle;

  /// The map of results with a string as identifier and generic type as value.
  Map<String, dynamic> results = {};

  /// The Answer Format ([RPAnswerFormat]) which generated this result.
  ///
  /// It stores the details about the question (e.g. the available choices)
  /// therefore it's necessary for understanding the value of the result which
  /// usually doesn't tell a lot in itself.
  RPAnswerFormat answerFormat;

  // When this result only has a single value, pair that value with the following key.
  /// The default key for the results map. It's used when there's only one answer result.
  /// In that case the result value is saved under this key in the map.
  @JsonKey(includeFromJson: false, includeToJson: false)
  static const String DEFAULT_KEY = "answer";

  /// Create a [RPStepResult] with a given [identifier] and an empty map of
  /// results.
  ///
  /// It sets [startDate] to the `DateTime.now()`. Since these objects are instantiated
  /// together with the Step it belongs to so it can be used for measuring how much
  /// time the participant spent the given Step.
  RPStepResult({
    required super.identifier,
    required this.questionTitle,
    required this.answerFormat,
  }) {
    results = {};
    startDate = DateTime.now();
  }

  /// Returns result value for the given identifier from the [results] map
  dynamic getResultForIdentifier(String identifier) => results[identifier];

  /// Adds a result to the result map with the given identifier.
  ///
  /// Used when the result is not a traditional answer result (e.g. signature result).
  /// Also used at Form Steps where there are multiple questions asked during a single step.
  void setResultForIdentifier(String identifier, dynamic result) {
    results[identifier] = result;
    endDate = DateTime.now();
  }

  /// Creates an entry for the [results] map with the default key.
  ///
  /// Usually it's used when there's only one result produced by the Question Body
  void setResult(dynamic result) {
    setResultForIdentifier(DEFAULT_KEY, result);
    endDate = DateTime.now();
  }

  factory RPStepResult.fromJson(Map<String, dynamic> json) =>
      _$RPStepResultFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RPStepResultToJson(this);
}
