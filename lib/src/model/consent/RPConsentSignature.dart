// The class is based on ORKConsentSignature (http://researchkit.org/docs/Classes/ORKConsentSignature.html)
// and ConsentSignature (https://github.com/ResearchStack/ResearchStack/blob/master/backbone/src/main/java/org/researchstack/backbone/model/ConsentSignature.java)

part of research_package_model;

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

  String get identifier => _identifier;

  bool get requiresName => _requiresName;

  bool get requiresSignatureImage => _requiresSignatureImage;

  bool get requiresBirthDate => _requiresBirthDate;

  String get title => _title;

  String get fullName => _fullName;

  String get signatureImage => _signatureImage;

  DateTime get signatureDate => _signatureDate;

  set identifier(String identifier) {
    this._identifier = identifier;
  }

  set signatureImage(String signatureImage) {
    this._signatureImage = signatureImage;
  }

  set fullName(String fullName) {
    this._fullName = fullName;
  }

  set requiresBirthDate(bool requiresBirthDate) {
    this._requiresBirthDate = requiresBirthDate;
  }

  set requiresSignatureImage(bool requiresSignatureImage) {
    this._requiresSignatureImage = requiresSignatureImage;
  }

  set requiresName(bool requiresName) {
    this._requiresName = requiresName;
  }
}
