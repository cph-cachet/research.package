part of research_package_model;

/// The result a [RPActivityStep] creates, populated with results, steptimes and interactions.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPActivityResult extends RPResult {
  Map<String, dynamic> _results;
  StepTimes _stepTimes;
  List<Interaction> _interactions;

  /// Default constructor used for JSON.
  /// Use [RPActivityResult.withParams(...)] when creating an Activity.
  RPActivityResult();

  /// Returns an [RPActivityResult] with a given identifier, an empty map of results, steptimes and interaction list.
  ///
  /// It sets [startDate] to the [DateTime.now()]. Since these objects are instantiated
  /// together with the Activity it belongs to so it can be used for measuring how much
  /// time the participant spent the given Activity.
  RPActivityResult.withParams(RPStep step) : super.withIdentifier(step.identifier) {
    this._results = Map<String, dynamic>();
    this._stepTimes = StepTimes();
    this._interactions = List();

    this.startDate = DateTime.now();
  }

  /// The map of results with a String as identifier and generic type as value
  Map<String, dynamic> get results => _results;

  /// The [StepTimes] class which holds all the times starting and ending of each stage in a test.
  StepTimes get stepTimes => _stepTimes;

  /// The list of [Interaction]s used to store all relevant UI interaction from the testee.
  List get interactions => _interactions;

  /// Set result value
  set results(Map<String, dynamic> results) {
    this._results = results;
  }

  /// Set step times
  set stepTimes(StepTimes stepTimes) {
    this._stepTimes = stepTimes;
  }

  /// Set interactions
  set interactions(List interactions) {
    this._interactions = interactions;
  }

  /// Returns result value for the given identifier from the [results] map
  /// Used if additional results were added.
  dynamic getResultForIdentifier(String identifier) => _results[identifier];

  /// Adds a result to the result map with the given identifier.
  ///
  /// Used when the result is not a traditional answer result (e.g. signature result).
  /// Also used at Form Steps where there are multiple questions asked during a single step.
  void _setResultForIdentifier(String identifier, dynamic result) {
    this._results[identifier] = result;
    this.endDate = DateTime.now();
  }

  /// Creates an entry for the [results] map with the default key.
  ///
  /// Usually it's used when there's only one result produced by the Question Body
  void setFinalResult(dynamic result) {
    _setResultForIdentifier('result', result);
    this.endDate = DateTime.now();
  }

  factory RPActivityResult.fromJson(Map<String, dynamic> json) => _$RPActivityResultFromJson(json);
  Map<String, dynamic> toJson() => _$RPActivityResultToJson(this);
}

/// Class representing an interaction with the app in the UI
@JsonSerializable(fieldRename: FieldRename.snake)
class Interaction {
  DateTime _time;
  String _correctness;
  String _type;
  String _description;

  Interaction(DateTime time, String correctness, String type, String description) {
    this._time = time;
    this._correctness = correctness;
    this._type = type;
    this._description = description;
  }

  /// The time of the interaction
  DateTime get time => _time;

  /// The correctness of the interaction as a [String]
  String get correctness => _correctness;

  /// The type of interaction (e.g. Button tap or Drawing gesture)
  String get type => _type;

  /// A explanatory description of the interaction (e.g. Test failed after tapping the button twice)
  String get description => _description;

  factory Interaction.fromJson(Map<String, dynamic> json) => _$InteractionFromJson(json);
  Map<String, dynamic> toJson() => _$InteractionToJson(this);
}

@JsonSerializable(includeIfNull: false, fieldRename: FieldRename.snake)

/// A class representing the times of each stage of the test.
class StepTimes {
  /// The time the instruction stage of a test started
  DateTime instructionStarted;

  /// The time the instruction stage of a test ended
  DateTime instructionEnded;

  /// The time the test stage of a test was shown
  DateTime testShown;

  /// The time the test stage of a test started
  DateTime testStarted;

  /// The time the test stage of a test ended
  DateTime testEnded;

  /// The time the results stage of a test started
  DateTime resultsShown;

  /// The time the results stage of a test ended
  DateTime resultsClosed;

  StepTimes();

  factory StepTimes.fromJson(Map<String, dynamic> json) => _$StepTimesFromJson(json);
  Map<String, dynamic> toJson() => _$StepTimesToJson(this);
}
