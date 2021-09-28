part of research_package_model;

/// The result object of a step with no result.
///
/// This is a quick fix to streams that can no longer take null values.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPNoResult extends RPResult {
  RPNoResult() : super('NoResult');

  factory RPNoResult.fromJson(Map<String, dynamic> json) =>
      _$RPNoResultFromJson(json);
  Map<String, dynamic> toJson() => _$RPNoResultToJson(this);
}
