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

  List<Widget> stepWidgets = List<Widget>();
  int currentStepIndex = 0;
  StreamSubscription blocConsentSubscription;

  void _pushStep(RPStep step) {
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return step.stepWidget;
    }));
  }

  @override
  initState() {
    super.initState();

    blocConsentSubscription = blocConsent.stepStatus.listen((data) {
      switch (data) {
        case StepStatus.Finished:
          stepToNavigate = widget.task.getStepAfterStep(currentStep, null);
          _pushStep(stepToNavigate);
          print('stepToNavigate:$stepToNavigate');
          print('data:$data');
          break;
        case StepStatus.Canceled:
          stepToNavigate = widget.task.steps.first;
          Navigator.of(context).pop();
          break;
        case StepStatus.Back:
          print('back');
          break;
        case StepStatus.Ongoing:
          print('ongoing');
          break;
      }
    });
    currentStep = widget.task.getStepAfterStep(null, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentStep.stepWidget,
    );
  }

  @override
  dispose() {
    super.dispose();
    blocConsentSubscription.cancel();
  }
}
