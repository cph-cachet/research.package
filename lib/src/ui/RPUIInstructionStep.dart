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
  @override
  void initState() {
    blocQuestion.sendReadyToProceed(true);
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // If image is provided show it
          InstructionImage(widget.step.imagePath),
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  locale?.translate(widget.step.text) ?? widget.step.text,
                  textAlign: TextAlign.left,
                  style: RPStyles.instructionText,
                ),
              ),
              widget.step.detailText != null
                  ? FlatButton(
                      textTheme: ButtonTextTheme.accent,
                      child: Text(locale?.translate('Learn more...') ?? "Learn more..."),
                      onPressed: _pushDetailTextRoute,
                    )
                  : Container(),
            ],
          ),
          widget.step.footnote != null
              ? Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    locale?.translate(widget.step.footnote) ?? widget.step.footnote,
                    style: RPStyles.bodyText,
                    textAlign: TextAlign.left,
                  ),
                )
              : Container(),
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

class InstructionImage extends StatelessWidget {
  final String _imagePath;

  InstructionImage(this._imagePath);

  @override
  Widget build(BuildContext context) {
    if (_imagePath != null) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Image.asset(
          _imagePath,
          width: MediaQuery.of(context).size.width / 2,
        ),
      );
    } else {
      return Container();
    }
  }
}
