//import 'package:research_package/src/model/consent/RPConsentSection.dart';
//import 'package:research_package/src/model/consent/RPConsentSignature.dart';
part of research_package_model;

class RPConsentDocument {
  String _title;
  List<RPConsentSection> _sections;
  List<RPConsentSignature> _signatures = [];
  // They are needed only for pdf creating
  String _signaturePageTitle;
  String _signaturePageContent;

  RPConsentDocument(
    this._title,
    this._sections,
  );

  void addSignature(RPConsentSignature signature) {
    _signatures.add(signature);
  }

  RPConsentSignature getConsentSignatureAtIndex(int index) {
    return _signatures[index];
  }

  String get title => _title;

  String get signaturePageTitle => _signaturePageTitle;

  String get signaturePageContent => _signaturePageContent;

  List<RPConsentSection> get sections => _sections;

  List<RPConsentSignature> get signatures => _signatures;

  set title(String title) {
    this._title = title;
  }

  set signaturePageTitle(String signaturePageTitle) {
    this._signaturePageTitle = signaturePageTitle;
  }

  set signaturePageContent(String signaturePageContent) {
    this._signaturePageContent = signaturePageContent;
  }

  set sections(List<RPConsentSection> sections) {
    this._sections = sections;
  }

  //TODO: PDF generating
  //Generating the consent pdf is this class's task as well
}
