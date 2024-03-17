part of '../../../model.dart';

/// The result object a Task creates
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTaskResult extends RPResult {
  /// The results of each step of this task result.
  ///
  /// Each entry represents a step's result ([RPResult]).
  /// The keys are strings with the identifiers of the corresponding step.
  late Map<String, RPResult> results;

  /// Create a [RPTaskResult] with a given [identifier] and an empty map of results.
  ///
  /// [identifier] should always be the identifier of the "parent" task.
  /// It sets [startDate] to the `DateTime.now()`. Since these objects are instantiated
  /// together with the Task it belongs to so it can be used for measuring
  /// how much time the participant spent on the given Task.
  RPTaskResult({required super.identifier}) {
    results = {};
    startDate = DateTime.now();
  }

  /// Returns result value for the given [identifier].
  RPResult? getStepResultForIdentifier(String identifier) =>
      results[identifier];

  /// Add a result to the [results] map with the given [identifier].
  void setStepResultForIdentifier(String identifier, RPResult result) =>
      results[identifier] = result;

  factory RPTaskResult.fromJson(Map<String, dynamic> json) =>
      _$RPTaskResultFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RPTaskResultToJson(this);
}
