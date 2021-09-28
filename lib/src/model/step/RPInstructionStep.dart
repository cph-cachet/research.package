part of research_package_model;

/// A step which can be used to communicate instructions and other information
/// to the participants.
/// Usually it is used as the first step in a Task explaining the task.
@JsonSerializable(fieldRename: FieldRename.snake, includeIfNull: false)
class RPInstructionStep extends RPStep {
  /// The text which is shown in a new window by pressing the "Learn more" button.
  /// If `null`, no "Learn more" button is shown.
  String? detailText;

  /// Optional footnote to appear on the bottom of the screen
  String? footnote;

  /// The path of the image to show during the Instruction Step
  /// (e.g.: "assets/picture.png").
  ///
  /// Remember to add images to use as an asset to your `pubspec.yaml` file.
  ///
  /// If `null` nothing is shown.
  String? imagePath;

  RPInstructionStep(
      {required String identifier,
      String? text,
      required String title,
      this.detailText,
      this.footnote,
      this.imagePath})
      : super(identifier: identifier, title: title, text: text);

  /// The widget (UI representation) of the step
  @override
  Widget get stepWidget => RPUIInstructionStep(step: this);

  Function get fromJsonFunction => _$RPInstructionStepFromJson;
  factory RPInstructionStep.fromJson(Map<String, dynamic> json) =>
      FromJsonFactory().fromJson(json) as RPInstructionStep;
  Map<String, dynamic> toJson() => _$RPInstructionStepToJson(this);
}
