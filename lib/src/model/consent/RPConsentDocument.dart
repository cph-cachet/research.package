part of research_package_model;

/// Represents the content of an informed consent document.
///
/// Research Package uses [RPConsentDocument] to provide content for [RPVisualConsentStep] where the content if presented to the participant
/// and for [RPConsentReviewStep] where the user can review and sign the document. The building blocks of a consent document are [sections].
/// They hold the content which is presented and later agreed by the participant.
/// By adding [signatures] to the consent document the parameters of the signature(s) to collect can be specified.
class RPConsentDocument {
  String _title;
  List<RPConsentSection> _sections;
  List<RPConsentSignature> _signatures;

  // They are needed only for creating the pdf
  String _signaturePageTitle;
  String _signaturePageContent;

  RPConsentDocument(this._title, this._sections);

  /// Adds a signature to the array of [signatures]
  void addSignature(RPConsentSignature signature) {
    if (_signatures == null) {
      _signatures = [signature];
      return;
    }
    _signatures.add(signature);
  }

  /// Returns an [RPConsentSignature] from the [signatures] array at the given index
  RPConsentSignature getConsentSignatureAtIndex(int index) {
    return _signatures[index];
  }

  /// The title of the document
  ///
  /// This title is shown on the app bar during [RPVisualConsentStep]
  String get title => _title;

  /// For creating PDF. Coming later...
  String get signaturePageTitle => _signaturePageTitle;

  /// For creating PDF. Coming later...
  String get signaturePageContent => _signaturePageContent;

  /// The sections which hold the content of the consent document
  ///
  /// All sections appear in the animated process of [RPVisualConsentStep].
  /// Also their content is presented during [RPConsentReviewStep].
  List<RPConsentSection> get sections => _sections;

  /// The set of signatures that are required in the document
  List<RPConsentSignature> get signatures => _signatures;

  set title(String title) {
    this._title = title;
  }

  set signaturePageTitle(String signaturePageTitle) {
    this._signaturePageTitle = signaturePageTitle;
  }

  set signaturePageContent(String signaturePageContent) {
    this._signaturePageContent = signaturePageContent;
  }

  set sections(List<RPConsentSection> sections) {
    this._sections = sections;
  }

  //TODO: PDF generating
  //Generating the consent pdf is this class' task as well
}
