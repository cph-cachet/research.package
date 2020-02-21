part of research_package_ui;

/// The UI representation of [RPInstructionStep]
///
/// In general, you don’t need to instantiate an instruction step widget directly.
/// Instead, add an instruction step to a task and present the task using a task widget.
/// When appropriate, the task widget instantiates the step widget for the step.
class RPUIInstructionStep extends StatefulWidget {
  final RPInstructionStep step;

  RPUIInstructionStep({@required this.step}) {
    assert(this.step.text != null,
        "No text provided for Instruction Step. Use the .text setter of RPStep class to add some.");
  }

  @override
  _RPUIInstructionStepState createState() => _RPUIInstructionStepState();
}

class _RPUIInstructionStepState extends State<RPUIInstructionStep> {
  _pushDetailTextRoute() {
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

  Widget _buildImage() {
    if (widget.step.imagePath != null) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(
          widget.step.imagePath,
          width: MediaQuery.of(context).size.width / 2,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale?.translate(widget.step.title) ?? widget.step.title),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // If image is provided show it
            _buildImage(),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    locale?.translate(widget.step.text) ?? widget.step.text,
                    textAlign: TextAlign.left,
                    style: RPStyles.h3,
                  ),
                ),
                widget.step.detailText != null
                    ? FlatButton(
                        textTheme: ButtonTextTheme.accent,
                        child: Text(locale?.translate('Learn more...') ??
                            "Learn more..."),
                        onPressed: _pushDetailTextRoute,
                      )
                    : Container(),
              ],
            ),
            widget.step.footnote != null
                ? Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      locale?.translate(widget.step.footnote) ??
                          widget.step.footnote,
                      style: RPStyles.bodyText,
                      textAlign: TextAlign.left,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          onPressed: () => blocTask.sendStatus(StepStatus.Canceled),
          child: Text(
            locale?.translate('CANCEL') ?? "CANCEL",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        RaisedButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          child: Text(
            locale?.translate('GET STARTED') ?? "GET STARTED",
          ),
          onPressed: () => blocTask.sendStatus(StepStatus.Finished),
        ),
      ],
    );
  }
}

class _DetailTextRoute extends StatelessWidget {
  final String title;
  final String content;

  _DetailTextRoute({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale?.translate(this.title) ?? this.title),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(locale?.translate(this.content) ?? this.content),
      ),
    );
  }
}
