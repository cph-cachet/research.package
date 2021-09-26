part of research_package_ui;

class RPUITextInputQuestionBody extends StatefulWidget {
  final RPTextAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUITextInputQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUITextInputQuestionBodyState createState() =>
      _RPUITextInputQuestionBodyState();
}

class _RPUITextInputQuestionBodyState extends State<RPUITextInputQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUITextInputQuestionBody> {
  TextEditingController _controller = TextEditingController();

  void checkInput(String input) {
    if (input.length != 0) {
      widget.onResultChange(input);
    } else {
      widget.onResultChange(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);

    super.build(context);
    return Container(
      child: TextField(
        maxLines: 10,
        onChanged: checkInput,
        decoration: InputDecoration(
          hintText: (widget.answerFormat.hintText != null)
              ? (locale?.translate(widget.answerFormat.hintText!) ??
                  widget.answerFormat.hintText)
              : widget.answerFormat.hintText,
          border: OutlineInputBorder(),
        ),
        controller: _controller,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
