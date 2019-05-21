part of research_package_model;

/// A step which can be used to communicate instructions to the participants
/// Usually it is used as the first step in a Task.
class RPInstructionStep extends RPStep {
  String _detailText;
  String _footnote;
  Image _image;

  RPInstructionStep({String identifier, String title, String detailText, String footnote, Image image}): super.withTitle(identifier, title){
    this._detailText = detailText;
    this._footnote = footnote;
    this._image = image;
  }

  /// The text which is shown in a new window by pressing the "Learn more" button
  String get detailText => this._detailText;

  /// Optional footnote to appear on the bottom of the screen
  String get footnote => this._footnote;

  /// The image to show during the Instruction Step. If ```null``` nothing is shown.
  Image get image => this._image;

  set detailText(String detailText) {
    this._detailText = detailText;
  }

  set footnote(String footnote) {
    this._footnote = footnote;
  }

  set image(Image image) {
    this._image = image;
  }

  /// The widget (UI representation) of the step
  @override
  Widget get stepWidget => RPUIInstructionStep(step: this);
}
