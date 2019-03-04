part of research_package_ui;

class RPUIInstructionStep extends StatefulWidget {
  String title;
  String detailText;
  String footnote;
  String text;
  Image image;

  RPUIInstructionStep({
    @required this.title,
    @required this.text,
    this.detailText,
    this.footnote,
    this.image,
  });

  @override
  _RPUIInstructionStepState createState() => _RPUIInstructionStepState();
}

class _RPUIInstructionStepState extends State<RPUIInstructionStep> {
  void _pushDetailTextRoute() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return DetailTextRoute(
            title: widget.title,
            content: widget.detailText,
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
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    widget.text,
                    textAlign: TextAlign.center,
                    style: RPStyles.H2,
                  ),
                ),
                FlatButton(
                  textTheme: ButtonTextTheme.accent,
                  child: Text("Learn more..."),
                  onPressed: _pushDetailTextRoute,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.footnote,
                style: RPStyles.bodyText,
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(
            onPressed: () => blocConsent.changeStatus(StepStatus.Canceled),
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
            onPressed: () => blocConsent.changeStatus(StepStatus.Finished),
          ),
        ],
      ),
    );
  }
}

class DetailTextRoute extends StatelessWidget {
  final String title;
  final String content;

  DetailTextRoute({this.title, this.content});

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
