part of research_package_model;

/// The result object a Step creates
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPStepResult extends RPResult {
  /// The title of the question. It is set by the [RPUIStep] and [RPUIFormStep]
  /// so it's easier to trace back the answer result in the result JSON.
  late String questionTitle;

  /// The map of results with a String as identifier and generic type as value
  late Map<String, dynamic> results;

  /// The Answer Format ([RPAnswerFormat]) which generated this result.
  ///
  /// It stores the details about the question (e.g. the available choices)
  /// therefore it's necessary for understanding the value of the result which
  /// usually doesn't tell a lot in itself.
  RPAnswerFormat? answerFormat;

  // When StepResult only has a single value, pair that value with the following key
  /// The default key for the results map. It's used when there's only one answer result.
  /// In that case the result value is saved under this key in the map.
  @JsonKey(ignore: true)
  static const String DEFAULT_KEY = "answer";

  /// Returns an [RPStepResult] with a given identifier and an empty map of results.
  ///
  /// It sets [startDate] to the `DateTime.now()`. Since these objects are instantiated
  /// together with the Step it belongs to so it can be used for measuring how much
  /// time the participant spent the given Step.
  RPStepResult({required String identifier, required this.answerFormat})
      : super(identifier) {
    this.results = Map();
    startDate = DateTime.now();
  }

  /// Returns result value for the given identifier from the [results] map
  dynamic getResultForIdentifier(String identifier) => results[identifier];

  /// Adds a result to the result map with the given identifier.
  ///
  /// Used when the result is not a traditional answer result (e.g. signature result).
  /// Also used at Form Steps where there are multiple questions asked during a single step.
  void setResultForIdentifier(String identifier, dynamic result) {
    this.results[identifier] = result;
    this.endDate = DateTime.now();
  }

  /// Creates an entry for the [results] map with the default key.
  ///
  /// Usually it's used when there's only one result produced by the Question Body
  void setResult(dynamic result) {
    setResultForIdentifier(DEFAULT_KEY, result);
    this.endDate = DateTime.now();
  }

  factory RPStepResult.fromJson(Map<String, dynamic> json) =>
      _$RPStepResultFromJson(json);
  Map<String, dynamic> toJson() => _$RPStepResultToJson(this);
}
