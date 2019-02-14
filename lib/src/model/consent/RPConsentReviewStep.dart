part of research_package_model;

class RPConsentReviewStep extends RPStep {
  RPConsentDocument _consentDocument;
  RPConsentSignature _consentSignature;

  //Confirmation popup title
  String _text;
  //Confirmation popup text
  String _reasonForConsent;

  RPConsentReviewStep(String identifier, RPConsentDocument consentDocument)
      : super(identifier) {
    _consentDocument = consentDocument;
    _consentSignature = null;
  }

  RPConsentSignature get consentSignature => this._consentSignature;

  String get text => this._text;

  String get reasonForConsent => this._reasonForConsent;

  set consentSignature(RPConsentSignature consentSignature) {
    this._consentSignature = consentSignature;
  }

  set reasonForConsent(String reasonForConsent) {
    this._reasonForConsent = reasonForConsent;
  }

  set text(String text) {
    this._text = text;
  }

  @override
  Widget get stepWidget => RPUIConsentReviewStep(
        consentDocument: _consentDocument,
        reasonForConsent: _reasonForConsent,
        text: _text,
      );
}
