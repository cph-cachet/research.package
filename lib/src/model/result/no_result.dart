part of '../../../model.dart';

/// The result object of a step with no result.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPNoResult extends RPResult {
  RPNoResult({required super.identifier});

  factory RPNoResult.fromJson(Map<String, dynamic> json) =>
      _$RPNoResultFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RPNoResultToJson(this);
}
