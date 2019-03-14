part of research_package_ui;

class RPUIChoiceQuestionBody extends StatefulWidget {
  final RPChoiceAnswerFormat _answerFormat;
  RPUIChoiceQuestionBody(this._answerFormat);

  @override
  _RPUIChoiceQuestionBodyState createState() => _RPUIChoiceQuestionBodyState();
}

class _RPUIChoiceQuestionBodyState extends State<RPUIChoiceQuestionBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget._answerFormat.choices.length,
        itemBuilder: _choiceCellBuilder
    );
  }

  Widget _choiceCellBuilder(BuildContext context, int index) {
    return Container(
      child: Text(widget._answerFormat.choices[index].text),
      color: Colors.grey,
    );
  }

}
