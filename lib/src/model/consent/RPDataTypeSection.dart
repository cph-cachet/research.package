part of research_package_model;

@JsonSerializable()
class RPDataTypeSection {
  String dataName;
  String dataInformation;

  RPDataTypeSection(this.dataName, this.dataInformation);
}
