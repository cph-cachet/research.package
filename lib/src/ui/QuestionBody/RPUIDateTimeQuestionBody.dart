part of research_package_ui;

// ignore: must_be_immutable
class RPUIDateTimeQuestionBody extends StatefulWidget {
  final RPDateTimeAnswerFormat answerFormat;
  final Function(dynamic) onResultChange;
  late final CupertinoDatePickerMode mode;

  RPUIDateTimeQuestionBody(this.answerFormat, this.onResultChange) {
    mode = (answerFormat.dateTimeAnswerStyle == RPDateTimeAnswerStyle.Date)
        ? CupertinoDatePickerMode.date
        : (answerFormat.dateTimeAnswerStyle == RPDateTimeAnswerStyle.TimeOfDay)
            ? CupertinoDatePickerMode.time
            : CupertinoDatePickerMode.dateAndTime;
  }

  @override
  _RPUIDateTimeQuestionBodyState createState() =>
      _RPUIDateTimeQuestionBodyState();
}

class _RPUIDateTimeQuestionBodyState extends State<RPUIDateTimeQuestionBody>
    with AutomaticKeepAliveClientMixin<RPUIDateTimeQuestionBody> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      alignment: Alignment.topLeft,
      // TODO: Rendering bug in Flutter - https://github.com/flutter/flutter/issues/50193
      child: CupertinoTheme(
        data: CupertinoThemeData(
          brightness: Theme.of(context).brightness,
        ),
        child: CupertinoDatePicker(
          mode: widget.mode,
          use24hFormat: MediaQuery.of(context).alwaysUse24HourFormat,
          initialDateTime: DateTime.now(),
          onDateTimeChanged: (DateTime dateTime) {
            widget.onResultChange(dateTime.toString());
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
