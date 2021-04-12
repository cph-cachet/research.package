part of research_package_model;

/// Class representing a signature in a consent document
///
/// Signatures can be collected during a [RPConsentReviewStep].
///
/// The signature object has no concept of a cryptographic signature – it is merely
/// a record of any input the user made during a consent review step.
/// Also, the object does not verify or vouch for user identity.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPConsentSignature {
  bool _requiresName;
  bool _requiresSignatureImage;
  bool _requiresBirthDate;
  String _identifier;
  String _title;

  RPConsentSignature();

  /// The default constructor. Returns a signature where both the name and the signature image is required
  RPConsentSignature.withIdentifier(String identifier) {
    this._identifier = identifier;
    this._requiresName = true;
    this._requiresSignatureImage = true;
  }

  RPConsentSignature.fullyPopulated(
    this._requiresName,
    this._requiresSignatureImage,
    this._requiresBirthDate,
    this._identifier,
    this._title,
  );
  //TODO: Consider adding other named constructors

  /// Unique identifier of the signature. This identifies the signature in the
  /// result hierarchy.
  ///
  /// In a result object of a task which collects signature the identifier of
  /// the [RPConsentSignatureResult] object on the deepest level is identical to
  /// this identifier.
  String get identifier => _identifier;

  /// The parameter to decide if the signature requires name.
  ///
  /// If set to [true] it requires an entered name.
  bool get requiresName => _requiresName;

  /// The parameter to decide if the signature requires a signature image.
  ///
  /// If set to [true] the participant has to draw their signature which will
  /// be saved as a picture later.
  bool get requiresSignatureImage => _requiresSignatureImage;

  /// Not implemented yet
  bool get requiresBirthDate => _requiresBirthDate;

  String get title => _title;

  set identifier(String identifier) {
    this._identifier = identifier;
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

  factory RPConsentSignature.fromJson(Map<String, dynamic> json) =>
      _$RPConsentSignatureFromJson(json);
  Map<String, dynamic> toJson() => _$RPConsentSignatureToJson(this);
}
