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
  late List<RPChoice> selectedChoices;

  @override
  void initState() {
    super.initState();
    selectedChoices = [];
  }

  void _buttonCallBack(RPChoice selectedChoice) {
    if (widget._answerFormat.answerStyle == RPChoiceAnswerStyle.SingleChoice) {
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
    if (widget._answerFormat.answerStyle ==
        RPChoiceAnswerStyle.MultipleChoice) {
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

    selectedChoices.length != 0
        ? widget.onResultChange(selectedChoices)
        : widget.onResultChange(null);
  }

  Widget _choiceCellBuilder(BuildContext context, int index) {
    return _ChoiceButton(
      choice: widget._answerFormat.choices[index],
      selectedCallBack: _buttonCallBack,
      selected: selectedChoices.contains(widget._answerFormat.choices[index])
          ? true
          : false,
      currentChoices: selectedChoices,
      index: index,
      isLastChoice: index == widget._answerFormat.choices.length - 1,
      answerStyle: widget._answerFormat.answerStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RPLocalizations? locale = RPLocalizations.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text((widget._answerFormat.answerStyle ==
                    RPChoiceAnswerStyle.MultipleChoice)
                ? "(${locale?.translate('choose_one_or_more_options')})"
                : "(${locale?.translate('choose_one_option')})")),
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
  final RPChoiceAnswerStyle answerStyle;

  _ChoiceButton(
      {required this.choice,
      required this.selectedCallBack,
      required this.currentChoices,
      required this.index,
      required this.answerStyle,
      required this.selected,
      required this.isLastChoice});

  @override
  _ChoiceButtonState createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<_ChoiceButton> {
  RPChoice? grpChoice;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    grpChoice = widget.selected ? widget.choice : null;
    RPLocalizations? locale = RPLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 4, right: 4),
      child: InkWell(
        onTap: () => widget.selectedCallBack(widget.choice),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          (widget.answerStyle == RPChoiceAnswerStyle.SingleChoice)
              ? Radio(
                  value: widget.choice,
                  groupValue: grpChoice,
                  onChanged: (x) => widget.selectedCallBack(widget.choice),
                  activeColor: Theme.of(context).primaryColor)
              : Checkbox(
                  value: widget.selected,
                  onChanged: (x) => widget.selectedCallBack(widget.choice),
                  activeColor: Theme.of(context).primaryColor,
                ),
          Expanded(
            child: Container(
              padding:
                  widget.choice.isFreeText ? null : EdgeInsets.only(bottom: 13),
              decoration: !widget.isLastChoice
                  ? BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: Theme.of(context).dividerColor),
                      ),
                    )
                  : null,
              child: widget.choice.isFreeText
                  ? Container(
                      child: TextField(
                        onChanged: (newText) => widget.choice.text = newText,
                        decoration: InputDecoration(
                          hintText: locale?.translate(widget.choice.text) ??
                              widget.choice.text,
                        ),
                      ),
                    )
                  : Text(
                      locale?.translate(widget.choice.text) ??
                          widget.choice.text,
                      style: Theme.of(context).textTheme.bodyText2,
                      softWrap: true,
                    ),
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
