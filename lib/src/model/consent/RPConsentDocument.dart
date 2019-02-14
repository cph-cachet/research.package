//import 'package:research_package/src/model/consent/RPConsentSection.dart';
//import 'package:research_package/src/model/consent/RPConsentSignature.dart';
part of research_package_model;

class RPConsentDocument {
  String _title;
  List<RPConsentSection> _sections;
  String _signaturePageTitle;
  String _signaturePageContent;
  List<RPConsentSignature> _signatures;
  String _htmlReviewContent; //TODO: Only in ResearchStack. ResearchKit has its own step for it

  RPConsentDocument(
    this._title,
    this._sections,
    this._signaturePageTitle,
    this._signaturePageContent,
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

  String get htmlReviewContent => _htmlReviewContent;

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

  set htmlReviewContent(String htmlReviewContent) {
    this._htmlReviewContent = htmlReviewContent;
  }

  //TODO: PDF generating
  //Generating the consent pdf is this class's task as well
}
