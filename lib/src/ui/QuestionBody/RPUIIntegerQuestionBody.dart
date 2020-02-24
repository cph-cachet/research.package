part of research_package_ui;

class RPUIIntegerQuestionBody extends StatefulWidget {
  final RPIntegerAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUIIntegerQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUIIntegerQuestionBodyState createState() =>
      _RPUIIntegerQuestionBodyState();
}

class _RPUIIntegerQuestionBodyState extends State<RPUIIntegerQuestionBody> with AutomaticKeepAliveClientMixin<RPUIIntegerQuestionBody> {
  TextEditingController _textEditingController;
  String _errorMessage;
  bool _valid;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _valid = true;
    super.initState();
  }

  _validate(String text, RPLocalizations locale) {
    int value;
    try {
      value = int.parse(text);
    } catch (error) {
      setState(() {
        _valid = false;
        _errorMessage = locale?.translate('Input a number') ?? "Input a number";
      });
      widget.onResultChange(null);
      return;
    }

    if (value >= widget.answerFormat.minValue &&
        value <= widget.answerFormat.maxValue) {
      setState(() {
        _valid = true;
      });
    } else {
      setState(() {
        _valid = false;
        _errorMessage =
            "${locale?.translate('Should be between') ?? 'Should be between'} ${widget.answerFormat.minValue} ${locale?.translate('and') ?? 'and'} ${widget.answerFormat.maxValue}";
      });
      widget.onResultChange(null);
      return;
    }
    widget.onResultChange(text);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RPLocalizations locale = RPLocalizations.of(context);
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: TextField(
          controller: _textEditingController,
//          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: locale?.translate('Tap to answer') ?? "Tap to answer",
            suffix: widget.answerFormat.suffix != null
                ? Text(locale?.translate(widget.answerFormat.suffix) ??
                    widget.answerFormat.suffix)
                : null,
            errorText: _valid ? null : _errorMessage,
          ),
          onChanged: (text) => _validate(text, locale),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
