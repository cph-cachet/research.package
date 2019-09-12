part of research_package_ui;

class RPUIIntegerQuestionBody extends StatefulWidget {
//  final RPQuestionStep step;
//  final RPStepResult result;
//  final RPIntegerAnswerFormat answerFormat;
//
//  RPUIIntegerQuestionBody(this.step, this.result, this.answerFormat);

  final RPIntegerAnswerFormat _answerFormat;

  RPUIIntegerQuestionBody(this._answerFormat);

  @override
  _RPUIIntegerQuestionBodyState createState() => _RPUIIntegerQuestionBodyState();
}

class _RPUIIntegerQuestionBodyState extends State<RPUIIntegerQuestionBody> {
  TextEditingController _textEditingController;
  String _errorMessage;
  bool _valid;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    _valid = true;
    super.initState();
  }

  _validate(String text) {
    print(text);

    int value;
    try {
      value = int.parse(text);
    } catch (error) {
      setState(() {
        _valid = false;
        _errorMessage = "Input a number";
      });
      blocQuestion.sendReadyToProceed(false);
      return;
    }

    if (value >= widget._answerFormat.minValue && value <= widget._answerFormat.maxValue) {
      setState(() {
        _valid = true;
      });
    } else {
      setState(() {
        _valid = false;
        _errorMessage = "Should be between ${widget._answerFormat.minValue} and ${widget._answerFormat.maxValue}";
      });
      blocQuestion.sendReadyToProceed(false);
      return;
    }
    blocQuestion.sendReadyToProceed(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.topLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: TextField(
          controller: _textEditingController,
//          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: "Tap to answer", // TODO: Localization
            suffix: widget._answerFormat.suffix != null ? Text(widget._answerFormat.suffix) : null,
            errorText: _valid ? null : _errorMessage,
          ),
          onChanged: (text) => _validate(text),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
