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

  /// The callback function which has to return an [RPTaskResult] object.
  /// This function is called when the participant cancels a survey. The result parameter is optional so if you don't want to do grab the result as part of the callback function you can do so, like the following:
  ///
  /// ```
  /// onCancel: ([result]) {
  ///        cancelCallBack();
  ///      },
  /// ```
  ///
  /// It's only optional. If nothing is provided (is ```null```) the survey just quits without doing anything with the result.
  final void Function(RPTaskResult result) onCancel;

  RPUITask({this.task, this.onSubmit, this.onCancel});

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
  StreamSubscription<RPResult> _stepResultSubscription;

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
              blocTask.updateTaskProgress(
                  RPTaskProgress(_currentQuestionIndex, widget.task.numberOfQuestionSteps));
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
              blocTask.updateTaskProgress(
                  RPTaskProgress(_currentQuestionIndex, widget.task.numberOfQuestionSteps));
            // await because we can only update the stepWidgets list while the current step is out of the screen
            await _taskPageViewController.previousPage(
                duration: Duration(milliseconds: 400), curve: Curves.easeInOut);

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
              : RPLocalizations.of(context)?.translate('Discard results and quit?') ??
                  "Discard results and quit?"),
          actions: <Widget>[
            ElevatedButton(
              child: Text(RPLocalizations.of(context)?.translate('NO') ?? "NO"),
              onPressed: () => Navigator.of(context).pop(), // Dismissing the pop-up
            ),
            OutlinedButton(
              child: Text(RPLocalizations.of(context)?.translate('YES') ?? "YES"),
              onPressed: () {
                // Calling the onCancel method with which the developer can for e.g. save the result on the device.
                // Only call it if it's not null
                widget.onCancel?.call(_taskResult);
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

  Widget _carouselBar() {
    return Container(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Spacer
          Expanded(
            child: Container(),
            flex: 1,
          ),
          // Carousel indicator
          Expanded(
            flex: 2,
            child: (!navigableTask)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: widget.task.steps.map(
                      (step) {
                        var index = widget.task.steps.indexOf(step);
                        return Container(
                          width: 7.0,
                          height: 7.0,
                          margin: EdgeInsets.symmetric(horizontal: 3.0),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: index <= _currentQuestionIndex
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).primaryColor.withOpacity(0.5)),
                        );
                      },
                    ).toList(),
                  )
                : Container(),
          ),
          // Close button
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(
                Icons.highlight_off,
                color: Theme.of(context).primaryColor,
              ),
              onPressed: () => blocTask.sendStatus(StepStatus.Canceled),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);

    return WillPopScope(
      onWillPop: () => blocTask.sendStatus(StepStatus.Canceled),
      child: Theme(
        data: Theme.of(context),
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // top bar
                _carouselBar(),
                // Body
                Expanded(
                  child: PageView.builder(
                    itemBuilder: (BuildContext context, int position) {
                      return _activeSteps[position].stepWidget;
                    },
                    itemCount: _activeSteps.length,
                    controller: _taskPageViewController,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
                // Bottom navigation
                if (![RPCompletionStep, RPVisualConsentStep, RPConsentReviewStep]
                    .contains(_currentStep.runtimeType))
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _currentStepIndex != 0 || !navigableTask
                            ? Container()
                            : TextButton(
                                onPressed: () => blocTask.sendStatus(StepStatus.Back),
                                child: Text(
                                  RPLocalizations.of(context)?.translate('BACK') ?? 'BACK',
                                ),
                              ),
                        StreamBuilder<bool>(
                          stream: blocQuestion.questionReadyToProceed,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ElevatedButton(
                                child: Text(
                                  RPLocalizations.of(context)?.translate('NEXT') ?? 'NEXT',
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
                      ],
                    ),
                  ),
              ],
            ),
          ),
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
