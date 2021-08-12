part of research_package_model;

/// The step for presenting the consent document for review and collecting the
/// signature
///
/// The [RPConsentReviewStep] is used for:
/// - presenting the content of each section ([RPConsentSection]) of the
///   consent document ([RPConsentDocument]) in a summarized form to the participant
/// - collecting name (optional) and signature (optional)
///
/// The presence or type of the to be collected signature depends on the
/// [consentDocument]'s signature list.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPConsentReviewStep extends RPStep {
  /// The consent document to review and sign
  RPConsentDocument consentDocument;

  /// The text shown as the confirmation popup title
  String? text;

  /// The text in the confirmation popup (body)
  String? reasonForConsent;

  /// Returns an initialized Consent Review Step
  ///
  /// If the consent document doesn't have any signatures then no signature
  /// collection stage is part of the flow.
  /// On how to specify a signature go to [RPConsentSignature].
  RPConsentReviewStep(
      {required String identifier,
      required this.consentDocument,
      this.reasonForConsent,
      this.text})
      : super(identifier: identifier, title: '');

  /// The widget (UI representation) of the step
  ///
  /// It returns the corresponding step widget with this step as an input
  @override
  @JsonKey(ignore: true)
  Widget get stepWidget => RPUIConsentReviewStep(this);

  Function get fromJsonFunction => _$RPConsentReviewStepFromJson;
  factory RPConsentReviewStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPConsentReviewStep;
  Map<String, dynamic> toJson() => _$RPConsentReviewStepToJson(this);
}
