part of research_package_model;

/*
  The RPVisualConsentStep class represents a step in the visual consent sequence.
 */

/// The step used for presenting the consent document to the participant
///
/// To use a visual consent step, first create a consent document ([RPConsentDocument]) with at least one section
/// and attach the document to a visual consent step.
/// Put the visual consent step into a Research Package task, and present it with an [RPUITask].
class RPVisualConsentStep extends RPStep {
  RPConsentDocument _consentDocument;

  RPVisualConsentStep(String identifier, RPConsentDocument consentDocument) : super(identifier) {
    _consentDocument = consentDocument;
  }

  /// The consent document whose sections determine the order and appearance of scenes in the visual consent step.
  get consentDocument => this._consentDocument;

  /// The widget (UI representation) of the step
  @override
  Widget get stepWidget => RPUIVisualConsentStep(consentDocument: consentDocument);
}
