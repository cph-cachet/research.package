part of '../../../model.dart';

/// The result object of a step with no result.
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class RPNoResult extends RPResult {
  RPNoResult({required super.identifier});

  @override
  Function get fromJsonFunction => _$RPNoResultFromJson;
  factory RPNoResult.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson<RPNoResult>(json);

  @override
  Map<String, dynamic> toJson() => _$RPNoResultToJson(this);
}
