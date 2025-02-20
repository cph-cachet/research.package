part of '../../../model.dart';

/// A content section in a [RPConsentDocument].
///
/// It represents one section in a [RPConsentDocument].
@JsonSerializable(includeIfNull: false, explicitToJson: true)
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
  String summary;

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

  /// Create a new [RPConsentSection] of a given [type].
  ///
  /// It is enough to provide the [type] and [summary] of the section.
  /// If a [title] is not provided, a default title is used, unless the type is
  /// [RPConsentSectionType.Custom]. In that case, the title must be provided.
  RPConsentSection(
      {required this.type,
      String? title,
      required this.summary,
      this.content,
      this.dataTypes,
      this.customIllustration}) {
    assert(type != RPConsentSectionType.Custom || title != null,
        "If a you are creating a Custom ConsentSection, then a title must be provided.");
    this.title = (type == RPConsentSectionType.Custom)
        ? title!
        : (title != null)
            ? title
            : "title.${type.name.toLowerCase()}";
  }

  @override
  Function get fromJsonFunction => _$RPConsentSectionFromJson;
  factory RPConsentSection.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson<RPConsentSection>(json);
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
  HealthDataCollection,
  UserDataCollection,
  PassiveDataCollection,
  Custom
}
