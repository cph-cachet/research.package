part of research_package_ui;

/// This class is the primary entry point for the presentation of the Research Package framework UI.
/// It presents the steps of an [RPOrderedTask] (either navigable or just linear) and then provides the [RPTaskResult] object.
class RPUITask extends StatefulWidget {
  /// The task to present
  /// The [RPUITask] presents its steps after each other and creates an [RPTaskResult] object with the same
  /// identifier as the [task]'s identifier.
  final RPOrderedTask task;

  /// The callback function which has to return an [RPTaskResult] object.
  /// This function is called when the participant has finished the last step.
  final void Function(RPTaskResult) onSubmit;

  RPUITask({this.task, this.onSubmit});

  @override
  _RPUITaskState createState() => _RPUITaskState();
}

class _RPUITaskState extends State<RPUITask> with CanSaveResult {
  RPTaskResult taskResult;
  List<Widget> stepWidgets = [];

  RPStep previousStep;
  RPStep currentStep;
  int currentStepIndex = 0;
  int currentQuestionIndex = 1;

  StreamSubscription<StepStatus> stepStatusSubscription;
  StreamSubscription<RPStepResult> stepResultSubscription;

  bool navigableTask = false;

  @override
  initState() {
    // Instantiate the taskresult so it starts tracking time
    taskResult = RPTaskResult.withParams(widget.task.identifier);

    // If it's navigable we don't want to show result on appbar
    if (widget.task.runtimeType == RPNavigableOrderedTask) {
      blocTask.updateTaskProgress(null);
      navigableTask = true;
    } else {
      // Sending the initial Task Progress so the Question UI can use it in the app bar
      blocTask.updateTaskProgress(RPTaskProgress(currentQuestionIndex, widget.task.numberOfQuestionSteps));
    }

    // Subscribe to step status changes so the navigation can be triggered
    stepStatusSubscription = blocTask.stepStatus.listen((data) async {
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
            // TODO: calculate the stepprogress differently for navigableTask
            if (!navigableTask)
              blocTask.updateTaskProgress(RPTaskProgress(currentQuestionIndex, widget.task.numberOfQuestionSteps));
          }

          // Calculating next step and then navigate there
          previousStep = currentStep;
          currentStep = widget.task.getStepAfterStep(currentStep, null);
          setState(() {
            stepWidgets.add(currentStep.stepWidget);
          });
          currentStepIndex++;

          taskPageViewController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          break;
        case StepStatus.Canceled:
          _showCancelConfirmationDialog();
          break;
        case StepStatus.Back:
          // TODO
          if (stepWidgets.length == 1) {
            break;
          }
          if (currentStep == widget.task.steps.first) {
            break;
          } else {
            currentQuestionIndex--;
            // TODO: calculate the stepprogress differently for navigableTask
            if (!navigableTask)
              blocTask.updateTaskProgress(RPTaskProgress(currentQuestionIndex, widget.task.numberOfQuestionSteps));
            // await because we can only update the stepWidgets list while the current step is out of the screen
            await taskPageViewController.previousPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);

            setState(() {
              stepWidgets.removeLast();
            });
            currentStep = previousStep;
          }
          break;
        case StepStatus.Ongoing:
          print('ongoing');
          break;
      }
    });
    stepResultSubscription = blocTask.stepResult.listen((stepResult) {
      taskResult.setStepResultForIdentifier(stepResult.identifier, stepResult);
      blocTask.updateTaskResult(taskResult);
    });

    // Getting the first step
    currentStep = widget.task.getStepAfterStep(null, null);
    setState(() {
      stepWidgets.add(currentStep.stepWidget);
    });

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
          title: Text(widget.task.isConsentTask ? RPLocalizations.of(context)?.translate('Cancel?') ?? "Cancel?" : RPLocalizations.of(context)?.translate('Discard results and quit?') ?? "Discard results and quit?"), // TODO: Localization
          actions: <Widget>[
            FlatButton(
              child: Text(RPLocalizations.of(context)?.translate('NO') ?? "NO"),
              onPressed: () => Navigator.of(context).pop(), // Dismissing the pop-up
            ),
            FlatButton(
              child: Text(RPLocalizations.of(context)?.translate('YES') ?? "YES"),
              onPressed: () {
                // TODO: Store the result
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

  PageController taskPageViewController = PageController(keepPage: false);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => blocTask.sendStatus(StepStatus.Canceled),
      child: Theme(
        data: Theme.of(context),
        child: PageView.builder(
          itemBuilder: (BuildContext context, int position) {
            return stepWidgets[position];
          },
          itemCount: stepWidgets.length,
          controller: taskPageViewController,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }

  @override
  dispose() {
    stepStatusSubscription.cancel();
    stepResultSubscription.cancel();
    taskPageViewController.dispose();
    super.dispose();
  }
}
