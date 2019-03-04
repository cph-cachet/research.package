part of research_package_model;

class RPInstructionStep extends RPStep {
  String detailText;
  String footnote;
  Image image;

  RPInstructionStep({String identifier, String title, String text, this.detailText, this.footnote, this.image})
      : super.withTitle(identifier, title);

  @override
  Widget get stepWidget => RPUIInstructionStep(
        title: title,
        detailText: detailText,
        text: text,
        footnote: footnote,
        image: image,
      );
}
