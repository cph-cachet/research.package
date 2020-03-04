part of research_package_ui;

/// The UI representation of [RPCompletionStep]
///
/// Typically, you don’t need to instantiate a completion step widget directly. Instead, add a completion step to a task, and present the task with a task widget.
/// The task widget instantiates the step widget for the completion step.
class RPUICompletionStep extends StatefulWidget {
  final RPCompletionStep step;

  RPUICompletionStep({@required this.step});

  @override
  _RPUICompletionStepState createState() => _RPUICompletionStepState();
}

class _RPUICompletionStepState extends State<RPUICompletionStep>
    with SingleTickerProviderStateMixin {
  Animation<double> _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _scale = Tween(begin: 0.3, end: 1.1)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  locale?.translate(widget.step.title) ?? widget.step.title,
                  style: RPStyles.h2,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      locale?.translate(widget.step.text) ?? widget.step.text,
                      style: RPStyles.h3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            ScaleTransition(
              scale: _scale,
              child: Icon(
                Icons.check_circle,
                size: 120,
                color: Theme.of(context).accentColor,
              ),
            ),
            ButtonTheme(
              minWidth: 150,
              child: OutlineButton(
                color: Theme.of(context).accentColor,
                highlightedBorderColor: Theme.of(context).primaryColor,
                onPressed: () {
                  blocTask.sendStatus(StepStatus.Finished);
                },
                child: Text(RPLocalizations.of(context)?.translate('DONE') ??
                    "DONE"),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
