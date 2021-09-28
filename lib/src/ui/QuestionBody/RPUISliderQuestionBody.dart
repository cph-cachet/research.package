part of research_package_ui;

class RPUISliderQuestionBody extends StatefulWidget {
  final RPSliderAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUISliderQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUISliderQuestionBodyState createState() => _RPUISliderQuestionBodyState();
}

class _RPUISliderQuestionBodyState extends State<RPUISliderQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUISliderQuestionBody> {
  double? value;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    RPLocalizations? locale = RPLocalizations.of(context);
    String text = "";
    // prefix
    text += (widget.answerFormat.prefix != null)
        ? (locale?.translate(widget.answerFormat.prefix!) ??
            widget.answerFormat.prefix!)
        : "";
    // value
    text += (value ?? widget.answerFormat.minValue).toString();
    // suffix
    text += (widget.answerFormat.suffix != null)
        ? (locale?.translate(widget.answerFormat.suffix!) ??
            widget.answerFormat.suffix!)
        : "";
    return Card(
      child: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              activeColor: Theme.of(context).sliderTheme.activeTrackColor,
              inactiveColor: Theme.of(context).sliderTheme.inactiveTrackColor,
              value: value ?? widget.answerFormat.minValue,
              onChanged: (double newValue) {
                setState(() {
                  value = newValue;
                });
                widget.onResultChange(value);
              },
              min: widget.answerFormat.minValue,
              max: widget.answerFormat.maxValue,
              divisions: widget.answerFormat.divisions,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
