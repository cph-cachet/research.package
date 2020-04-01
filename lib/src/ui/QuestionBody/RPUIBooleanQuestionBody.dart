part of research_package_ui;

class RPUIBooleanQuestionBody extends StatefulWidget {
  final RPBooleanAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUIBooleanQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUIBooleanQuestionBodyState createState() =>
      _RPUIBooleanQuestionBodyState();
}

class _RPUIBooleanQuestionBodyState extends State<RPUIBooleanQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUIBooleanQuestionBody> {
  bool _selectedValue;

  void _buttonCallBack(bool value) {
    setState(() {
      _selectedValue = value;
    });

    widget.onResultChange(_selectedValue);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.all(8),
      alignment: Alignment.topLeft,
      child: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _BooleanButton(
            value: true,
            text: widget.answerFormat.trueText,
            selectedCallBack: _buttonCallBack,
            selected: _selectedValue == true ? true : false,
          ),
          _BooleanButton(
            value: false,
            text: widget.answerFormat.falseText,
            selectedCallBack: _buttonCallBack,
            selected: _selectedValue == false ? true : false,
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _BooleanButton extends StatefulWidget {
  final String text;
  final bool value;
  final Function selectedCallBack;
  final bool selected;

  _BooleanButton({this.text, this.value, this.selectedCallBack, this.selected});

  @override
  _BooleanButtonState createState() => _BooleanButtonState();
}

class _BooleanButtonState extends State<_BooleanButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: OutlineButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        padding: EdgeInsets.all(14),
        onPressed: () {
          widget.selectedCallBack(widget.value);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              RPLocalizations.of(context)?.translate(widget.text) ??
                  widget.text,
              style: widget.selected
                  ? RPStyles.choiceAnswerText
                      .copyWith(fontWeight: FontWeight.w500)
                  : RPStyles.choiceAnswerText,
            ),
            Icon(widget.selected ? Icons.check : null, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
