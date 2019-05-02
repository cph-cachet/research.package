part of research_package_model;

/// The step for presenting the consent document for review and collecting the signature
///
/// The [RPConsentReviewStep] is used for:
/// - presenting the content of each section ([RPConsentSection]) of the consent document ([RPConsentDocument]) in a summarized form to the participant
/// - collecting name (optional) and signature (optional)
///
/// The presence or type of the to be collected signature depends on the [consentDocument]'s signature list.
class RPConsentReviewStep extends RPStep {
  RPConsentDocument _consentDocument;
  String _text;
  String _reasonForConsent;

  /// Returns an initialized Consent Review Step
  ///
  /// If the consent document doesn't have any signatures then no signature collection stage is part of the flow.
  /// On how to specify a signature go to [RPConsentSignature].
  RPConsentReviewStep(String identifier, RPConsentDocument consentDocument) : super(identifier) {
    _consentDocument = consentDocument;
  }

  /// The text shown as the confirmation popup title
  String get text => this._text;

  /// The text in the confirmation popup (body)
  String get reasonForConsent => this._reasonForConsent;

  /// The consent document to review and sign
  RPConsentDocument get consentDocument => this._consentDocument;

  set reasonForConsent(String reasonForConsent) {
    this._reasonForConsent = reasonForConsent;
  }

  set text(String text) {
    this._text = text;
  }

  /// The widget (UI representation) of the step
  ///
  /// It returns the corresponding step widget with this step as an input
  @override
  Widget get stepWidget => RPUIConsentReviewStep(this);
}
