part of '../../../model.dart';

/// Represents a signature applied to a given consent document.
/// It indicates if a given consent document has been signed by a user.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPConsentSignatureResult extends RPResult {
  /// The linked Consent Document which the user signed
  RPConsentDocument consentDocument;

  /// The signature which contains the name and signature image
  RPSignatureResult? signature;

  /// the ID of the user which signed the document
  String? userID;

  /// The time when the document was signed
  DateTime? get signingDate => endDate;

  /// Create a [RPConsentSignatureResult].
  RPConsentSignatureResult({
    required super.identifier,
    required this.consentDocument,
    this.signature,
  });

  factory RPConsentSignatureResult.fromJson(Map<String, dynamic> json) =>
      _$RPConsentSignatureResultFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$RPConsentSignatureResultToJson(this);
}
