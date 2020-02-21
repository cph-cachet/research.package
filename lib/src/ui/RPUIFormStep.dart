part of research_package_ui;

class RPUIFormStep extends StatefulWidget {
  final RPFormStep formStep;

  RPUIFormStep(this.formStep);

  @override
  _RPUIFormStepState createState() => _RPUIFormStepState();
}

class _RPUIFormStepState extends State<RPUIFormStep> {
  bool readyToProceed;
  RPStepResult stepResult;
  RPTaskProgress recentTaskProgress;

  // Since the QuestionBody's are sending null if they are not answered yet we can loop through the
  // results of the steps.
  // If any of them is null it means the participant can not proceed to the next step because not all the
  // questions are answered.
  void checkReadyToProceed() {
    bool temp = true;
    stepResult.results.values.forEach((result) {
      if ((result as RPStepResult).results[RPStepResult.DEFAULT_KEY] == null) {
        temp = false;
      }
    });
    setState(() {
      readyToProceed = temp;
    });
  }

  @override
  void initState() {
    // Instantiating the result object here to start the time counter (startDate)
    stepResult = RPStepResult.withParams(widget.formStep);

    // Filling up the results with nulls
    widget.formStep.steps.forEach((item) {
      stepResult.setResultForIdentifier(
          item.identifier, RPStepResult.withParams(item));
    });

    readyToProceed = false;
    recentTaskProgress = blocTask.lastProgressValue;

    super.initState();
  }

  // Returning the according step body widget based on the answerFormat of each step
  Widget stepBody(String id, RPAnswerFormat answerFormat) {
    switch (answerFormat.runtimeType) {
      case RPIntegerAnswerFormat:
        return RPUIIntegerQuestionBody(answerFormat, (result) {
          (stepResult.results[id] as RPStepResult).setResult(result);
          checkReadyToProceed();
        });
      case RPChoiceAnswerFormat:
        return RPUIChoiceQuestionBody(answerFormat, (result) {
          (stepResult.results[id] as RPStepResult).setResult(result);
          checkReadyToProceed();
        });
      default:
        return Container();
    }
  }

  Widget formItemBuilder(context, index) {
    if (index == 0) {
      return (widget.formStep.title != null)
          ? Padding(
              padding:
                  const EdgeInsets.only(bottom: 24, left: 8, right: 8, top: 8),
              child: Text(
                RPLocalizations.of(context)?.translate(widget.formStep.title) ??
                    widget.formStep.title,
                style: RPStyles.h2,
                textAlign: TextAlign.left,
              ),
            )
          : null;
    }
    index -= 1;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              RPLocalizations.of(context)
                      ?.translate(widget.formStep.steps[index].title) ??
                  widget.formStep.steps[index].title,
              style: RPStyles.h3,
            ),
          ),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: stepBody(
                widget.formStep.steps[index].identifier,
                widget.formStep.steps[index].answerFormat,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "${recentTaskProgress.current} ${locale?.translate('of') ?? "of"} ${recentTaskProgress.total}"),
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
            locale?.translate('cancel') ?? "CANCEL",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        RaisedButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          child: Text(
            locale?.translate('next') ?? "NEXT",
          ),
          onPressed: readyToProceed
              ? () {
                  // Communicating with the RPUITask Widget
                  blocTask.sendStatus(StepStatus.Finished);
                  createAndSendResult();
                }
              : null,
        ),
      ],
    );
  }

  @override
  void createAndSendResult() {
    // In this case the result is already created, the only needed thing left is to send it
    blocTask.sendStepResult(stepResult);
  }
}
