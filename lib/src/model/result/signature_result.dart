part of '../../../model.dart';

/// The signature used in [RPConsentSignatureResult]
///
/// It represents a signature with the participants name and signature image.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPSignatureResult {
  /// The person's first name
  String? firstName;

  /// The person's last name
  String? lastName;

  /// The image of the provided signature in png format as bytes
  String? signatureImage;

  /// Create a [RPSignatureResult].
  RPSignatureResult({
    this.firstName,
    this.lastName,
    this.signatureImage,
  });

  RPSignatureResult.withParams(
      this.firstName, this.lastName, this.signatureImage);

  /// Returns the person's full name with space between first and last name
  String get fullName => "$firstName $lastName";

  factory RPSignatureResult.fromJson(Map<String, dynamic> json) =>
      _$RPSignatureResultFromJson(json);
  Map<String, dynamic> toJson() => _$RPSignatureResultToJson(this);
}
