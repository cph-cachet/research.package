part of '../../../model.dart';

/// The superclass for results. It defines the attributes which all the more
/// specialized results classes should have.
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class RPResult extends Serializable {
  /// The identifier which connects the result to the [RPStep] or [RPTask] which
  /// generated this result.
  String identifier;

  /// The time when the participant started the task or result.
  DateTime? startDate;

  /// The time when the participant finished the task or result.
  DateTime? endDate;

  RPResult({required this.identifier});

  @override
  Function get fromJsonFunction => _$RPResultFromJson;
  factory RPResult.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson<RPResult>(json);

  @override
  Map<String, dynamic> toJson() => _$RPResultToJson(this);

  @override
  String toString() => '$runtimeType - identifier: $identifier';
}
