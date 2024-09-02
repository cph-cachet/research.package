part of '../../ui.dart';

/// The UI representation of [RPInstructionStep]
///
/// In general, you don’t need to instantiate an instruction step widget directly.
/// Instead, add an instruction step to a task and present the task using a task widget.
/// When appropriate, the task widget instantiates the step widget for the step.
class RPUIInstructionStep extends StatefulWidget {
  final RPInstructionStep step;

  const RPUIInstructionStep({super.key, required this.step});

  @override
  RPUIInstructionStepState createState() => RPUIInstructionStepState();
}

class RPUIInstructionStepState extends State<RPUIInstructionStep> {
  late AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    blocQuestion.sendReadyToProceed(true);
    super.initState();
    player = AudioPlayer();
    player.setReleaseMode(ReleaseMode.stop);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await player.setSource(AssetSource(widget.step.audioPath!));
      } catch (e) {
        print(e);
      }
    });
  }

  @override
  void dispose() {
    // Release all sources and dispose the player.
    player.dispose();
    super.dispose();
  }

  void _pushDetailTextRoute() {
    Navigator.of(context).push(
      MaterialPageRoute<dynamic>(
        builder: (context) {
          return _DetailTextRoute(
            title: widget.step.title,
            content: widget.step.detailText!,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // If image is provided show it
                  if (widget.step.imagePath != null)
                    Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: InstructionImage(widget.step.imagePath!),
                      ),
                    ),
                  if (widget.step.audioPath != null)
                    PlayerWidget(player: player),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 16),
                        child: Text(
                          locale?.translate(widget.step.text!) ??
                              widget.step.text!,
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      if (widget.step.detailText != null)
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(
                              color: (CupertinoTheme.of(context).primaryColor ==
                                      CupertinoColors.activeBlue)
                                  ? Theme.of(context).primaryColor
                                  : CupertinoTheme.of(context).primaryColor,
                            ),
                          ),
                          onPressed: _pushDetailTextRoute,
                          child: Text(locale?.translate('learn_more') ??
                              "Learn more..."),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (widget.step.footnote != null)
            Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  locale?.translate(widget.step.footnote!) ??
                      widget.step.footnote!,
                  style: Theme.of(context).textTheme.bodySmall,
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DetailTextRoute extends StatelessWidget {
  final String title;
  final String content;

  const _DetailTextRoute({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 3),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Text(locale?.translate('learn_more') ?? 'Learn more',
                    style: Theme.of(context).textTheme.headlineSmall),
              ],
            ),
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      locale?.translate(content) ?? content,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InstructionImage extends StatelessWidget {
  final String _imagePath;

  const InstructionImage(this._imagePath, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Image.asset(
        _imagePath,
        width: MediaQuery.of(context).size.width / 2,
      ),
    );
  }
}

class PlayerWidget extends StatefulWidget {
  final AudioPlayer player;

  const PlayerWidget({
    required this.player,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _PlayerWidgetState();
  }
}
class _PlayerWidgetState extends State<PlayerWidget> {
  PlayerState? _playerState;
  Duration? _duration;
  Duration? _position;

  StreamSubscription? _durationSubscription;
  StreamSubscription? _positionSubscription;
  StreamSubscription? _playerCompleteSubscription;
  StreamSubscription? _playerStateChangeSubscription;

  bool get _isPlaying => _playerState == PlayerState.playing;

  bool get _isPaused => _playerState == PlayerState.paused;

  String get _durationText => _duration?.toString().split('.').first ?? '';

  String get _positionText => _position?.toString().split('.').first ?? '';

  AudioPlayer get player => widget.player;

  @override
  void initState() {
    super.initState();
    // Use initial values from player
    _playerState = player.state;
    player.getDuration().then(
          (value) => setState(() {
            _duration = value;
          }),
        );
    player.getCurrentPosition().then(
          (value) => setState(() {
            _position = value;
          }),
        );
    _initStreams();
  }

  @override
  void setState(VoidCallback fn) {
    // Subscriptions only can be closed asynchronously,
    // therefore events can occur after widget has been disposed.
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerStateChangeSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              key: const Key('play_button'),
              onPressed: _isPlaying ? null : _play,
              iconSize: 48.0,
              icon: const Icon(Icons.play_arrow),
              color: color,
            ),
            IconButton(
              key: const Key('pause_button'),
              onPressed: _isPlaying ? _pause : null,
              iconSize: 48.0,
              icon: const Icon(Icons.pause),
              color: color,
            ),
            IconButton(
              key: const Key('stop_button'),
              onPressed: _isPlaying || _isPaused ? _stop : null,
              iconSize: 48.0,
              icon: const Icon(Icons.stop),
              color: color,
            ),
          ],
        ),
        Slider(
          onChanged: (value) {
            final duration = _duration;
            if (duration == null) {
              return;
            }
            final position = value * duration.inMilliseconds;
            player.seek(Duration(milliseconds: position.round()));
          },
          value: (_position != null &&
                  _duration != null &&
                  _position!.inMilliseconds > 0 &&
                  _position!.inMilliseconds < _duration!.inMilliseconds)
              ? _position!.inMilliseconds / _duration!.inMilliseconds
              : 0.0,
        ),
        Text(
          _position != null
              ? '$_positionText / $_durationText'
              : _duration != null
                  ? _durationText
                  : '',
          style: const TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }

  void _initStreams() {
    _durationSubscription = player.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);
    });

    _positionSubscription = player.onPositionChanged.listen(
      (p) => setState(() => _position = p),
    );

    _playerCompleteSubscription = player.onPlayerComplete.listen((event) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration.zero;
      });
    });

    _playerStateChangeSubscription =
        player.onPlayerStateChanged.listen((state) {
      setState(() {
        _playerState = state;
      });
    });
  }

  Future<void> _play() async {
    await player.resume();
    setState(() => _playerState = PlayerState.playing);
  }

  Future<void> _pause() async {
    await player.pause();
    setState(() => _playerState = PlayerState.paused);
  }

  Future<void> _stop() async {
    await player.stop();
    setState(() {
      _playerState = PlayerState.stopped;
      _position = Duration.zero;
    });
  }
}
