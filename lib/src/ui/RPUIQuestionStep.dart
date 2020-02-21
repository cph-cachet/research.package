part of research_package_ui;

/// The UI representation of the [RPQuestionStep]. This widget is the container, the concrete content depends on the input step's [RPAnswerFormat].
///
/// As soon as the participant has finished with the question the [RPStepResult] is being added to the [RPTaskResult]'s result list.
class RPUIQuestionStep extends StatefulWidget {
  final RPQuestionStep step;

  RPUIQuestionStep(this.step);

  @override
  _RPUIQuestionStepState createState() => _RPUIQuestionStepState();
}

class _RPUIQuestionStepState extends State<RPUIQuestionStep> with CanSaveResult {
  // Dynamic because we don't know what value the RPChoice will have
  dynamic _currentQuestionBodyResult;
  bool readyToProceed;
  RPStepResult result;
  RPTaskProgress recentTaskProgress;

  set currentQuestionBodyResult(dynamic currentQuestionBodyResult) {
    this._currentQuestionBodyResult = currentQuestionBodyResult;
    if (this._currentQuestionBodyResult != null) {
      setState(() {
        readyToProceed = true;
      });
    } else {
      setState(() {
        readyToProceed = false;
      });
    }
  }

  skipQuestion() {
    blocTask.sendStatus(StepStatus.Finished);
    this.currentQuestionBodyResult = null;
    createAndSendResult();
  }

  @override
  void initState() {
    // Instantiating the result object here to start the time counter (startDate)
    result = RPStepResult.withParams(widget.step);
    readyToProceed = false;
    recentTaskProgress = blocTask.lastProgressValue;

    super.initState();
  }

  // Returning the according step body widget based on the answerFormat of the step
  Widget stepBody(RPAnswerFormat answerFormat) {
    switch (answerFormat.runtimeType) {
      case RPIntegerAnswerFormat:
        return RPUIIntegerQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPChoiceAnswerFormat:
        return RPUIChoiceQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPSliderAnswerFormat:
        return RPUISliderQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPImageChoiceAnswerFormat:
        return RPUIImageChoiceQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPDateTimeAnswerFormat:
        return RPUIDateTimeQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPBooleanAnswerFormat:
        return RPUIBooleanQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(recentTaskProgress != null ? "${recentTaskProgress.current} of ${recentTaskProgress.total}" : ""),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              onPressed: () => blocTask.sendStatus(StepStatus.Canceled),
              icon: Icon(
                Icons.cancel,
                color: Theme.of(context).accentColor,
              ),
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.all(8),
          children: [
            Title(widget.step.title),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: stepBody(widget.step.answerFormat),
                ),
              ),
            ),
            widget.step.optional
                ? FlatButton(
                    onPressed: () => skipQuestion(),
                    child: Text("Skip this question"),
                  )
                : Container(),
          ],
        ),
        persistentFooterButtons: <Widget>[
//        FlatButton(
//          onPressed: () => blocTask.sendStatus(StepStatus.Canceled),
//          child: Text(
//            "CANCEL",
//            style: TextStyle(color: Colors.redAccent),
//          ),
//        ),
          FlatButton(
            onPressed: () => blocTask.sendStatus(StepStatus.Back),
            child: Text(
              "BACK",
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Text(
              "NEXT",
            ),
            onPressed: readyToProceed
                ? () {
                    // Communicating with the RPUITask Widget
              // TODO: These two statements are shifted. Might cause problems
                    createAndSendResult();
                    blocTask.sendStatus(StepStatus.Finished);
                  }
                : null,
          ),
        ],
//      ),
    );
  }

//  // Render the title above the questionBody
//  Widget title() {
//    if (widget.step.title != null) {
//      return Padding(
//        padding: const EdgeInsets.only(bottom: 24, left: 8, right: 8, top: 8),
//        child: Text(
//          widget.step.title,
//          style: RPStyles.h2,
//          textAlign: TextAlign.left,
//        ),
//      );
//    }
//    return null;
//  }

  @override
  void createAndSendResult() {
    // Populate the result object with value and end the time tracker (set endDate)
    result.setResult(_currentQuestionBodyResult);
    blocTask.sendStepResult(result);
  }
}

// Render the title above the questionBody
class Title extends StatelessWidget {
  final String title;
  Title(this.title);

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 8, right: 8, top: 8),
        child: Text(
          title,
          style: RPStyles.h2,
          textAlign: TextAlign.left,
        ),
      );
    }
    return Container();
  }
}

