part of research_package_ui;

/// The UI representation of the [RPActivityStep]. This widget is the container, the concrete content depends on the input step's [runtimeType].
///
/// As soon as the participant has finished with the Activity the [RPActivityResult] is added to the [RPTaskResult]'s result list.
class RPUIActivityStep extends StatefulWidget {
  final RPActivityStep step;

  RPUIActivityStep(this.step);

  @override
  _RPUIActivityStepState createState() => _RPUIActivityStepState();
}

class _RPUIActivityStepState extends State<RPUIActivityStep>
    with CanSaveResult {
  // Dynamic because as the type of result will have can vary
  dynamic _currentActivityBodyResult;
  bool? readyToProceed;
  late RPActivityResult result;
  RPTaskProgress? recentTaskProgress;
  RPActivityEventLogger? eventLogger;

  set currentActivityBodyResult(dynamic currentActivityBodyResult) {
    this._currentActivityBodyResult = currentActivityBodyResult;
    createAndSendResult();
    if (this._currentActivityBodyResult != null) {
      blocQuestion.sendReadyToProceed(true);
    } else {
      blocQuestion.sendReadyToProceed(false);
    }
  }

  @override
  void initState() {
    // Instantiating the result object here to start the time counter (startDate)
    result = RPActivityResult(identifier: widget.step.identifier);
    readyToProceed = false;
    blocQuestion.sendReadyToProceed(false);
    recentTaskProgress = blocTask.lastProgressValue;
    eventLogger = RPActivityEventLogger(result);

    super.initState();
  }

  // Returning the according step body widget based on the runtimeType of the step
  Widget stepBody(RPActivityStep activityStep) {
    return activityStep.stepBody((result) {
      this.currentActivityBodyResult = result;
    }, eventLogger!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: stepBody(widget.step),
      ),
    );
  }

  @override
  void createAndSendResult() {
    // Populate the result object with value and end the time tracker (set endDate)
    result.setFinalResult(_currentActivityBodyResult);
    blocTask.sendStepResult(result);
  }
}

/// The three stages each test consists of.
/// These can be exclude using [includeInstructions] or [includeResults].
enum ActivityStatus { Instruction, Test, Result }
