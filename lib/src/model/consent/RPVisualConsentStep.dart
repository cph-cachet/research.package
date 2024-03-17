part of '../../../model.dart';

/// The step used for presenting the consent document to the participant
///
/// To use a visual consent step, first create a consent document ([RPConsentDocument])
/// with at least one section and attach the document to a visual consent step.
/// Put the visual consent step into a Research Package task, and present it
/// with an [RPUITask].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPVisualConsentStep extends RPStep {
  /// The consent document whose sections determine the order and appearance of
  /// scenes in the visual consent step.
  RPConsentDocument consentDocument;

  RPVisualConsentStep({
    required super.identifier,
    required this.consentDocument,
  }) : super(title: '');

  /// The widget (UI representation) of the step
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Widget get stepWidget =>
      RPUIVisualConsentStep(consentDocument: consentDocument);

  @override
  Function get fromJsonFunction => _$RPVisualConsentStepFromJson;
  factory RPVisualConsentStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPVisualConsentStep;
  @override
  Map<String, dynamic> toJson() => _$RPVisualConsentStepToJson(this);
}
