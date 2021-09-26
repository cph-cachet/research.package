part of research_package_model;

/// The result object a Task creates
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPTaskResult extends RPResult {
  /// The results in of a Task in a map.
  ///
  /// Each entry represents a Step's result ([RPStepResult]).
  /// The keys are strings with the identifiers of the corresponding Step.
  late Map<String, dynamic> results;

  /// Returns an [RPTaskResult] with a given identifier and an empty map of results.
  ///
  /// [identifier] should always be the identifier of the "parent" task.
  /// It sets [startDate] to the ```DateTime.now()```. Since these objects are instantiated
  /// together with the Task it belongs to so it can be used for measuring
  /// how much time the participant spent the given Task.
  RPTaskResult({required String identifier}) : super(identifier) {
    this.results = Map<String, RPResult>();
    startDate = DateTime.now();
  }

  /// Returns result value for the given identifier from the [results] map
  RPResult getStepResultForIdentifier(String identifier) => results[identifier];

  /// Adds a result to the result map with the given identifier.
  void setStepResultForIdentifier(String identifier, RPResult stepResult) {
    results[identifier] = stepResult;
  }

  factory RPTaskResult.fromJson(Map<String, dynamic> json) =>
      _$RPTaskResultFromJson(json);
  Map<String, dynamic> toJson() => _$RPTaskResultToJson(this);
}
