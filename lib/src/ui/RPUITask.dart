part of research_package_ui;

/// This class is the primary entry point for the presentation of the Research Package framework UI.
/// It presents the steps of an [RPOrderedTask] (either navigable or just linear) and then provides the [RPTaskResult] object.
class RPUITask extends StatefulWidget {
  /// The task to present. It can be either an [RPOrderedTask] or an [RPNavigableOrderedTask].
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
  RPTaskResult _taskResult;

  /// A list of actual steps to show in the task.
  /// If the task is a [RPNavigableOrderedTask] not all the questions necessarily show up because of branching.
  /// (Some questions could be skipped based on previous answers.)
  /// It is a dynamic list which grows and shrinks according to the forward of back navigation of the task.
  List<RPStep> _activeSteps = [];

  RPStep _currentStep;
  int _currentStepIndex = 0;
  int _currentQuestionIndex = 1;

  StreamSubscription<StepStatus> _stepStatusSubscription;
  StreamSubscription<RPStepResult> _stepResultSubscription;

  bool navigableTask = false;

  @override
  initState() {
    // Instantiate the taskresult so it starts tracking time
    _taskResult = RPTaskResult.withParams(widget.task.identifier);

    // If it's navigable we don't want to show result on appbar
    if (widget.task is RPNavigableOrderedTask) {
      blocTask.updateTaskProgress(null);
      navigableTask = true;
    } else {
      // Sending the initial Task Progress so the Question UI can use it in the app bar
      blocTask.updateTaskProgress(RPTaskProgress(_currentQuestionIndex, widget.task.numberOfQuestionSteps));
    }

    // Subscribe to step status changes so the navigation can be triggered
    _stepStatusSubscription = blocTask.stepStatus.listen((data) async {
      switch (data) {
        case StepStatus.Finished:
          // In case of last step we save the result and close the task
          if (_currentStep == widget.task.steps.last) {
            //Creating and sending the task level of result to a stream to which anybody can subscribe
            createAndSendResult();
            if (widget.task.closeAfterFinished) {
              Navigator.of(context).pop();
            }
            break;
          }
          // Updating taskProgress stream
          if (_currentStep.runtimeType == RPQuestionStep) {
            _currentQuestionIndex++;
            // TODO: calculate the stepProgress differently for navigableTask
            if (!navigableTask)
              blocTask.updateTaskProgress(RPTaskProgress(_currentQuestionIndex, widget.task.numberOfQuestionSteps));
          }

          // Calculating next step and then navigate there
          setState(() {
            _currentStep = _activeSteps.last;
            _currentStep = widget.task.getStepAfterStep(_currentStep, null);
            _activeSteps.add(_currentStep);
          });
          _currentStepIndex++;

          _taskPageViewController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);
          break;
        case StepStatus.Canceled:
          _showCancelConfirmationDialog();
          break;
        case StepStatus.Back:
          // If the stepWidgets list only has 1 element it means the user is on the first question, so no back navigation is enabled
          if (_activeSteps.length == 1) {
            break;
          }
          if (_currentStep == widget.task.steps.first) {
            break;
          } else {
            _currentQuestionIndex--;
            // TODO: calculate the stepprogress differently for navigableTask
            if (!navigableTask)
              blocTask.updateTaskProgress(RPTaskProgress(_currentQuestionIndex, widget.task.numberOfQuestionSteps));
            // await because we can only update the stepWidgets list while the current step is out of the screen
            await _taskPageViewController.previousPage(duration: Duration(milliseconds: 400), curve: Curves.easeInOut);

            setState(() {
              _activeSteps.removeLast();
              _currentStep = _activeSteps.last;
            });
          }
          blocQuestion.sendReadyToProceed(true);
          break;
        case StepStatus.Ongoing:
          print('ongoing');
          break;
        default:
          break;
      }
    });

    _stepResultSubscription = blocTask.stepResult.listen((stepResult) {
      _taskResult.setStepResultForIdentifier(stepResult.identifier, stepResult);
      blocTask.updateTaskResult(_taskResult);
    });

    setState(() {
      // Getting the first step
      _currentStep = widget.task.getStepAfterStep(null, null);
      _activeSteps.add(_currentStep);
    });

    super.initState();
  }

  @override
  createAndSendResult() {
    // Populate the result object with value and end the time tracker (set endDate)
    _taskResult.endDate = DateTime.now();
    widget.onSubmit(_taskResult);
  }

  void _showCancelConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.task.isConsentTask
              ? RPLocalizations.of(context)?.translate('Cancel?') ?? "Cancel?"
              : RPLocalizations.of(context)?.translate('Discard results and quit?') ?? "Discard results and quit?"),
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

  PageController _taskPageViewController = PageController(keepPage: false);

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);

    AppBar _taskAppBar(RPStep step) {
      switch (step.runtimeType) {
        case RPQuestionStep:
          return AppBar(
//            title: Text(recentTaskProgress != null ? "${recentTaskProgress?.current} ${locale?.translate('of') ?? 'of'} ${recentTaskProgress?.total}" : ""),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => blocTask.sendStatus(StepStatus.Canceled),
              )
            ],
          );
          break;
        case RPFormStep:
          return AppBar(
//            title: Text(recentTaskProgress != null ? "${recentTaskProgress?.current} ${locale?.translate('of') ?? 'of'} ${recentTaskProgress?.total}" : ""),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => blocTask.sendStatus(StepStatus.Canceled),
              )
            ],
          );
          break;
        case RPInstructionStep:
          return AppBar(
            title: Text(locale?.translate(step.title) ?? step.title),
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => blocTask.sendStatus(StepStatus.Canceled),
              )
            ],
          );
          break;
        default:
          return null;
          break;
      }
    }

    List<Widget> _taskPersistentFooterButtons(RPStep step) {
      switch (step.runtimeType) {
        case RPCompletionStep:
          return null;
          break;
        case RPVisualConsentStep:
          return null;
          break;
        case RPConsentReviewStep:
          return null;
          break;
        default:
          return <Widget>[
            _activeSteps.length == 1 || !navigableTask
                ? null
                : FlatButton(
                    onPressed: () => blocTask.sendStatus(StepStatus.Back),
                    child: Text(
                      RPLocalizations.of(context)?.translate('PREVIOUS') ?? "PREVIOUS",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                  ),
            StreamBuilder<bool>(
              stream: blocQuestion.questionReadyToProceed,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RaisedButton(
                    color: Theme.of(context).accentColor,
                    textColor: Colors.white,
                    child: Text(
                      RPLocalizations.of(context)?.translate('NEXT') ?? "NEXT",
                    ),
                    onPressed: snapshot.data
                        ? () {
                            blocTask.sendStatus(StepStatus.Finished);
                          }
                        : null,
                  );
                } else {
                  return Container();
                }
              },
            ),
          ];
      }
    }

    return WillPopScope(
      onWillPop: () => blocTask.sendStatus(StepStatus.Canceled),
      child: Theme(
        data: Theme.of(context),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: _taskAppBar(_currentStep),
          body: PageView.builder(
            itemBuilder: (BuildContext context, int position) {
              return _activeSteps[position].stepWidget;
            },
            itemCount: _activeSteps.length,
            controller: _taskPageViewController,
            physics: NeverScrollableScrollPhysics(),
          ),
          persistentFooterButtons: _taskPersistentFooterButtons(_currentStep),
        ),
      ),
    );
  }

  @override
  dispose() {
    _stepStatusSubscription.cancel();
    _stepResultSubscription.cancel();
    _taskPageViewController.dispose();
    super.dispose();
  }
}
