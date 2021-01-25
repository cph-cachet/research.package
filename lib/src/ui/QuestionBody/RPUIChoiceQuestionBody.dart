part of research_package_ui;

/// The UI representation of [RPChoiceAnswerFormat]. This UI part appears embedded in a [RPUIQuestionStep].
/// Depending on the [RPChoiceAnswerFormat]'s [ChoiceAnswerStyle] property, the user can select only one or multiple options.
class RPUIChoiceQuestionBody extends StatefulWidget {
  final RPChoiceAnswerFormat _answerFormat;
  final Function(dynamic) onResultChange;

  RPUIChoiceQuestionBody(this._answerFormat, this.onResultChange);

  @override
  _RPUIChoiceQuestionBodyState createState() => _RPUIChoiceQuestionBodyState();
}

class _RPUIChoiceQuestionBodyState extends State<RPUIChoiceQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUIChoiceQuestionBody> {
  List<RPChoice> selectedChoices;

  @override
  void initState() {
    selectedChoices = [];
    super.initState();
  }

  void _buttonCallBack(RPChoice selectedChoice) {
    print('_buttonCallBack');
    if (widget._answerFormat.answerStyle == ChoiceAnswerStyle.SingleChoice) {
      // Setting the state here is calling the build method so the check marks can be rendered.
      // Only one choice can be selected.
      if (selectedChoices.contains(selectedChoice)) {
        setState(() {
          selectedChoices.remove(selectedChoice);
        });
      } else {
        setState(() {
          selectedChoices = [];
          selectedChoices.add(selectedChoice);
        });
      }
    }
    if (widget._answerFormat.answerStyle == ChoiceAnswerStyle.MultipleChoice) {
      // Setting the state here is calling the build method so the check marks can be rendered.
      // Multiple choice can be selected.
      if (selectedChoices.contains(selectedChoice)) {
        setState(() {
          selectedChoices.remove(selectedChoice);
        });
      } else {
        setState(() {
          selectedChoices.add(selectedChoice);
        });
      }
    }

    selectedChoices.length != 0 ? widget.onResultChange(selectedChoices) : widget.onResultChange(null);
    print(selectedChoices);
  }

  Widget _choiceCellBuilder(BuildContext context, int index) {
    return _ChoiceButton(
      choice: widget._answerFormat.choices[index],
      selectedCallBack: _buttonCallBack,
      selected: selectedChoices.contains(widget._answerFormat.choices[index]) ? true : false,
      currentChoices: selectedChoices,
      index: index,
      isLastChoice: index == widget._answerFormat.choices.length - 1,
      answerStyle: widget._answerFormat.answerStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RPLocalizations locale = RPLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget._answerFormat.answerStyle == ChoiceAnswerStyle.MultipleChoice
              ? (locale?.translate('(Choose one or more options)') ?? "(Choose one or more options)")
              : (locale?.translate('(Choose one option)') ?? "(Choose one option)")),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget._answerFormat.choices.length,
          itemBuilder: _choiceCellBuilder,
          physics: NeverScrollableScrollPhysics(),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _ChoiceButton extends StatefulWidget {
  final RPChoice choice;
  final Function selectedCallBack;
  final List<RPChoice> currentChoices;
  final bool selected;
  final bool isLastChoice;
  final int index;
  final ChoiceAnswerStyle answerStyle;

  _ChoiceButton(
      {this.choice,
      this.selectedCallBack,
      this.currentChoices,
      this.index,
      this.answerStyle,
      this.selected,
      this.isLastChoice});

  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<_ChoiceButton> {
  RPChoice choice;
  RPChoice grpChoice;
  // bool isSelected;

  @override
  void initState() {
    choice = widget.choice;
    // isSelected = widget.currentChoices.contains(choice);
    grpChoice = widget.selected ? choice : null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('---');
    // print(isSelected);
    print(widget.selected);
    print(grpChoice);
    print(widget.currentChoices);
    print('---');
    RPLocalizations locale = RPLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: InkWell(
        onTap: () => widget.selectedCallBack(choice),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            (widget.answerStyle == ChoiceAnswerStyle.SingleChoice)
                ? Radio(value: choice, groupValue: grpChoice, onChanged: null)
                : Checkbox(value: widget.selected, onChanged: null),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 13),
                decoration: !widget.isLastChoice
                    ? BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey)))
                    : null,
                child: widget.choice.isFreeText
                    ? Container(
                        child: TextField(
                          onChanged: (newText) => choice.text = newText,
                          decoration:
                              InputDecoration(hintText: RPLocalizations.of(context).translate("Other")),
                        ),
                      )
                    : Text(
                        locale?.translate(widget.choice.text) ?? widget.choice.text,
                        style:
                            // isSelected
                            //     ? RPStyles.choiceAnswerText.copyWith(fontWeight: FontWeight.w500)
                            //     :
                            RPStyles.choiceAnswerText,
                        softWrap: true,
                      ),
              ),
            ),
          ],
        ),
      ),
      // child: OutlineButton(
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(6))),
      //   padding: EdgeInsets.all(14),
      //   onPressed: () {
      //     widget.selectedCallBack(choice);
      //   },
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       Flexible(
      //         flex: 2,
      //         child: widget.choice.isFreeText
      //             ? Container(
      //                 child: TextField(
      //                   onChanged: (newText) => choice.text = newText,
      //                   decoration: InputDecoration(hintText: RPLocalizations.of(context).translate("Other")),
      //                 ),
      //               )
      //             : Text(
      //                 locale?.translate(widget.choice.text) ?? widget.choice.text,
      //                 style: widget.selected
      //                     ? RPStyles.choiceAnswerText.copyWith(fontWeight: FontWeight.w500)
      //                     : RPStyles.choiceAnswerText,
      //                 softWrap: true,
      //               ),
      //       ),
      //       Flexible(
      //         flex: 1,
      //         child: Icon(widget.selected ? Icons.check : null, color: Colors.black),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
