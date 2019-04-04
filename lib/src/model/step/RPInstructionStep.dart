part of research_package_model;

class RPInstructionStep extends RPStep {
  String detailText;
  String footnote;
  Image image;

  RPInstructionStep({String identifier, String title, this.detailText, this.footnote, this.image})
      : super.withTitle(identifier, title);

  @override
  Widget get stepWidget => RPUIInstructionStep(step: this);
}
