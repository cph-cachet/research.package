part of research_package_model;

class RPResult {
  String _identifier;
  DateTime _startDate;
  DateTime _endDate;

  RPResult(this._identifier);

  /// The identifier which connects the result to the step or task which produced it
  String get identifier => _identifier;

  /// The time when the participant started the task or result
  DateTime get startDate => _startDate;

  /// The time when the participant finished the task or result
  DateTime get endDate => _endDate;

  set startDate(DateTime startDate) {
    this._startDate = startDate;
  }

  set endDate(DateTime endDate) {
    this._endDate = endDate;
  }
}
