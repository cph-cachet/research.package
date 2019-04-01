part of research_package_ui;

class RPUIQuestionStep extends StatefulWidget {
  RPQuestionStep step;

  RPUIQuestionStep(this.step);

  @override
  _RPUIQuestionStepState createState() => _RPUIQuestionStepState();
}

class _RPUIQuestionStepState extends State<RPUIQuestionStep> with CanSaveResult {
//  QuestionType questionType;
  int stepCount;
  int currentStepIndex;
  RPQuestionBodyResult currentQuestionBodyResult;
  bool readyToProceed;
  RPStepResult result;

  StreamSubscription<int> stepCountSubscription;
  StreamSubscription<int> currentStepIndexSubscription;
  StreamSubscription<QuestionStatus> questionStatusSubscription;
  StreamSubscription<RPQuestionBodyResult> questionBodyResultSubscription;

  @override
  void initState() {
    // Instantiating the result object here to start the time counter (startDate)
    result = RPStepResult(widget.step);
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

    stepCountSubscription = blocTask.stepCount.listen((count) {
      setState(() {
        stepCount = count;
      });
    });

    currentStepIndexSubscription = blocTask.currentStepIndex.listen((index) {
      currentStepIndex = index;
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
    return Theme(
      data: RPStyles.cachetTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("$currentStepIndex of $stepCount"),
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
                children: <Widget>[
                  _title(),
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
      ),
    );
  }

  //Render the title above the questionBody
  Widget _title() {
    if (widget.step.title != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24),
        child: Text(
          widget.step.title,
          style: RPStyles.H2,
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
    stepCountSubscription.cancel();
    currentStepIndexSubscription.cancel();
    questionStatusSubscription.cancel();
    questionBodyResultSubscription.cancel();
    super.dispose();
  }
}
