part of research_package_ui;

/// The UI representation of the [RPQuestionStep]. This widget is the container, the concrete content depends on the input step's [RPAnswerFormat].
///
/// As soon as the participant has finished with the question the [RPStepResult] is being added to the [RPTaskResult]'s result list.
class RPUIQuestionStep extends StatefulWidget {
  final RPQuestionStep step;

  RPUIQuestionStep(this.step);

  @override
  _RPUIQuestionStepState createState() => _RPUIQuestionStepState();
}

class _RPUIQuestionStepState extends State<RPUIQuestionStep> with CanSaveResult {
  // Dynamic because we don't know what value the RPChoice will have
  dynamic _currentQuestionBodyResult;
  bool readyToProceed;
  RPStepResult result;
  RPTaskProgress recentTaskProgress;

  set currentQuestionBodyResult(dynamic currentQuestionBodyResult) {
    this._currentQuestionBodyResult = currentQuestionBodyResult;
    createAndSendResult();
    if (this._currentQuestionBodyResult != null) {
      blocQuestion.sendReadyToProceed(true);
    } else {
      blocQuestion.sendReadyToProceed(false);
    }
  }

  skipQuestion() {
    blocTask.sendStatus(StepStatus.Finished);
    this.currentQuestionBodyResult = null;
  }

  @override
  void initState() {
    // Instantiating the result object here to start the time counter (startDate)
    result = RPStepResult.withParams(widget.step);
    readyToProceed = false;
    blocQuestion.sendReadyToProceed(false);
    recentTaskProgress = blocTask.lastProgressValue;

    super.initState();
  }

  // Returning the according step body widget based on the answerFormat of the step
  Widget stepBody(RPAnswerFormat answerFormat) {
    switch (answerFormat.runtimeType) {
      case RPIntegerAnswerFormat:
        return RPUIIntegerQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPChoiceAnswerFormat:
        return RPUIChoiceQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPSliderAnswerFormat:
        return RPUISliderQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPImageChoiceAnswerFormat:
        return RPUIImageChoiceQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPDateTimeAnswerFormat:
        return RPUIDateTimeQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      case RPBooleanAnswerFormat:
        return RPUIBooleanQuestionBody(answerFormat, (result) {
          this.currentQuestionBodyResult = result;
        });
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return ListView(
      padding: EdgeInsets.all(8),
      children: [
        (widget.step.title != null)
            ? Padding(
                padding: const EdgeInsets.only(bottom: 24, left: 8, right: 8, top: 8),
                child: Text(
                  locale?.translate(widget.step.title) ?? widget.step.title,
                  style: RPStyles.h2,
                  textAlign: TextAlign.left,
                ),
              )
            : null,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: stepBody(widget.step.answerFormat),
            ),
          ),
        ),
        widget.step.optional
            ? FlatButton(
                onPressed: () => skipQuestion(),
                child: Text(locale?.translate("Skip this question") ?? "Skip this question"),
              )
            : Container(),
      ],
    );
  }

  @override
  void createAndSendResult() {
    // Populate the result object with value and end the time tracker (set endDate). Set questionTitle
    result.questionTitle = widget.step.title;
    result.setResult(_currentQuestionBodyResult);
    blocTask.sendStepResult(result);
  }
}

// Render the title above the questionBody
class Title extends StatelessWidget {
  final String title;
  Title(this.title);

  @override
  Widget build(BuildContext context) {
    if (title != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 24, left: 8, right: 8, top: 8),
        child: Text(
          title,
          style: RPStyles.h2,
          textAlign: TextAlign.left,
        ),
      );
    }
    return Container();
  }
}
