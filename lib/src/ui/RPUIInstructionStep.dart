part of research_package_ui;

/// The UI representation of [RPInstructionStep]
///
/// In general, you don’t need to instantiate an instruction step widget directly.
/// Instead, add an instruction step to a task and present the task using a task widget.
/// When appropriate, the task widget instantiates the step widget for the step.
class RPUIInstructionStep extends StatefulWidget {
  final RPInstructionStep step;

  RPUIInstructionStep({required this.step});

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
            content: widget.step.detailText!,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // If image is provided show it
            if (widget.step.imagePath != null)
              Center(
                child: InstructionImage(widget.step.imagePath!),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    locale?.translate(widget.step.text!) ?? widget.step.text!,
                    textAlign: TextAlign.left,
                  ),
                ),
                widget.step.detailText != null
                    ? TextButton(
                        style: TextButton.styleFrom(
                            textStyle: TextStyle(
                                color: Theme.of(context).primaryColor)),
                        child: Text(
                            locale?.translate('learn_more') ?? "Learn more..."),
                        onPressed: _pushDetailTextRoute,
                      )
                    : Container(),
              ],
            ),
            widget.step.footnote != null
                ? Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      locale?.translate(widget.step.footnote!) ??
                          widget.step.footnote!,
                      style:
                          Theme.of(context).textTheme.caption, // TODO: change?
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

  _DetailTextRoute({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale?.translate('learn_more') ?? 'Learn more'),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Text(locale?.translate(this.content) ?? this.content,
            style: Theme.of(context).textTheme.bodyText1),
      ),
    );
  }
}

class InstructionImage extends StatelessWidget {
  final String _imagePath;

  InstructionImage(this._imagePath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(
        _imagePath,
        width: MediaQuery.of(context).size.width / 2,
      ),
    );
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
