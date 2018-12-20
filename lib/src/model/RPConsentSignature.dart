// The class is based on ORKConsentSignature (http://researchkit.org/docs/Classes/ORKConsentSignature.html)
// and ConsentSignature (https://github.com/ResearchStack/ResearchStack/blob/master/backbone/src/main/java/org/researchstack/backbone/model/ConsentSignature.java)

class RPConsentSignature {
  bool _requiresName;
  bool _requiresSignatureImage;
  bool _requiresBirthDate;
  String _identifier;
  String _title;
  String _fullName;
  //TODO: Consider the type of this property (UIImage on iOS) and to be moved to widget level
  String _signatureImage;
  DateTime _signatureDate;

  //TODO: Consider adding other named constructors
  RPConsentSignature(
    this._requiresName,
    this._requiresSignatureImage,
    this._requiresBirthDate,
    this._identifier,
    this._title,
    this._fullName,
    this._signatureImage,
    this._signatureDate,
  );

  String get getIdentifier => _identifier;

  bool get requiresName => _requiresName;

  bool get requiresSignatureImage => _requiresSignatureImage;

  bool get requiresBirthDate => _requiresBirthDate;

  String get getTitle => _title;

  String get getFullName => _fullName;

  String get getSignatureImage => _signatureImage;

  DateTime get getSignatureDate => _signatureDate;

  set setIdentifier(String identifier) {
    this._identifier = identifier;
  }

  set setSignatureImage(String signatureImage) {
    this._signatureImage = signatureImage;
  }

  set setFullName(String fullName) {
    this._fullName = fullName;
  }

  set setRequiresBirthDate(bool requiresBirthDate) {
    this._requiresBirthDate = requiresBirthDate;
  }

  set setRequiresSignatureImage(bool requiresSignatureImage) {
    this._requiresSignatureImage = requiresSignatureImage;
  }

  set setRequiresName(bool requiresName) {
    this._requiresName = requiresName;
  }
}
