class RPConsentSection {
  RPConsentSectionType _type;
  String _title;
  String _formalTitle;

  RPConsentSection(RPConsentSectionType type) {
    this._type = type;
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
