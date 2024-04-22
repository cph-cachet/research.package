part of '../../../model.dart';

/// A content section in a [RPConsentDocument].
///
/// It represents one section in a [RPConsentDocument].
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPConsentSection extends Serializable {
  /// The type of the section.
  ///
  /// The [title] and the image which is shown on the section card is associated
  /// to the [type].
  RPConsentSectionType type;

  /// The title of the consent section which appears both in [RPVisualConsentStep]
  /// and [RPConsentReviewStep].
  late String title;

  /// A short summary of the section. It appears during [RPVisualConsentStep]
  String? summary;

  /// A longer content text of the section.
  ///
  /// It's presented during [RPVisualConsentStep] when tapping on the "Learn more"
  /// button and during [RPConsentReviewStep] where each section's content is
  /// shown to the user.
  String? content;

  /// The data type sections that will be displayed if the consent section is of
  /// type UserDataCollection or PassiveDataCollection.
  List<RPDataTypeSection>? dataTypes;

  /// A custom illustration (an [Image] or [Icon] to show for Custom [RPConsentSectionType]
  @JsonKey(includeFromJson: false, includeToJson: false)
  Widget? customIllustration;

  /// Returns a populated object with the given [type].
  ///
  /// It is enough to provide only the [type] of the section, the title is
  /// automatically filled out. If a title is provided, that title is used instead.
  /// [summary] is set to [null] initially.
  ///
  /// If creating a custom section, a title must be provided.
  RPConsentSection(
      {required this.type,
      String? title,
      this.summary,
      this.content,
      this.dataTypes,
      this.customIllustration}) {
    assert(type != RPConsentSectionType.Custom || title != null,
        "If a you are creating a Custom ConsentSection, then a title must be provided.");
    this.title = (type == RPConsentSectionType.Custom)
        ? title!
        : (title != null)
            ? title
            : _titleForConsentSectionType(type);
  }

  @override
  Function get fromJsonFunction => _$RPConsentSectionFromJson;
  factory RPConsentSection.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPConsentSection;
  @override
  Map<String, dynamic> toJson() => _$RPConsentSectionToJson(this);
}

/// Enum containing the available types for [RPConsentSection].
///
/// Every type has a title and a logo associated to it.
/// Use [Custom] to create your own section type and avoid any pre-population
/// (title, logo, animation).
/// See more at: [http://researchkit.org/docs/Constants/ORKConsentSectionType.html]
enum RPConsentSectionType {
  Overview,
  DataGathering,
  Privacy,
  DataUse,
  TimeCommitment,
  Duration,
  StudyTasks,
  StudySurvey,
  Withdrawing,
  YourRights,
  Welcome,
  AboutUs,
  Goals,
  Benefits,
  DataHandling,
  Location,
  Health,
  UserDataCollection,
  PassiveDataCollection,
  Custom
}

String _titleForConsentSectionType(RPConsentSectionType type) {
  switch (type) {
    case RPConsentSectionType.Overview:
      return "Overview";
    case RPConsentSectionType.DataGathering:
      return "Data Gathering";
    case RPConsentSectionType.Privacy:
      return "Privacy";
    case RPConsentSectionType.DataUse:
      return "Data Use";
    case RPConsentSectionType.TimeCommitment:
      return "Time Commitment";
    case RPConsentSectionType.StudyTasks:
      return "Study Tasks";
    case RPConsentSectionType.StudySurvey:
      return "Study Survey";
    case RPConsentSectionType.Withdrawing:
      return "Withdrawing";
    case RPConsentSectionType.Welcome:
      return "Welcome";
    case RPConsentSectionType.AboutUs:
      return "About us";
    case RPConsentSectionType.Goals:
      return "Our goal";
    case RPConsentSectionType.Benefits:
      return "Benefits for you";
    case RPConsentSectionType.DataHandling:
      return "Data handling";
    case RPConsentSectionType.Duration:
      return "Study duration";
    case RPConsentSectionType.YourRights:
      return "Your rights";
    case RPConsentSectionType.Location:
      return "Location";
    case RPConsentSectionType.Health:
      return "Health";
    case RPConsentSectionType.UserDataCollection:
      return "Data collection from you";
    case RPConsentSectionType.PassiveDataCollection:
      return "Passive data collection";
    case RPConsentSectionType.Custom:
      return ''; // Case handled in the initialization.
  }
}
