part of research_package_ui;

class RPUIOrderedTask extends StatefulWidget {
  final RPOrderedTask task;

  RPUIOrderedTask({this.task});

  @override
  _RPUIOrderedTaskState createState() => _RPUIOrderedTaskState();
}

class _RPUIOrderedTaskState extends State<RPUIOrderedTask> {
  RPTaskResult taskResult;
  RPStep currentStep;
  RPStep stepToNavigate;
  List<Widget> stepWidgets;
  int currentStepIndex;

  @override
  void initState() {
    currentStepIndex = 0;
    stepWidgets = List<Widget>();

    for (int i = 0; i < widget.task.steps.length; i++) {
      stepWidgets.add(widget.task.steps[i].stepWidget);
    }

    blocConsent.stepStatus.listen((data) {
      switch (data) {
        case StepStatus.Finished:
          setState(() {
            currentStepIndex += 1;
          });
//          Navigator.of(context).push(
//            MaterialPageRoute(builder: (context) => stepWidgets[currentStepIndex])
//          );
          print('data:$data');
          break;
        case StepStatus.Canceled:
          setState(() {
            currentStepIndex = 0;
          });
          break;
        case StepStatus.Back:
          print('back');
          break;
        case StepStatus.Ongoing:
          print('ongoing');
          break;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(stepWidgets[currentStepIndex]);
    return stepWidgets[currentStepIndex];
  }
}

///
/// VERSION 1: StreamBuilder
/// Why the builder is called when there's no event coming? (Agree button on
///

//  @override
//  void initState() {
//    super.initState();
//    currentStep = widget.task.getStepAfterStep(null, null);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<StepStatus>(
//      stream: blocConsent.stepStatus,
//      builder: (context, snapshot) {
//        switch (snapshot.data) {
//          case StepStatus.Finished:
//            currentStep = widget.task.getStepAfterStep(currentStep, null);
//            break;
//          case StepStatus.Canceled:
//            currentStep = widget.task.getStepAfterStep(null, null);
//            break;
//          case StepStatus.Back:
//            print('back');
//            break;
//          case StepStatus.Ongoing:
//            print('ongoing');
//            break;
////          default:
////            currentStep = widget.task.getStepAfterStep(null, null);
//        }
//        return currentStep.stepWidget;
//      },
//    );
//  }
//}

///
/// VERSION 2: Trigger navigation based on blocConsent stream
/// Problem: I think because of the asynchronous stream the build method was called with wrong, not updated stepWidget, so we had the same step for multiple times.
///

//  void _pushStep(RPStep step) {
//    Navigator.of(context)
//        .push(MaterialPageRoute(builder: (BuildContext context) {
//      return step.stepWidget;
//    }));
//  }
//
//  @override
//  initState() {
//    currentStep = widget.task.getStepAfterStep(null, null);
//
//    blocConsent.stepStatus.listen((data) {
//      switch (data) {
//        case StepStatus.Finished:
//          stepToNavigate = widget.task.getStepAfterStep(currentStep, null);
//          currentStep = stepToNavigate;
//          _pushStep(stepToNavigate);
////          setState(() {
////            currentStep = stepToNavigate;
////          });
//
//          print('stepToNavigate:$stepToNavigate');
//          print('data:$data');
//          break;
//        case StepStatus.Canceled:
//          stepToNavigate = widget.task.steps.first;
//          Navigator.of(context).pop();
//          break;
//        case StepStatus.Back:
//          print('back');
//          break;
//        case StepStatus.Ongoing:
//          print('ongoing');
//          break;
//      }
//    });
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: currentStep.stepWidget,
//    );
//  }
//}
