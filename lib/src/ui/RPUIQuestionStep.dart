part of research_package_ui;

class RPUIQuestionStep extends StatefulWidget {
  RPQuestionStep step;

  RPUIQuestionStep(this.step);

  @override
  _RPUIQuestionStepState createState() => _RPUIQuestionStepState();
}

class _RPUIQuestionStepState extends State<RPUIQuestionStep> {
  QuestionType questionType;
  int stepCount;
  int currentStepIndex;
  bool readyToProceed;

  StreamSubscription<int> stepCountSubscription;
  StreamSubscription<int> currentStepIndexSubscription;
  StreamSubscription<QuestionStatus> questionStatusSubscription;

  @override
  void initState() {
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

    questionType = widget.step.answerFormat.questionType;
    readyToProceed = false;

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
                  widget.step.answerFormat.stepBody,
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
            onPressed: () {
              readyToProceed ? () => blocTask.sendStatus(StepStatus.Finished) : null;

            },
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
  void dispose() {
    stepCountSubscription.cancel();
    currentStepIndexSubscription.cancel();
    questionStatusSubscription.cancel();
    super.dispose();
  }
}
