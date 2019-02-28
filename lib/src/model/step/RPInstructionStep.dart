part of research_package_model;

class RPInstructionStep extends RPStep {
  String _detailText;
  String _footnote;
  Image _image;

  RPInstructionStep(String identifier, String title, String text, this._detailText, [this._footnote, this._image])
      : super.withTitle(identifier, title);

  @override
  Widget get stepWidget => RPUIInstructionStep(
        title: title,
        detailText: _detailText,
        text: text,
        footnote: _footnote,
        image: _image,
      );
}
