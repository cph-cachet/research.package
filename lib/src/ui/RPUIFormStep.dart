part of research_package_ui;

class RPUIFormStep extends StatefulWidget {
  final RPFormStep formStep;

  RPUIFormStep(this.formStep);

  @override
  _RPUIFormStepState createState() => _RPUIFormStepState();
}

class _RPUIFormStepState extends State<RPUIFormStep> {
  bool readyToProceed;
  RPTaskProgress recentTaskProgress;

  @override
  void initState() {
    readyToProceed = false;
    recentTaskProgress = blocTask.lastProgressValue;

    super.initState();
  }

  Widget formItemBuilder(context, index) {
    if (index == 0) {
      return title();
    }
    index -= 1;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.formStep.steps[index].answerFormat.questionBody,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${recentTaskProgress.current} of ${recentTaskProgress.total}"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: formItemBuilder,
          itemCount: widget.formStep.steps.length + 1,
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
        StreamBuilder<bool>( // TODO: Make button enabled checking
          stream: blocQuestion.questionReadyToProceed,
          initialData: true, // TODO: false
          builder: (context, snapshot) {
            return RaisedButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              child: Text(
                "NEXT",
              ),
              onPressed: snapshot.data
                  ? () {
                      // Communicating with the RPUITask Widget
                      blocTask.sendStatus(StepStatus.Finished);
//                createAndSendResult();
                    }
                  : null,
            );
          },
        ),
      ],
    );
  }

  //Render the title above the questionBody
  Widget title() {
    if (widget.formStep.title != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 8, right: 8, top: 8),
        child: Text(
          widget.formStep.title,
          style: RPStyles.h2,
          textAlign: TextAlign.left,
        ),
      );
    }
    return null;
  }
}
