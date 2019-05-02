part of research_package_model;


///
///
///
class RPConsentSignatureResult extends RPResult {
  RPConsentDocument _consentDocument;
  RPSignatureResult _signature;
  String _userID;

  RPConsentSignatureResult(String identifier, this._consentDocument, this._signature) : super(identifier);

  /// Returns the linked Consent Document which the user signed
  RPConsentDocument get consentDocument => this._consentDocument;

  /// Returns the signature which contains the name and signature image
  RPSignatureResult get signature => this._signature;

  /// Returns the the ID of the user which signed the document
  String get userID => this._userID;

  /// Returns the time when the document was signed
  DateTime get signingDate => this._endDate;

  set userID(String userID) {
    this._userID = userID;
  }
}
