part of research_package_model;

/// Represents a signature applied to a given consent document.
/// It indicates if a given consent document has been signed by a user.
class RPConsentSignatureResult extends RPResult {
  RPConsentDocument _consentDocument;
  RPSignatureResult _signature;
  String _userID;

  RPConsentSignatureResult(String identifier, this._consentDocument, this._signature) : super(identifier);

  /// The linked Consent Document which the user signed
  RPConsentDocument get consentDocument => this._consentDocument;

  /// The signature which contains the name and signature image
  RPSignatureResult get signature => this._signature;

  /// the ID of the user which signed the document
  String get userID => this._userID;

  /// The time when the document was signed
  DateTime get signingDate => this._endDate;

  set userID(String userID) {
    this._userID = userID;
  }
}
