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

  RPVisualConsentStep(String identifier, this.consentDocument)
      : super(identifier: identifier, title: ''); // TODO: Should title be required if we have to pass an empty title?

  /// The widget (UI representation) of the step
  @override
  @JsonKey(ignore: true)
  Widget get stepWidget =>
      RPUIVisualConsentStep(consentDocument: consentDocument);

  // factory RPVisualConsentStep.fromJson(Map<String, dynamic> json) =>
  //     FromJsonFactory().fromJson(json);
  factory RPVisualConsentStep.fromJson(Map<String, dynamic> json) => _$RPVisualConsentStepFromJson(json);
  Map<String, dynamic> toJson() => _$RPVisualConsentStepToJson(this);
}
