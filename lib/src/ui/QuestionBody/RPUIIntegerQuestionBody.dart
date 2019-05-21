part of research_package_ui;

class RPUIIntegerQuestionBody extends StatefulWidget {
  final RPQuestionStep step;
  final RPStepResult<int> result;
  final RPIntegerAnswerFormat answerFormat;

  RPUIIntegerQuestionBody(this.step, this.result, this.answerFormat);

  @override
  _RPUIIntegerQuestionBodyState createState() => _RPUIIntegerQuestionBodyState();
}

class _RPUIIntegerQuestionBodyState extends State<RPUIIntegerQuestionBody> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
