part of '../../ui.dart';

/// The UI representation of [RPInstructionStep]
///
/// In general, you don’t need to instantiate an instruction step widget directly.
/// Instead, add an instruction step to a task and present the task using a task widget.
/// When appropriate, the task widget instantiates the step widget for the step.
class RPUIInstructionStep extends StatefulWidget {
  final RPInstructionStep step;

  const RPUIInstructionStep({super.key, required this.step});

  @override
  RPUIInstructionStepState createState() => RPUIInstructionStepState();
}

class RPUIInstructionStepState extends State<RPUIInstructionStep> {
  @override
  void initState() {
    blocQuestion.sendReadyToProceed(true);
    super.initState();
  }

  void _pushDetailTextRoute() {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
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
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: InstructionImage(widget.step.imagePath!),
                ),
              ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  child: Text(
                    locale?.translate(widget.step.text!) ?? widget.step.text!,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                widget.step.detailText != null
                    ? TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(
                            color: (CupertinoTheme.of(context).primaryColor ==
                                    CupertinoColors.activeBlue)
                                ? Theme.of(context).primaryColor
                                : CupertinoTheme.of(context).primaryColor,
                          ),
                        ),
                        onPressed: _pushDetailTextRoute,
                        child: Text(
                            locale?.translate('learn_more') ?? "Learn more..."),
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
                      style: Theme.of(context).textTheme.bodySmall,
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

  const _DetailTextRoute({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 3),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(locale?.translate('learn_more') ?? 'Learn more',
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      locale?.translate(content) ?? content,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InstructionImage extends StatelessWidget {
  final String _imagePath;

  const InstructionImage(this._imagePath, {super.key});

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
  const InstructionText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    if (text.contains('</')) {
      return HTML.toRichText(context, text);
    } else {
      return Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
        textAlign: TextAlign.start,
      );
    }
  }
}
