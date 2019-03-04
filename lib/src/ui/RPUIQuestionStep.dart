part of research_package_ui;

class RPUIQuestionStep extends StatefulWidget {
  @override
  _RPUIQuestionStepState createState() => _RPUIQuestionStepState();
}

class _RPUIQuestionStepState extends State<RPUIQuestionStep> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: RPStyles.cachetTheme,
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: Colors.purple,
        ),
      ),
    );
  }
}
