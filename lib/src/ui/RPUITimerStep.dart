part of research_package_ui;

/// The UI representation of the [RPQuestionStep]. This widget is the container, the concrete content depends on the input step's [RPAnswerFormat].
///
/// As soon as the participant has finished with the question the [RPStepResult] is being added to the [RPTaskResult]'s result list.
class RPUITimerStep extends StatefulWidget {
  final RPTimerStep step;

  RPUITimerStep(this.step);

  @override
  _RPUITimerStepState createState() => _RPUITimerStepState();
}

class _RPUITimerStepState extends State<RPUITimerStep> {
  // Dynamic because we don't know what value the RPChoice will have
  Timer? timer;
  late int timeInSeconds;
  Audio? audio;
  bool _mPlayerIsInited = false;
  ByteData? data;

  @override
  void initState() {
    super.initState();
    if (widget.step.playSound) {
      audio = Audio.load(
          'packages/research_package/assets/audio/RPTimerStepSound.mp3');
      _mPlayerIsInited = true;
    }
    timeInSeconds = widget.step.timeout.inSeconds;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(oneSec, (t) {
      setState(() {
        timeInSeconds--;
      });
      if (timeInSeconds <= 0) {
        blocQuestion.sendReadyToProceed(true);
        if (_mPlayerIsInited) {
          audio?.play();
        }
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
              style: Theme.of(context).textTheme.headline6,
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
      _mPlayerIsInited = false;
      audio = null;
    }
    timer?.cancel();
  }
}
