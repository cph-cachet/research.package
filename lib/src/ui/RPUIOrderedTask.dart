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
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return step.stepWidget;
        },
        settings: RouteSettings(name: step.identifier),
      ),
    );
  }

  @override
  initState() {
    super.initState();

    blocConsentSubscription = blocConsent.stepStatus.listen((data) {
      print('data:$data');
      switch (data) {
        case StepStatus.Finished:
          stepToNavigate = widget.task.getStepAfterStep(currentStep, null);
          _pushStep(stepToNavigate);
          print('stepToNavigate:$stepToNavigate');
          break;
        case StepStatus.Canceled:
          stepToNavigate = widget.task.steps.first;
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
          Navigator.of(context).popUntil(ModalRoute.withName("/"));
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
    return MaterialApp(
      theme: RPStyles.cachetTheme,
      initialRoute: "/",
      routes:{
        "/" : (context) => widget.task.steps.first.stepWidget,
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
    blocConsentSubscription.cancel();
  }
}
