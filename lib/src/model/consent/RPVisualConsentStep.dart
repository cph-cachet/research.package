part of research_package_model;

/*
  The RPVisualConsentStep class represents a step in the visual consent sequence.
 */

class RPVisualConsentStep extends RPStep {
  RPConsentDocument _consentDocument;

  RPVisualConsentStep(String identifier, RPConsentDocument consentDocument) : super(identifier) {
    _consentDocument = consentDocument;
  }

  get consentDocument => this._consentDocument;

  @override
  Widget get stepWidget => RPUIVisualConsentStep(consentDocument: consentDocument);
}
