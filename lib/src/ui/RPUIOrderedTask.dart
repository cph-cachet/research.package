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

class _RPUIOrderedTaskState extends State<RPUIOrderedTask> with CanSaveResult {
  RPTaskResult taskResult;
  List<Widget> stepWidgets = [];

  RPStep currentStep;
  int currentStepIndex = 0;
  int currentQuestionIndex = 1;

  StreamSubscription<StepStatus> stepStatusSubscription;
  StreamSubscription<RPStepResult> stepResultSubscription;

  bool consentTask = false;

  @override
  initState() {
    // Instantiate the taskresult so it starts tracking time
    taskResult = RPTaskResult.withParams(widget.task.identifier);

    // Calculating the number of question steps because we only want to display their count
    var nrOfQuestionSteps = 0;
    widget.task.steps.forEach((step) {
      stepWidgets.add(step.stepWidget);
      // If there's a Consent Review Step among the steps it means the task is a Consent Task
      if (step.runtimeType == RPConsentReviewStep) consentTask = true;
      // Counting the Question or FormStep items
      if (step is RPQuestionStep) nrOfQuestionSteps++;
    });

    // Sending the initial Task Progress so the Question UI can use it in the app bar
    blocTask.updateTaskProgress(RPTaskProgress(currentQuestionIndex, nrOfQuestionSteps));

    // Subscribe to step status changes so the navigation can be triggered
    stepStatusSubscription = blocTask.stepStatus.listen((data) {
      switch (data) {
        case StepStatus.Finished:
          // In case of last step we save the result and close the task
          if (currentStep == widget.task.steps.last) {
            //Creating and sending the task level of result to a stream to which anybody can subscribe
            createAndSendResult();
            if (widget.task.closeAfterFinished) {
              Navigator.of(context).pop();
            }
            break;
          }
          // Updating taskProgress stream
          if (currentStep.runtimeType == RPQuestionStep) {
            currentQuestionIndex++;
            blocTask.updateTaskProgress(RPTaskProgress(currentQuestionIndex, nrOfQuestionSteps));
          }

          // Calculating next step and then navigate there
          currentStep = widget.task.getStepAfterStep(currentStep, null);
          currentStepIndex++;
          taskPageViewController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.decelerate);
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
    stepResultSubscription = blocTask.stepResult.listen((stepResult) {
      taskResult.setStepResultForIdentifier(stepResult.identifier, stepResult);
//      print("This is the taskresult so far: ${taskResult.results}");
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

  void _showCancelConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
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
                // Popup dismiss
                Navigator.of(context).pop();
                // Exit the Ordered Task
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  PageController taskPageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
      child: PageView(
        children: stepWidgets,
        controller: taskPageViewController,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  dispose() {
    stepStatusSubscription.cancel();
    stepResultSubscription.cancel();
    super.dispose();
  }
}
