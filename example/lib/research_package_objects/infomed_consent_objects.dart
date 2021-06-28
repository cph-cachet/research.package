import 'package:research_package/model.dart';

RPConsentSection overviewSection = RPConsentSection(
    type: RPConsentSectionType.Overview)
  ..summary = "Welcome to this survey"
  ..content =
      "Overview dolor sit amet, consectetur adipiscing elit. Aenean a mi porttitor, bibendum elit elementum, placerat augue. Quisque eu sollicitudin tortor, sed egestas ante. Sed convallis, mauris quis malesuada convallis, lectus ante vestibulum ante, vel lobortis magna dui eu nisl. Proin ac pellentesque nulla. Morbi facilisis dui aliquam quam pulvinar efficitur. Duis at lorem vitae leo pharetra ultricies. Proin viverra eleifend varius. Nulla sed nisi ut enim placerat venenatis. Maecenas imperdiet accumsan ligula id varius. Donec rhoncus gravida odio vitae convallis.Nullam at tempor erat. Praesent euismod orci nec sollicitudin placerat. Nunc nec nibh efficitur, mattis ante sit amet, scelerisque libero. Aliquam et mollis erat. Pellentesque aliquam convallis turpis sit amet molestie. Duis accumsan venenatis imperdiet. Integer quis est non elit varius mattis. Donec hendrerit in nisl eget sollicitudin. Nulla sapien lacus, mattis non orci sed, commodo tincidunt risus.";

RPConsentSection dataGatheringSection = RPConsentSection(
    type: RPConsentSectionType.DataGathering)
  ..summary = "This is a summary for Data Gathering."
  ..content =
      "Data Gathering dolor sit amet, consectetur adipiscing elit. Aenean a mi porttitor, bibendum elit elementum, placerat augue. Quisque eu sollicitudin tortor, sed egestas ante. Sed convallis, mauris quis malesuada convallis, lectus ante vestibulum ante, vel lobortis magna dui eu nisl. Proin ac pellentesque nulla. Morbi facilisis dui aliquam quam pulvinar efficitur. Duis at lorem vitae leo pharetra ultricies. Proin viverra eleifend varius. Nulla sed nisi ut enim placerat venenatis. Maecenas imperdiet accumsan ligula id varius. Donec rhoncus gravida odio vitae convallis.Nullam at tempor erat. Praesent euismod orci nec sollicitudin placerat. Nunc nec nibh efficitur, mattis ante sit amet, scelerisque libero. Aliquam et mollis erat. Pellentesque aliquam convallis turpis sit amet molestie. Duis accumsan venenatis imperdiet. Integer quis est non elit varius mattis. Donec hendrerit in nisl eget sollicitudin. Nulla sapien lacus, mattis non orci sed, commodo tincidunt risus.";

RPConsentSection privacySection = RPConsentSection(type: RPConsentSectionType.Privacy)
  ..summary = "This is a summary for Privacy."
  ..content =
      "Privacy dolor sit amet, consectetur adipiscing elit. Aenean a mi porttitor, bibendum elit elementum, placerat augue. Quisque eu sollicitudin tortor, sed egestas ante. Sed convallis, mauris quis malesuada convallis, lectus ante vestibulum ante, vel lobortis magna dui eu nisl. Proin ac pellentesque nulla. Morbi facilisis dui aliquam quam pulvinar efficitur. Duis at lorem vitae leo pharetra ultricies. Proin viverra eleifend varius. Nulla sed nisi ut enim placerat venenatis. Maecenas imperdiet accumsan ligula id varius. Donec rhoncus gravida odio vitae convallis.Nullam at tempor erat. Praesent euismod orci nec sollicitudin placerat. Nunc nec nibh efficitur, mattis ante sit amet, scelerisque libero. Aliquam et mollis erat. Pellentesque aliquam convallis turpis sit amet molestie. Duis accumsan venenatis imperdiet. Integer quis est non elit varius mattis. Donec hendrerit in nisl eget sollicitudin. Nulla sapien lacus, mattis non orci sed, commodo tincidunt risus.";

RPConsentSection timeCommitmentSection = RPConsentSection(
    type: RPConsentSectionType.TimeCommitment)
  ..summary = "This is a summary for Time Commitment."
  ..content =
      "Time commitment dolor sit amet, consectetur adipiscing elit. Aenean a mi porttitor, bibendum elit elementum, placerat augue. Quisque eu sollicitudin tortor, sed egestas ante. Sed convallis, mauris quis malesuada convallis, lectus ante vestibulum ante, vel lobortis magna dui eu nisl. Proin ac pellentesque nulla. Morbi facilisis dui aliquam quam pulvinar efficitur. Duis at lorem vitae leo pharetra ultricies. Proin viverra eleifend varius. Nulla sed nisi ut enim placerat venenatis. Maecenas imperdiet accumsan ligula id varius. Donec rhoncus gravida odio vitae convallis.Nullam at tempor erat. Praesent euismod orci nec sollicitudin placerat. Nunc nec nibh efficitur, mattis ante sit amet, scelerisque libero. Aliquam et mollis erat. Pellentesque aliquam convallis turpis sit amet molestie. Duis accumsan venenatis imperdiet. Integer quis est non elit varius mattis. Donec hendrerit in nisl eget sollicitudin. Nulla sapien lacus, mattis non orci sed, commodo tincidunt risus.";

