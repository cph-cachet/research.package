part of research_package_ui;

class RPUIChoiceQuestionBody extends StatefulWidget {
  RPChoiceAnswerFormat _answerFormat;
  RPQuestionStep _step;
  List<RPChoice> _choices;
  RPStepResult _result;

  RPUIChoiceQuestionBody(this._answerFormat);

//  RPUIChoiceQuestionBody(RPQuestionStep step, RPStepResult stepResult) {
//    this._step = step;
//    this._result = stepResult == null ? RPStepResult(step) : stepResult;
//    this._answerFormat = step.answerFormat;
//    this._choices = _answerFormat.choices;
//
//    //TODO: Restore result (implemented in ResearchStack)
//  }

  @override
  _RPUIChoiceQuestionBodyState createState() => _RPUIChoiceQuestionBodyState();
}

class _RPUIChoiceQuestionBodyState extends State<RPUIChoiceQuestionBody> {
  int selectedIndex;

  @override
  void initState() {
    selectedIndex = null;
    super.initState();
  }

  void _buttonCallBack(int index) {
    // Setting the state here is calling the build method so the checkmarks can be rendered.
    // Only one choice can be selected.
    if (selectedIndex == index) {
      setState(() {
        selectedIndex = null;
      });
    } else {
      setState(() {
        selectedIndex = index;
      });
    }

    selectedIndex != null
        ? blocQuestion.sendStatus(QuestionStatus.Ready)
        : blocQuestion.sendStatus(QuestionStatus.NotReady);
  }

  Widget _choiceCellBuilder(BuildContext context, int index) {
    return _ChoiceButton(
      widget._answerFormat.choices[index],
      _buttonCallBack,
      selectedIndex == index ? true : false,
      index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget._answerFormat.choices.length,
      itemBuilder: _choiceCellBuilder,
      physics: NeverScrollableScrollPhysics(),
    );
  }
}

class _ChoiceButton extends StatefulWidget {
  RPChoice choice;
  Function selectedCallBack;
  bool selected;
  int index;

  _ChoiceButton(this.choice, this.selectedCallBack, this.selected, this.index);

  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<_ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlineButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
        splashColor: RPStyles.cachetBlue,
        padding: EdgeInsets.all(14),
        onPressed: () {
          blocQuestion.sendResultValue(RPQuestionBodyResult(widget.choice.value));
          widget.selectedCallBack(widget.index);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.choice.text,
              style: widget.selected
                  ? RPStyles.choiceAnswerText.copyWith(fontWeight: FontWeight.w500)
                  : RPStyles.choiceAnswerText,
            ),
            Icon(widget.selected ? Icons.check : null, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
