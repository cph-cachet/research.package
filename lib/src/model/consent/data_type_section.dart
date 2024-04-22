part of '../../../model.dart';

/// Class representing a specific data type being collected to be shown
/// as part of informed consent.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPDataTypeSection extends Serializable {
  /// The name of the data being collected.
  String dataName;

  /// Detailed information on the type of data being collected.
  String dataInformation;

  RPDataTypeSection({required this.dataName, required this.dataInformation});

  @override
  Function get fromJsonFunction => _$RPDataTypeSectionFromJson;
  factory RPDataTypeSection.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPDataTypeSection;
  @override
  Map<String, dynamic> toJson() => _$RPDataTypeSectionToJson(this);
}
