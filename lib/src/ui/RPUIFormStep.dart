part of research_package_ui;

class RPUIFormStep extends StatefulWidget {
  final RPFormStep formStep;

  RPUIFormStep(this.formStep);

  @override
  _RPUIFormStepState createState() => _RPUIFormStepState();
}

class _RPUIFormStepState extends State<RPUIFormStep> {
  late bool readyToProceed;
  late RPStepResult stepResult;
  RPTaskProgress? recentTaskProgress;

  // Since the QuestionBody's are sending null if they are not answered yet we can loop through the
  // results of the steps.
  // If any of the non-optional steps have a null-answer in the stepResult, it means the user has not answered it and CANNOT go to the next step.
  void checkReadyToProceed() {
    bool temp = true;
    widget.formStep.steps.forEach((step) {
      if (!step.optional) {
        if (stepResult.results.values.any((element) =>
            (element as RPStepResult).identifier == step.identifier &&
            element.results['answer'] == null)) {
          temp = false;
        }
      }
    });

    setState(() {
      readyToProceed = temp;
    });
    createAndSendResult();
    blocQuestion.sendReadyToProceed(temp);
  }

  @override
  void initState() {
    // Instantiating the result object here to start the time counter (startDate)
    stepResult = RPStepResult(
        identifier: widget.formStep.identifier,
        answerFormat: widget.formStep.answerFormat);
    stepResult.questionTitle =
        "Form Step - See titles for every question included";

    // Filling up the results with nulls
    widget.formStep.steps.forEach((item) {
      stepResult.setResultForIdentifier(
          item.identifier,
          RPStepResult(
              identifier: item.identifier, answerFormat: item.answerFormat));
      // Set each questionTitle here in case this is a skippable question.
      (stepResult.results[item.identifier] as RPStepResult).questionTitle =
          item.title;
    });

    readyToProceed = false;
    blocQuestion.sendReadyToProceed(false);
    recentTaskProgress = blocTask.lastProgressValue;

    super.initState();
  }

  // Returning the according step body widget based on the answerFormat of each step
  Widget stepBody(String id, RPAnswerFormat answerFormat) {
    switch (answerFormat.runtimeType) {
      case RPIntegerAnswerFormat:
        return RPUIIntegerQuestionBody((answerFormat as RPIntegerAnswerFormat),
            (result) {
          RPStepResult tempResult = stepResult.results[id] as RPStepResult;
          tempResult.questionTitle = widget.formStep.steps
              .where((step) => step.identifier == id)
              .first
              .title;
          tempResult.setResult(result);

          checkReadyToProceed();
        });
      case RPChoiceAnswerFormat:
        return RPUIChoiceQuestionBody((answerFormat as RPChoiceAnswerFormat),
            (result) {
          RPStepResult tempResult = stepResult.results[id] as RPStepResult;
          tempResult.questionTitle = widget.formStep.steps
              .where((step) => step.identifier == id)
              .first
              .title;
          tempResult.setResult(result);

          checkReadyToProceed();
        });
      case RPSliderAnswerFormat:
        return RPUISliderQuestionBody((answerFormat as RPSliderAnswerFormat),
            (result) {
          RPStepResult tempResult = stepResult.results[id] as RPStepResult;
          tempResult.questionTitle = widget.formStep.steps
              .where((step) => step.identifier == id)
              .first
              .title;
          tempResult.setResult(result);

          checkReadyToProceed();
        });
      case RPImageChoiceAnswerFormat:
        return RPUIImageChoiceQuestionBody(
            (answerFormat as RPImageChoiceAnswerFormat), (result) {
          RPStepResult tempResult = stepResult.results[id] as RPStepResult;
          tempResult.questionTitle = widget.formStep.steps
              .where((step) => step.identifier == id)
              .first
              .title;
          tempResult.setResult(result);

          checkReadyToProceed();
        });
      case RPDateTimeAnswerFormat:
        return RPUIDateTimeQuestionBody(
            (answerFormat as RPDateTimeAnswerFormat), (result) {
          RPStepResult tempResult = stepResult.results[id] as RPStepResult;
          tempResult.questionTitle = widget.formStep.steps
              .where((step) => step.identifier == id)
              .first
              .title;
          tempResult.setResult(result);

          checkReadyToProceed();
        });
      case RPTextAnswerFormat:
        return RPUITextInputQuestionBody((answerFormat as RPTextAnswerFormat),
            (result) {
          RPStepResult tempResult = stepResult.results[id] as RPStepResult;
          tempResult.questionTitle = widget.formStep.steps
              .where((step) => step.identifier == id)
              .first
              .title;
          tempResult.setResult(result);

          checkReadyToProceed();
        });
      default:
        return Container();
    }
  }

  skipQuestion() {
    stepResult.results.keys.forEach((key) {
      (stepResult.results[key] as RPStepResult).setResult(null);
    });
    blocTask.sendStatus(RPStepStatus.Finished);
    createAndSendResult();
  }

  Widget formItemBuilder(context, index) {
    RPLocalizations? locale = RPLocalizations.of(context);
    if (index == 0) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 8, right: 8, top: 8),
        child: Text(
          locale?.translate(widget.formStep.title) ?? widget.formStep.title,
          style: Theme.of(context).textTheme.headline5,
          textAlign: TextAlign.left,
        ),
      );
    }
    index -= 1;

    if (index == widget.formStep.steps.length) {
      return widget.formStep.optional
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () => skipQuestion(),
                child: Text(locale?.translate("Skip these questions") ??
                    "Skip these questions"),
              ),
            )
          : Container();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              locale?.translate(widget.formStep.steps[index].title) ??
                  widget.formStep.steps[index].title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: stepBody(
              widget.formStep.steps[index].identifier,
              widget.formStep.steps[index].answerFormat,
            ),
          ),
          Divider(
              indent: 1,
              endIndent: 1,
              color: Theme.of(context).dividerColor,
              thickness: 2)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: formItemBuilder,
                itemCount: widget.formStep.steps.length + 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createAndSendResult() {
    // In this case the result is already created, the only needed thing left is to send it
    blocTask.sendStepResult(stepResult);
  }
}
