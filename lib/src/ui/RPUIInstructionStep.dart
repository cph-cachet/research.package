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
      return Image.asset(
        widget.step.imagePath,
        width: MediaQuery.of(context).size.width / 2,
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.step.title),
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
                    widget.step.text,
                    textAlign: TextAlign.left,
                    style: RPStyles.h3,
                  ),
                ),
                widget.step.detailText != null
                    ? FlatButton(
                        textTheme: ButtonTextTheme.accent,
                        child: Text("Learn more..."), // TODO: Localization
                        onPressed: _pushDetailTextRoute,
                      )
                    : Container(),
              ],
            ),
            widget.step.footnote != null
                ? Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
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
            "CANCEL",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        RaisedButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          child: Text(
            "GET STARTED",
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
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(this.content),
      ),
    );
  }
}
