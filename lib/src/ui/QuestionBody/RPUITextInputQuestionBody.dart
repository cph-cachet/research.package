part of research_package_ui;

class RPUITextInputQuestionBody extends StatefulWidget {
  final RPTextAnswerFormat answerFormat;
  final void Function(dynamic) onResultChange;

  const RPUITextInputQuestionBody(
    this.answerFormat,
    this.onResultChange, {
    super.key,
  });

  @override
  RPUITextInputQuestionBodyState createState() =>
      RPUITextInputQuestionBodyState();
}

class RPUITextInputQuestionBodyState extends State<RPUITextInputQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUITextInputQuestionBody> {
  final TextEditingController _controller = TextEditingController();

  void checkInput(String input) {
    if (input.isNotEmpty) {
      widget.onResultChange(input);
    } else {
      widget.onResultChange(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);

    super.build(context);
    return TextField(
      maxLines: 10,
      onChanged: checkInput,
      decoration: InputDecoration(
        hintText: (widget.answerFormat.hintText != null)
            ? (locale?.translate(widget.answerFormat.hintText!) ??
                widget.answerFormat.hintText)
            : widget.answerFormat.hintText,
        border: const OutlineInputBorder(),
      ),
      controller: _controller,
    );
  }

  @override
  bool get wantKeepAlive => true;
}
