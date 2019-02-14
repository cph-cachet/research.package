// The class is based on ORKConsent section (http://researchkit.org/docs/Classes/ORKConsentSection.html)
// and ConsentSection (https://github.com/ResearchStack/ResearchStack/blob/master/backbone/src/main/java/org/researchstack/backbone/model/ConsentSection.java)
part of research_package_model;


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
    this._title = localizedTitleForConsentSectionType(type);
  }

  String get title => _title;

  String get formalTitle => _formalTitle;

  RPConsentSectionType get type => _type;

  String get htmlContent => _htmlContent;

  String get content => _content;

  String get summary => _summary;

  set title(String title) {
    this._title = title;
  }

  set htmlContent(String htmlContent) {
    this._htmlContent = htmlContent;
  }

  set content(String content) {
    this._content = content;
  }

  set summary(String summary) {
    this._summary = summary;
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

//TODO: Localization
String localizedTitleForConsentSectionType(RPConsentSectionType type) {
  String str;
  switch (type) {
    case RPConsentSectionType.Overview:
      str = "Overview";
      break;
    case RPConsentSectionType.DataGathering:
      str = "Data Gathering";
      break;
    case RPConsentSectionType.Privacy:
      str = "Privacy";
      break;
    case RPConsentSectionType.DataUse:
      str = "Data Use";
      break;
    case RPConsentSectionType.TimeCommitment:
      str = "Time Commitment";
      break;
    case RPConsentSectionType.StudyTasks:
      str = "Study Tasks";
      break;
    case RPConsentSectionType.StudySurvey:
      str = "Study Survey";
      break;
    case RPConsentSectionType.Withdrawing:
      str = "Withdrawing";
      break;
    case RPConsentSectionType.Custom:
      str = null;
      break;
  }
  return str;
}
