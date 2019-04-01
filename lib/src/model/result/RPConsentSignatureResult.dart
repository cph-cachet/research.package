part of research_package_model;

class RPConsentSignatureResult extends RPResult {
  RPConsentDocument _consentDocument;
  // Contains name and signature image
  RPSignatureResult _signature;
  String _userID;

  RPConsentSignatureResult(String identifier, this._consentDocument, this._signature) : super(identifier);

  RPConsentDocument get consentDocument => this._consentDocument;
  RPSignatureResult get signature => this._signature;
  String get userID => this._userID;
  /// Returns the time when the document was signed
  DateTime get signingDate => this._endDate;

  set userID(String userID) {
    this._userID = userID;
  }
}
