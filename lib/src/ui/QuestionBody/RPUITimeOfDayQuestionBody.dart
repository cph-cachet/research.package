part of research_package_ui;

class RPUITimeOfDayQuestionBody extends StatefulWidget {
  final RPTimeOfDayAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;

  RPUITimeOfDayQuestionBody(this.answerFormat, this.onResultChange);

  @override
  _RPUITimeOfDayQuestionBodyState createState() =>
      _RPUITimeOfDayQuestionBodyState();
}

class _RPUITimeOfDayQuestionBodyState extends State<RPUITimeOfDayQuestionBody> {
  String _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      padding: EdgeInsets.all(8),
      alignment: Alignment.topLeft,
      child: CupertinoDatePicker(
        mode: CupertinoDatePickerMode.time,
        use24hFormat: true,
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (DateTime dateTime) {
          print(dateTime.toString());
          widget.onResultChange(dateTime.toString());
        },
      ),
    );
  }
}