RPConsentSection aboutUs = RPConsentSection(type: RPConsentSectionType.AboutUs)
  ..summary = "This is a summary for About Us."
  ..content =
      "About Us dolor sit amet, consectetur adipiscing elit. Aenean a mi porttitor, bibendum elit elementum, placerat augue. Quisque eu sollicitudin tortor, sed egestas ante. Sed convallis, mauris quis malesuada convallis, lectus ante vestibulum ante, vel lobortis magna dui eu nisl. Proin ac pellentesque nulla. Morbi facilisis dui aliquam quam pulvinar efficitur. Duis at lorem vitae leo pharetra ultricies. Proin viverra eleifend varius. Nulla sed nisi ut enim placerat venenatis. Maecenas imperdiet accumsan ligula id varius. Donec rhoncus gravida odio vitae convallis.Nullam at tempor erat. Praesent euismod orci nec sollicitudin placerat. Nunc nec nibh efficitur, mattis ante sit amet, scelerisque libero. Aliquam et mollis erat. Pellentesque aliquam convallis turpis sit amet molestie. Duis accumsan venenatis imperdiet. Integer quis est non elit varius mattis. Donec hendrerit in nisl eget sollicitudin. Nulla sapien lacus, mattis non orci sed, commodo tincidunt risus.";

RPConsentSection userDataCollection = RPConsentSection(
    type: RPConsentSectionType.UserDataCollection)
  ..summary =
      "This study will ask you to provide the information about the following categories:"
  ..dataTypes = [
    RPDataTypeSection("Alcohol",
        "You have to input some info about alcohol in the alcohol card  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ut aliquet augue, sed maximus sapien. Cras non sem vulputate, tincidunt est in, euismod orci. Aenean elit nisl, convallis vel lacus eget, pellentesque laoreet nunc."),
    RPDataTypeSection(
        "Mood", "You have to input some info about your mood in the mood card"),
    RPDataTypeSection("Weight",
        "You have to input some info about your weight in the weight card"),
    RPDataTypeSection("Medications",
        "You have to input some info about your medications in the medications card"),
    RPDataTypeSection("Smoking",
        "You have to input some info about your smoking in the smoking card"),
  ];

RPConsentSection passiveDataCollection = RPConsentSection(
    type: RPConsentSectionType.PassiveDataCollection)
  ..summary =
      "This study will passively collect data about the following categories:"
  ..dataTypes = [
    RPDataTypeSection(
        "Steps", "Your daily step counts as collected by the phone."),
    RPDataTypeSection("Activity",
        "Your different types of activities as detected by the phone"),
    RPDataTypeSection("Location", "Your location as you move around"),
    RPDataTypeSection(
        "Noise", "Background noise as detected by the phone's microphone"),
  ];

RPConsentSignature signature = RPConsentSignature(identifier: "consentSignatureID");

RPConsentDocument consentDocument = RPConsentDocument('Informed Consent', [
  overviewSection,
  aboutUs,
  dataGatheringSection,
  privacySection,
  timeCommitmentSection,
  userDataCollection,
  passiveDataCollection
])
  ..addSignature(signature);

RPConsentReviewStep consentReviewStep =
    RPConsentReviewStep(identifier: "consentreviewstepID", consentDocument: consentDocument)
      ..reasonForConsent = 'informed_consent.agree_text'
      ..text = 'informed_consent.agree_confirm';

RPVisualConsentStep consentVisualStep =
    RPVisualConsentStep("visualStep", consentDocument);

RPInstructionStep instructionStep = RPInstructionStep(
  "instructionID",
  title: "Welcome!",
  detailText:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultricies feugiat turpis nec efficitur. Integer in pharetra libero. Proin a leo eu enim porttitor hendrerit. Suspendisse vestibulum interdum mollis. Donec in sapien ut orci ultricies laoreet. Ut maximus ante id arcu feugiat scelerisque. Proin non rutrum libero. Aliquam blandit arcu ac dolor consequat maximus. Integer et dolor quis quam tempor porta quis vel nibh. Phasellus ullamcorper fringilla lorem, ac tempus sem cursus a. Aliquam maximus facilisis quam. Morbi hendrerit tempor tellus, ac hendrerit augue tincidunt eu. Cras convallis lorem at nulla mattis tristique.",
  footnote: "(1) Important footnote",
  imagePath: "assets/images/waving-hand.png",
)..text = "informed_consent.welcome_text";

RPCompletionStep completionStep = RPCompletionStep(identifier: "completionID", title: "informed_consent.thanks")
  ..text = "informed_consent.document_saved";

RPOrderedTask consentTask = RPOrderedTask(
  identifier: "consentTaskID",
  steps: [instructionStep, consentVisualStep, consentReviewStep, completionStep],
);
