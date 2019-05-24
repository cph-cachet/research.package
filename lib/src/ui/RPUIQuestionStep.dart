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
  RPQuestionBodyResult<dynamic> currentQuestionBodyResult;
  bool readyToProceed;
  RPStepResult result;

  StreamSubscription<QuestionStatus> questionStatusSubscription;
  StreamSubscription<RPQuestionBodyResult> questionBodyResultSubscription;

  @override
  void initState() {
    // Instantiating the result object here to start the time counter (startDate)
    result = RPStepResult.withParams(widget.step);
//    questionType = widget.step.answerFormat.questionType;
    readyToProceed = false;

    questionStatusSubscription = blocQuestion.questionStatus.listen((status) {
      switch (status) {
        case QuestionStatus.Ready:
          {
            setState(() {
              readyToProceed = true;
            });
            break;
          }
        case QuestionStatus.NotReady:
          {
            setState(() {
              readyToProceed = false;
            });
            break;
          }
      }
    });

    // Maybe not the best solution. Now we are updating the current result every time the user taps on a choice button
    questionBodyResultSubscription = blocQuestion.resultValue.listen((questionBodyResult) {
      setState(() {
        currentQuestionBodyResult = questionBodyResult;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder<RPTaskProgress>(
          stream: blocTask.taskProgress,
          initialData: blocTask.lastProgressValue,
          builder: (context, snapshot) {
            return Text("${snapshot.data.current} of ${snapshot.data.total}");
          }
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                title(),
                widget.step.answerFormat.questionBody,
              ],
            ),
          ),
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
          color: RPStyles.cachetBlue,
          textColor: Colors.white,
          child: Text(
            "NEXT",
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

  //Render the title above the questionBody
  Widget title() {
    if (widget.step.title != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Text(
          widget.step.title,
          style: RPStyles.h2,
          textAlign: TextAlign.left,
        ),
      );
    }
    return null;
  }

  @override
  void createAndSendResult() {
    print("The last questionBody Result is: ${currentQuestionBodyResult.value}");
    // Populate the result object with value and end the time tracker (set endDate)
    result.setResult(currentQuestionBodyResult.value);
    blocTask.sendStepResult(result);
  }

  @override
  void dispose() {
    questionStatusSubscription.cancel();
    questionBodyResultSubscription.cancel();
    super.dispose();
  }
}
