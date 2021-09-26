part of research_package_model;

/// Represents the content of an informed consent document.
///
/// Research Package uses [RPConsentDocument] to provide content for
/// [RPVisualConsentStep] where the content if presented to the participant
/// and for [RPConsentReviewStep] where the user can review and sign the document.
/// The building blocks of a consent document are [sections].
/// They hold the content which is presented and later agreed by the participant.
/// By adding [signatures] to the consent document the parameters of the
/// signature(s) to collect can be specified.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPConsentDocument extends Serializable {
  /// The list of signatures that are required in the document
  List<RPConsentSignature> signatures = [];

  /// The title of the consent document
  ///
  /// This title is shown on the app bar during [RPVisualConsentStep]
  String title;

  /// The sections which hold the content of the consent document
  ///
  /// All sections appear in the animated process of [RPVisualConsentStep].
  /// Also their content is presented during [RPConsentReviewStep].
  List<RPConsentSection> sections;

  // They are needed only for creating the pdf
  String? _signaturePageTitle;
  String? _signaturePageContent;

  RPConsentDocument({required this.title, required this.sections}) {
    _registerFromJsonFunctions();
  }

  /// Adds a signature to the list of [signatures]
  void addSignature(RPConsentSignature signature) {
    signatures.add(signature);
  }

  /// Returns an [RPConsentSignature] from the [signatures] array at the given index
  RPConsentSignature getConsentSignatureAtIndex(int index) {
    return signatures[index];
  }

  /// For creating PDF. Coming later...
  String? get signaturePageTitle => _signaturePageTitle;

  /// For creating PDF. Coming later...
  String? get signaturePageContent => _signaturePageContent;

  set signaturePageTitle(String? signaturePageTitle) {
    this._signaturePageTitle = signaturePageTitle;
  }

  set signaturePageContent(String? signaturePageContent) {
    this._signaturePageContent = signaturePageContent;
  }

  //TODO: PDF generating
  //Generating the consent pdf is this class' task as well

  Function get fromJsonFunction => _$RPConsentDocumentFromJson;
  factory RPConsentDocument.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPConsentDocument;
  Map<String, dynamic> toJson() => _$RPConsentDocumentToJson(this);
}
