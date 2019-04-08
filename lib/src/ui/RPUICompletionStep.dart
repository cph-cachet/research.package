part of research_package_ui;

class RPUICompletionStep extends StatefulWidget {
  final RPCompletionStep step;

  RPUICompletionStep({@required this.step});

  @override
  _RPUICompletionStepState createState() => _RPUICompletionStepState();
}

class _RPUICompletionStepState extends State<RPUICompletionStep> with SingleTickerProviderStateMixin {
  Animation<double> _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 350));
    _scale = Tween(begin: 0.3, end: 1.1).chain(CurveTween(curve: Curves.easeInOut)).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: RPStyles.cachetTheme,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    widget.step.title,
                    style: RPStyles.H2,
                  ),
                  Text(
                    widget.step.text,
                    style: RPStyles.H3,
                  ),
                ],
              ),
              ScaleTransition(
                scale: _scale,
                child: Icon(
                  Icons.check_circle,
                  size: 120,
                  color: RPStyles.cachetBlue,
                ),
              ),
              ButtonTheme(
                minWidth: 150,
                child: OutlineButton(
                  splashColor: RPStyles.cachetBlue,
                  color: RPStyles.cachetBlue,
                  onPressed: () {
                    blocTask.sendStatus(StepStatus.Finished);
                  },
                  child: Text("DONE"), //TODO: Localization
                ),
              )
            ],
          ),
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
