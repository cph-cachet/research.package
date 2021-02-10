part of research_package_ui;

class RPUIBooleanQuestionBody extends StatefulWidget {
  final RPBooleanAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUIBooleanQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUIBooleanQuestionBodyState createState() => _RPUIBooleanQuestionBodyState();
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
            selectedVal: _selectedValue,
          ),
          _BooleanButton(
            value: false,
            text: widget.answerFormat.falseText,
            selectedCallBack: _buttonCallBack,
            selectedVal: _selectedValue,
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
  final bool selectedVal;

  _BooleanButton({this.text, this.value, this.selectedCallBack, this.selectedVal});

  @override
  _BooleanButtonState createState() => _BooleanButtonState();
}

class _BooleanButtonState extends State<_BooleanButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4),
      child: InkWell(
        onTap: () => widget.selectedCallBack(widget.value),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Radio(
              value: widget.value,
              groupValue: widget.selectedVal,
              onChanged: (x) => widget.selectedCallBack(widget.value),
              activeColor: Theme.of(context).primaryColor,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(bottom: 13),
                decoration: !widget.value == false
                    ? BoxDecoration(border: Border(bottom: BorderSide(color: Theme.of(context).dividerColor)))
                    : null,
                child: Text(
                  RPLocalizations.of(context)?.translate(widget.text) ?? widget.text,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
