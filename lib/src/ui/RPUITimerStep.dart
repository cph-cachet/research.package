part of research_package_ui;

/// The UI representation of the [RPQuestionStep]. This widget is the container, the concrete content depends on the input step's [RPAnswerFormat].
///
/// As soon as the participant has finished with the question the [RPStepResult] is being added to the [RPTaskResult]'s result list.
class RPUITimerStep extends StatefulWidget {
  final RPTimerStep step;

  const RPUITimerStep(this.step, {super.key});

  @override
  RPUITimerStepState createState() => RPUITimerStepState();
}

class RPUITimerStepState extends State<RPUITimerStep> {
  Timer? timer;
  late int timeInSeconds;
  Audio? audio;
  bool _mPlayerIsInitialized = false;
  ByteData? data;

  @override
  void initState() {
    super.initState();
    if (widget.step.playSound) {
      audio = Audio.load(
          'packages/research_package/assets/audio/RPTimerStepSound.mp3');
      _mPlayerIsInitialized = true;
    }
    timeInSeconds = widget.step.timeout.inSeconds;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (t) {
      if (mounted) {
        setState(() {
          timeInSeconds--;
        });
      }
      if (timeInSeconds <= 0) {
        if (_mPlayerIsInitialized) {
          audio?.play();
        }
        if (widget.step.autoSkip) {
          // Wait for the sound to finish playing before auto skipping to next step.
          Future.delayed(const Duration(seconds: 1), () {
            FocusManager.instance.primaryFocus?.unfocus();
            blocTask.sendStatus(RPStepStatus.Finished);
          });
        }
        blocQuestion.sendReadyToProceed(true);
        t.cancel();
      }
    });
    blocQuestion.sendReadyToProceed(false);
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Title
          Padding(
            padding:
                const EdgeInsets.only(bottom: 24, left: 8, right: 8, top: 0),
            child: Text(
              locale?.translate(widget.step.title) ?? widget.step.title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),

          // Timer
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_durationFormat(Duration(seconds: timeInSeconds)),
                style: Theme.of(context).textTheme.displayMedium),
          ),
        ],
      ),
    );
  }

  String _durationFormat(Duration duration) {
    if (widget.step.showTime == false) {
      return "";
    }
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void dispose() async {
    super.dispose();
    if (audio != null) {
      await audio?.pause();
      await audio?.dispose();
      _mPlayerIsInitialized = false;
      audio = null;
    }
    timer?.cancel();
  }
}
