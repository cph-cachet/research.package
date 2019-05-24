part of research_package_model;

/// The superclass for results. It defines the attributes which all the more specialized results classes should have.
abstract class RPResult {
  /// The identifier which connects the result to the step or task which produced it.
  ///
  /// This identifier is identical to the step's or task's identifier which produced the result so the connection can be made.
  String identifier;
  DateTime _startDate;
  DateTime _endDate;

  RPResult();

  RPResult.withIdentifier(this.identifier);

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
