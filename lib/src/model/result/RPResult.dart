part of research_package_model;

/// The superclass for results. It defines the attributes which all the more
/// specialized results classes should have.
abstract class RPResult {
  /// The identifier which connects the result to the step or task which
  /// produced it.
  ///
  /// This identifier is identical to the step's or task's identifier which
  /// produced the result so the connection can be made.
  String identifier;

  /// The time when the participant started the task or result
  DateTime? startDate;

  /// The time when the participant finished the task or result
  DateTime? endDate;

  RPResult(this.identifier);
}
