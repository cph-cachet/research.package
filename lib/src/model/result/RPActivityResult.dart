part of '../../../model.dart';

/// The result a [RPActivityStep] creates, populated with results, steptimes
/// and interactions.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPActivityResult extends RPResult {
  /// The map of results with a String as identifier and generic type as value
  Map<String, dynamic> results = {};

  /// The [StepTimes] class which holds all the times starting and ending of
  /// each stage in a test.
  StepTimes stepTimes = StepTimes();

  /// The list of [Interaction]s used to store all relevant UI interaction
  /// from the testee.
  List<Interaction> interactions = [];

  /// Create a [RPActivityResult].
  RPActivityResult({required super.identifier});

  /// Returns result value for the given identifier from the [results] map
  /// Used if additional results were added.
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
  void setFinalResult(dynamic result) {
    setResultForIdentifier('result', result);
    endDate = DateTime.now();
  }

  factory RPActivityResult.fromJson(Map<String, dynamic> json) =>
      _$RPActivityResultFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RPActivityResultToJson(this);
}

/// Class representing an interaction with the app in the UI
@JsonSerializable(fieldRename: FieldRename.snake)
class Interaction {
  /// The time of the interaction
  DateTime time;

  /// The correctness of the interaction as a [String]
  String correctness;

  /// The type of interaction (e.g. Button tap or Drawing gesture)
  String type;

  /// A explanatory description of the interaction (e.g. Test failed after tapping the button twice)
  String description;

  Interaction(this.time, this.correctness, this.type, this.description);

  factory Interaction.fromJson(Map<String, dynamic> json) =>
      _$InteractionFromJson(json);
  Map<String, dynamic> toJson() => _$InteractionToJson(this);
}

/// A class representing the times of each stage of the test.
@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)
class StepTimes {
  /// The time the instruction stage of a test started
  DateTime? instructionStarted;

  /// The time the instruction stage of a test ended
  DateTime? instructionEnded;

  /// The time the test stage of a test was shown
  DateTime? testShown;

  /// The time the test stage of a test started
  DateTime? testStarted;

  /// The time the test stage of a test ended
  DateTime? testEnded;

  /// The time the results stage of a test started
  DateTime? resultsShown;

  /// The time the results stage of a test ended
  DateTime? resultsClosed;

  StepTimes();

  factory StepTimes.fromJson(Map<String, dynamic> json) =>
      _$StepTimesFromJson(json);
  Map<String, dynamic> toJson() => _$StepTimesToJson(this);
}
