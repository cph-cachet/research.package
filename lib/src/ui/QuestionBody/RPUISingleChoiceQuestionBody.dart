part of research_package_ui;

/// The UI representation of [RPChoiceAnswerFormat]. This UI part appears embedded in a [RPUIQuestionStep].
/// Depending on the [RPChoiceAnswerFormat]'s [ChoiceAnswerStyle] property, the user can select only one or multiple options.
class RPUIChoiceQuestionBody extends StatefulWidget {
  final RPChoiceAnswerFormat _answerFormat;

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
  List<int> selectedIndices;

  @override
  void initState() {
    selectedIndices = [];
    super.initState();
  }

  void _buttonCallBack(int index) {
    if (widget._answerFormat.answerStyle == ChoiceAnswerStyle.SingleChoice) {
      // Setting the state here is calling the build method so the check marks can be rendered.
      // Only one choice can be selected.
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices = [];
        selectedIndices.add(index);
      }
    }
    if (widget._answerFormat.answerStyle == ChoiceAnswerStyle.MultipleChoice) {
      // Setting the state here is calling the build method so the check marks can be rendered.
      // Multiple choice can be selected.
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    }

    selectedIndices.length != 0 ? blocQuestion.sendReadyToProceed(true) : blocQuestion.sendReadyToProceed(false);

    blocQuestion.sendResultValue(RPQuestionBodyResult(selectedIndices));
  }

  Widget _choiceCellBuilder(BuildContext context, int index) {
    return _ChoiceButton(
      choice: widget._answerFormat.choices[index],
      selectedCallBack: _buttonCallBack,
      selected: selectedIndices.contains(index) ? true : false,
      index: index,
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
  final RPChoice choice;
  final Function selectedCallBack;
  final bool selected;
  final int index;

  _ChoiceButton({this.choice, this.selectedCallBack, this.selected, this.index});

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
        padding: EdgeInsets.all(14),
        onPressed: () {
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
