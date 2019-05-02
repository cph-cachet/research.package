part of research_package_model;

/// The signature used in [RPConsentSignatureResult]
///
/// It represents a signature with the participants name and signature image
class RPSignatureResult {
  String _firstName;
  String _lastName;
  Uint8List _signatureImage;

  RPSignatureResult(this._firstName, this._lastName, this._signatureImage);

  /// Returns the person's full name with space between first and last name
  String get fullName => "${this._firstName} ${this._lastName}";

  /// Returns the person's first name
  String get firstName => this._firstName;

  /// Returns the person's last name
  String get lastName => this._lastName;

  /// Returns the image of the provided signature in png format as bytes
  Uint8List get signatureImage => this._signatureImage;

  // There are no setters because nobody else should be able to modify the result
}
