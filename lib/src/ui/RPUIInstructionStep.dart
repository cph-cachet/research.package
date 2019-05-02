part of research_package_ui;

class RPUIInstructionStep extends StatefulWidget {
  final RPInstructionStep step;

  RPUIInstructionStep({@required this.step});

  @override
  _RPUIInstructionStepState createState() => _RPUIInstructionStepState();
}

class _RPUIInstructionStepState extends State<RPUIInstructionStep> {
  void _pushDetailTextRoute() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return _DetailTextRoute(
            title: widget.step.title,
            content: widget.step.detailText,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: RPStyles.cachetTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.step.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    widget.step.text,
                    textAlign: TextAlign.left,
                    style: RPStyles.h3,
                  ),
                ),
                FlatButton(
                  textTheme: ButtonTextTheme.accent,
                  child: Text("Learn more..."), // TODO: Localization
                  onPressed: _pushDetailTextRoute,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.step.footnote,
                style: RPStyles.bodyText,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(
            onPressed: () => blocTask.sendStatus(StepStatus.Canceled),
            child: Text(
              "CANCEL",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          RaisedButton(
            color: RPStyles.cachetBlue,
            textColor: Colors.white,
            child: Text(
              "GET STARTED",
            ),
            onPressed: () => blocTask.sendStatus(StepStatus.Finished),
          ),
        ],
      ),
    );
  }
}

class _DetailTextRoute extends StatelessWidget {
  final String title;
  final String content;

  _DetailTextRoute({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: RPStyles.cachetTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
//        backgroundColor: RPStyles.cachetBlue,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Text(this.content),
        ),
      ),
    );
  }
}
