part of research_package_model;

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

  RPVisualConsentStep(
      {required String identifier, required this.consentDocument})
      : super(identifier: identifier, title: '');

  /// The widget (UI representation) of the step
  @JsonKey(ignore: true)
  Widget get stepWidget =>
      RPUIVisualConsentStep(consentDocument: consentDocument);

  Function get fromJsonFunction => _$RPVisualConsentStepFromJson;
  factory RPVisualConsentStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPVisualConsentStep;
  Map<String, dynamic> toJson() => _$RPVisualConsentStepToJson(this);
}
