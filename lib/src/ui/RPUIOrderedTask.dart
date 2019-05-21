part of research_package_ui;

/// This class is the primary entry point for the presentation of the Research Package framework UI.
/// It presents the steps of an [RPOrderedTask] and then provides the [RPTaskResult] object.
class RPUIOrderedTask extends StatefulWidget {
  /// The task to present
  /// The [RPUIOrderedTask] presents its steps after each other and creates an [RPTaskResult] object with the same
  /// identifier as the [task]'s identifier.
  final RPOrderedTask task;

  /// The callback function which has to return an [RPTaskResult] object.
  /// This function is called when the participant has finished the last step.
  final void Function(RPTaskResult) onSubmit;

  RPUIOrderedTask({this.task, this.onSubmit});

  @override
  _RPUIOrderedTaskState createState() => _RPUIOrderedTaskState();
}

/*
  VERSION 2: Trigger navigation based on blocConsent stream
  Problem: I think because of the asynchronous stream the build method was called with wrong, not updated stepWidget, so we had the same step for multiple times.
*/

class _RPUIOrderedTaskState extends State<RPUIOrderedTask> with CanSaveResult {
  RPTaskResult taskResult;

  RPStep currentStep;
  RPStep stepToNavigate;
  int currentStepIndex = 1;

  StreamSubscription<StepStatus> stepStatusSubscription;
  StreamSubscription<RPStepResult> stepResultSubscription;

  @override
  initState() {
    // Instantiate the taskresult so it starts tracking time
    taskResult = RPTaskResult(widget.task.identifier);

    // Calculating the number of question steps because we only want to display their count
    var nrOfQuestionSteps = 0;
    widget.task.steps.forEach((step) {
      if (step.runtimeType == RPQuestionStep) {
        nrOfQuestionSteps++;
      }
    });

    // Sending the inital Task Progress so the Question UI can use it in the app bar
    blocTask.updateTaskProgress(RPTaskProgress(currentStepIndex, nrOfQuestionSteps));

    // Subscribe to step status changes so the navigation can be triggered
    stepStatusSubscription = blocTask.stepStatus.listen((data) {
      switch (data) {
        case StepStatus.Finished:
          // In case of last step we save the result and close the task
          if (currentStep == widget.task.steps.last) {
            //Creating and sending the task level of result to a stream to which anybody can subscribe
            createAndSendResult();
            Navigator.of(context).popUntil(ModalRoute.withName("/"));
            break;
          }
          // Updating taskProgress stream
          if (currentStep.runtimeType == RPQuestionStep) {
            blocTask.updateTaskProgress(RPTaskProgress(currentStepIndex, nrOfQuestionSteps));
          }

          // Calculating next step and then navigate there
          stepToNavigate = widget.task.getStepAfterStep(currentStep, null);
          currentStep = stepToNavigate;
          currentStepIndex++;
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
    stepResultSubscription = blocTask.stepResult.listen((stepResult) {
      // TODO: Figuring out how to decide the identifier for the result
      taskResult.setStepResultForIdentifier(stepResult.identifier, stepResult);
      print("This is the taskresult so far: ${taskResult.results}");
    });

    // Getting the first step
    currentStep = widget.task.getStepAfterStep(null, null);

    super.initState();
  }

  @override
  createAndSendResult() {
    // Populate the result object with value and end the time tracker (set endDate)
    taskResult.endDate = DateTime.now();
    widget.onSubmit(taskResult);
  }

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
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: RPStyles.cachetTheme,
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
    stepStatusSubscription.cancel();
    stepResultSubscription.cancel();
    super.dispose();
  }
}
