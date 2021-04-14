part of research_package_model;

@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPDataTypeSection extends Serializable {
  String dataName;
  String dataInformation;

  RPDataTypeSection(this.dataName, this.dataInformation);

  Function get fromJsonFunction => _$RPDataTypeSectionFromJson;
  factory RPDataTypeSection.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json);
  Map<String, dynamic> toJson() => _$RPDataTypeSectionToJson(this);
}
