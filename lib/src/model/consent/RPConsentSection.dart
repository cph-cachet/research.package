// The class is based on ORKConsent section (http://researchkit.org/docs/Classes/ORKConsentSection.html)
// and ConsentSection (https://github.com/ResearchStack/ResearchStack/blob/master/backbone/src/main/java/org/researchstack/backbone/model/ConsentSection.java)

class RPConsentSection {
  RPConsentSectionType _type;
  String _title;
  String _formalTitle;
  String _summary;
  String _content;
  String _htmlContent;
  //TODO: Consider the following properties to be moved to widget level
  String _customImageName;
  String _customLearnMoreButtonTitle;
  String _customAnimationURL;

  RPConsentSection(RPConsentSectionType type) {
    this._type = type;
    this._summary = null;
  }

  String get getTitle => _title;

  String get getFormalTitle => _formalTitle;

  RPConsentSectionType get getType => _type;

  String get getHtmlContent => _htmlContent;

  String get getContent => _content;

  set setTitle(String title) {
    this._title = title;
  }

  set setHtmlContent(String htmlContent) {
    this._htmlContent = htmlContent;
  }

  set setContent(String content) {
    this._content = content;
  }
}

enum RPConsentSectionType {
  Overview,
  DataGathering,
  Privacy,
  DataUse,
  TimeCommitment,
  StudyTasks,
  StudySurvey,
  Withdrawing,
  Custom
}
