part of '../../../model.dart';

/// A step which can be used as a "Thank you" or completion step in a task.
@JsonSerializable(includeIfNull: false, explicitToJson: true)
class RPCompletionStep extends RPStep {
  /// Create a new [RPCompletionStep] which shown the [text] to the user.
  RPCompletionStep({
    required super.identifier,
    required super.title,
    super.text,
    super.optional,
  });

  @override
  Widget get stepWidget => RPUICompletionStep(step: this);

  @override
  Function get fromJsonFunction => _$RPCompletionStepFromJson;
  factory RPCompletionStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson<RPCompletionStep>(json);
  @override
  Map<String, dynamic> toJson() => _$RPCompletionStepToJson(this);
}
