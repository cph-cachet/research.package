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
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // If image is provided show it
            Center(
              child: InstructionImage(widget.step.imagePath),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (widget.step.text != null)
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: InstructionText(
                          locale?.translate(widget.step.text) ??
                              widget.step.text)),
                if (widget.step.detailText != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: OutlinedButton.icon(
                      icon: Icon(Icons.help),
                      label: Text(
                        locale?.translate('Learn more...') ?? 'Learn more...',
                      ),
                      onPressed: _pushDetailTextRoute,
                    ),
                  ),
              ],
            ),
            widget.step.footnote != null
                ? Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      locale?.translate(widget.step.footnote) ??
                          widget.step.footnote,
                      style: Theme.of(context).textTheme.caption,
                      textAlign: TextAlign.start,
                    ),
                  )
                : Container(),
          ],
        ),
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
        title: Text(locale?.translate('Learn more') ?? 'Learn more'),
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

// Render the title above the questionBody
class InstructionText extends StatelessWidget {
  final String text;
  InstructionText(this.text);

  @override
  Widget build(BuildContext context) {
    if (text.contains('</')) {
      return HTML.toRichText(context, text);
    } else {
      return Text(
        text,
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.start,
      );
    }
  }
}
