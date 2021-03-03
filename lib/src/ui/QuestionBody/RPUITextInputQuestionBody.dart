part of research_package_ui;

class RPUITextInputQuestionBody extends StatefulWidget {
  final RPDateTimeAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUITextInputQuestionBody(this.answerFormat, this.onResultChange) {}

  @override
  _RPUITextInputQuestionBodyState createState() => _RPUITextInputQuestionBodyState();
}

class _RPUITextInputQuestionBodyState extends State<RPUITextInputQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUITextInputQuestionBody> {
  String _errorMessage;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: TextField(
        controller: _controller,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
