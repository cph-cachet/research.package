part of research_package_ui;

class RPUIIntegerQuestionBody extends StatefulWidget {
  RPQuestionStep step;
  RPStepResult<int> result;
  RPIntegerAnswerFormat answerFormat;

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