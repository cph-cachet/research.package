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
  StreamSubscription<int> stepCountSubscription;
  StreamSubscription<int> currentStepIndexSubscription;

  @override
  void initState() {
    super.initState();

    stepCountSubscription = blocTask.stepCount.listen((count) {
      setState(() {
        stepCount = count;
      });
    });

    currentStepIndexSubscription = blocTask.currentStepIndex.listen((index) {
//      setState(() {
      currentStepIndex = index;
//      });
    });

    questionType = widget.step.answerFormat.questionType;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: RPStyles.cachetTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("$currentStepIndex/$stepCount"),
          automaticallyImplyLeading: false,
        ),
        body: Container(
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              Text(widget.step.title),
              Text(
                "Question Body",
                style: RPStyles.H1,
              ),
            ],
          ),
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(
            onPressed: () => blocTask.changeStatus(StepStatus.Canceled),
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
            onPressed: () => blocTask.changeStatus(StepStatus.Finished),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    stepCountSubscription.cancel();
    currentStepIndexSubscription.cancel();
    super.dispose();
  }
}
