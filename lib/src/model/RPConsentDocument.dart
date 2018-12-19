import 'RPConsentSection.dart';

//

class RPConsentDocument {
  final String _title;
  final List<RPConsentSection> _sections;
  final String _signaturePageTitle;
  final String _signaturePageContent;
  //TODO: Handling Signatures
  // Needs a new signature class

  RPConsentDocument(this._title, this._sections, this._signaturePageTitle,
      this._signaturePageContent);

  //TODO: PDF generating
  //Generating the consent pdf is this class's task as well
}
