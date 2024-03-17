part of '../../../model.dart';

/// The superclass for results. It defines the attributes which all the more
/// specialized results classes should have.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPResult {
  /// The identifier which connects the result to the [RPStep] or [RPTask] which
  /// generated this result.
  String identifier;

  /// The time when the participant started the task or result.
  DateTime? startDate;

  /// The time when the participant finished the task or result.
  DateTime? endDate;

  RPResult({required this.identifier});

  // ignore: annotate_overrides
  String toString() => '$runtimeType - identifier: $identifier';

  factory RPResult.fromJson(Map<String, dynamic> json) =>
      _$RPResultFromJson(json);
  Map<String, dynamic> toJson() => _$RPResultToJson(this);
}
