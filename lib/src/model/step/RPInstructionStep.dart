part of research_package_model;

/// A step which can be used to communicate instructions and other information to the participants.
/// Usually it is used as the first step in a Task explaining the task.
class RPInstructionStep extends RPStep {
  String _detailText;
  String _footnote;
  String _imagePath;

  RPInstructionStep({String identifier, String title, String detailText, String footnote, String imagePath})
      : super.withTitle(identifier, title) {
    this._detailText = detailText;
    this._footnote = footnote;
    this._imagePath = imagePath;
  }

  /// The text which is shown in a new window by pressing the "Learn more" button. If ```null```, no "Learn more" button is shown.
  String get detailText => this._detailText;

  /// Optional footnote to appear on the bottom of the screen
  String get footnote => this._footnote;

  /// The path of the image to show during the Instruction Step (e.g.: "assets/picture.png"). If ```null``` nothing is shown.
  String get imagePath => this._imagePath;

  set detailText(String detailText) {
    this._detailText = detailText;
  }

  set footnote(String footnote) {
    this._footnote = footnote;
  }

  set imagePath(String imagePath) {
    this._imagePath = imagePath;
  }

  /// The widget (UI representation) of the step
  @override
  Widget get stepWidget => RPUIInstructionStep(step: this);
}
