part of research_package_ui;

class RPUIDateTimeQuestionBody extends StatefulWidget {
  final RPDateTimeAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;
  CupertinoDatePickerMode mode;

  RPUIDateTimeQuestionBody(this.answerFormat, this.onResultChange) {
    mode = (answerFormat.dateTimeAnswerStyle == DateTimeAnswerStyle.Date)
        ? CupertinoDatePickerMode.date
        : (answerFormat.dateTimeAnswerStyle == DateTimeAnswerStyle.TimeOfDay)
            ? CupertinoDatePickerMode.time
            : CupertinoDatePickerMode.dateAndTime;
  }

  @override
  _RPUIDateTimeQuestionBodyState createState() =>
      _RPUIDateTimeQuestionBodyState();
}

class _RPUIDateTimeQuestionBodyState extends State<RPUIDateTimeQuestionBody> with AutomaticKeepAliveClientMixin<RPUIDateTimeQuestionBody> {
  String _errorMessage;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 170,
      padding: EdgeInsets.all(8),
      alignment: Alignment.topLeft,
      child: CupertinoDatePicker(
        mode: widget.mode,
        use24hFormat: MediaQuery.of(context).alwaysUse24HourFormat,
        initialDateTime: DateTime.now(),
        onDateTimeChanged: (DateTime dateTime) {
          widget.onResultChange(dateTime.toString());
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
