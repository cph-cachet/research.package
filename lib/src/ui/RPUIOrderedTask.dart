part of research_package_ui;

class RPUIOrderedTask extends StatefulWidget {
  final RPOrderedTask task;

  RPUIOrderedTask({this.task});

  @override
  _RPUIOrderedTaskState createState() => _RPUIOrderedTaskState();
}

///
/// VERSION 2: Trigger navigation based on blocConsent stream
/// Problem: I think because of the asynchronous stream the build method was called with wrong, not updated stepWidget, so we had the same step for multiple times.
///

class _RPUIOrderedTaskState extends State<RPUIOrderedTask> {
  RPTaskResult taskResult;
  RPStep currentStep;
  RPStep stepToNavigate;

//  List<Widget> stepWidgets = List<Widget>();
  int currentStepIndex = 1;
  StreamSubscription<StepStatus> stepStatusSubscription;

  void _pushStep(RPStep step) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return WillPopScope(
            child: step.stepWidget,
            onWillPop: () async => false,
          );
        },
        settings: RouteSettings(
          name: step.identifier,
        ),
      ),
    );
  }

  void _showCancelConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Discard results and quit?"),
          actions: <Widget>[
            FlatButton(
              child: Text("NO"),
              onPressed: () => Navigator.of(context).pop(), // Dismissing the pop-up
            ),
            FlatButton(
              child: Text("YES"),
              onPressed: () {
                // TODO: Do something with the result
                stepToNavigate = widget.task.steps.first;
                Navigator.of(context).popUntil(ModalRoute.withName("/"));

                //          Navigator.removeRouteBelow(context, )
//          Navigator.pushAndRemoveUntil(
//            context,
//            MaterialPageRoute(
//              builder: (BuildContext context) {
//                return stepToNavigate.stepWidget;
//              },
//            ),
//            (Route<dynamic> route) => false,
//          );
              },
            )
          ],
        );
      },
    );
  }

  @override
  initState() {
    super.initState();

    // Calculating the number of question steps because we only want to display their count
    var nrOfQuestionSteps = 0;
    widget.task.steps.forEach((step) {
      if (step.runtimeType == RPQuestionStep) {
        nrOfQuestionSteps++;
      }
    });
    // Making the stepcount available, so the steps can display the StepCount
    blocTask.updateStepCount(nrOfQuestionSteps);

    // Subscribe to step status changes so the navigation can be triggered
    stepStatusSubscription = blocTask.stepStatus.listen((data) {
      print('Data from stepstatus stream in RPUITask: $data');
      switch (data) {
        case StepStatus.Finished:
          // In case of last step we save the result and close the task
          if (currentStep == widget.task.steps.last) {
            //TODO: Save the task level of result
            Navigator.of(context).popUntil(ModalRoute.withName("/"));
            break;
          }
          // Updating counter via stream
          blocTask.updateCurrentStepIndex(currentStepIndex);
          // Calculating next step and then navigate there
          stepToNavigate = widget.task.getStepAfterStep(currentStep, null);
          currentStep = stepToNavigate;
          currentStepIndex++;
//          print('stepToNavigate:$stepToNavigate');
          _pushStep(stepToNavigate);
          break;
        case StepStatus.Canceled:
          _showCancelConfirmationDialog();
          break;
        case StepStatus.Back:
          print('back');
          break;
        case StepStatus.Ongoing:
          print('ongoing');
          break;
      }
    });

    //TODO: set up stream for sending/receiving the results
    currentStep = widget.task.getStepAfterStep(null, null);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: RPStyles.cachetTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => widget.task.steps.first.stepWidget,
      },
    );
//    return Theme(
//      data: RPStyles.cachetTheme,
//      child: widget.task.steps.first.stepWidget,
//    );
  }

  @override
  dispose() {
    super.dispose();
    stepStatusSubscription.cancel();
  }
}
