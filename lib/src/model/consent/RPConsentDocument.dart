import 'package:research_package/src/model/consent/RPConsentSection.dart';
import 'package:research_package/src/model/consent/RPConsentSignature.dart';

class RPConsentDocument {
  String _title;
  List<RPConsentSection> _sections;
  String _signaturePageTitle;
  String _signaturePageContent;
  List<RPConsentSignature> _signatures;
  String _htmlReviewContent;

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

  String get getSignaturePageTitle => _signaturePageTitle;

  List<RPConsentSection> get getSections => _sections;

  String get getHtmlReviewContent => _htmlReviewContent;

  set setTitle(String title) {
    this._title = title;
  }

  set setSignaturePageTitle(String signaturePageTitle) {
    this._signaturePageTitle = signaturePageTitle;
  }

  set setSignaturePageContent(String signaturePageContent) {
    this._signaturePageContent = signaturePageContent;
  }

  set setSections(List<RPConsentSection> sections) {
    this._sections = sections;
  }

  set setHtmlReviewContent(String htmlReviewContent) {
    this._htmlReviewContent = htmlReviewContent;
  }

  //TODO: PDF generating
  //Generating the consent pdf is this class's task as well
}
