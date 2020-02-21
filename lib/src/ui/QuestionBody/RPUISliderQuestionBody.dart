part of research_package_ui;

class RPUISliderQuestionBody extends StatefulWidget {
  final RPSliderAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUISliderQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUISliderQuestionBodyState createState() => _RPUISliderQuestionBodyState();
}

class _RPUISliderQuestionBodyState extends State<RPUISliderQuestionBody> {
  double value;

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            Text(
              '${locale?.translate(widget.answerFormat.prefix) ?? widget.answerFormat.prefix}${value ?? widget.answerFormat.minValue}${locale?.translate(widget.answerFormat.suffix) ?? widget.answerFormat.suffix}',
              style: TextStyle(fontSize: 18),
            ),
            Slider(
              value: value ?? widget.answerFormat.minValue,
              onChanged: (double newValue) {
                value = newValue;
                widget.onResultChange(value);
              },
              min: widget.answerFormat.minValue,
              max: widget.answerFormat.maxValue,
              divisions: widget.answerFormat.divisions,
            ),
          ],
        ));
  }
}
