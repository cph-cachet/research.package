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
        if (widget.step.audioPath != null) {
          if (widget.step.audioPath!.startsWith('http')) {
            await player.setSource(UrlSource(widget.step.audioPath!));
          } else {
            await player.setSource(AssetSource(widget.step.audioPath!));
          }
        }
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
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child:
                            InstructionImage(imagePath: widget.step.imagePath!),
                      ),
                    ),
                  if (widget.step.videoPath != null)
                    VideoApp(step: widget.step),
                  if (widget.step.audioPath != null)
                    AudioPlayerWidget(player: player),

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

class InstructionImage extends StatefulWidget {
  final String imagePath;
  const InstructionImage({super.key, required this.imagePath});

  @override
  _InstructionImageState createState() => _InstructionImageState();
}

class _InstructionImageState extends State<InstructionImage> {
  @override
  Widget build(BuildContext context) {
    String _imagePath = widget.imagePath;
    Image image;
    _imagePath = widget.imagePath;

    if (_imagePath.startsWith('http')) {
      image = Image.network(
        _imagePath,
        errorBuilder:
            (BuildContext context, Object error, StackTrace? stackTrace) {
          return Container();
        },
      );
    } else {
      image = Image.asset(_imagePath);
    }
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: FittedBox(
            fit: BoxFit.contain,
            child: SizedBox(
              width: image.width ?? constraints.maxWidth,
              height: image.height ?? constraints.maxHeight,
              child: image,
            ),
          ),
        );
      },
    );
  }
}

class VideoApp extends StatefulWidget {
  final RPInstructionStep step;
  const VideoApp({super.key, required this.step});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _isCompleted = false;
  bool _hasError = false;
  Duration? _position;
  Duration? _duration;

  @override
  void initState() {
    super.initState();
    try {
      if (widget.step.videoPath != null &&
          widget.step.videoPath!.startsWith("http")) {
        _controller =
            VideoPlayerController.networkUrl(Uri.parse(widget.step.videoPath!))
              ..initialize().then((_) {
                // Ensure the first frame is shown after the video is initialized
                setState(() {
                  _duration = _controller.value.duration;
                });
              }).catchError((onError) {
                _showConnectionErrorDialog();
              });
      } else {
        print("widget.step.videopath ${widget.step.videoPath}");
        _controller = VideoPlayerController.asset(widget.step.videoPath!)
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized
            setState(() {
              _duration = _controller.value.duration;
            });
          }).catchError((onError) {
            _showConnectionErrorDialog();
          });
      }
    } catch (e) {
      debugPrint("Initialization Error: $e");
    }

    _controller.addListener(() {
      setState(() {
        _isPlaying = _controller.value.isPlaying;
        _position = _controller.value.position;
        if (_controller.value.position == _controller.value.duration) {
          _isPlaying = false;
          _isCompleted = true;
        }
      });

      // Check for errors during playback
      if (_controller.value.hasError) {
        setState(() {
          _hasError = true;
        });
        _showConnectionErrorDialog();
      }
    });
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    if (_isCompleted) {
      // If video completed, restart it from the beginning
      _controller.seekTo(Duration.zero);
      _controller.play();
      setState(() {
        _isPlaying = true;
        _isCompleted = false;
      });
    } else if (_isPlaying) {
      _controller.pause();
      setState(() {
        _isPlaying = false;
      });
    } else {
      _controller.play();
      setState(() {
        _isPlaying = true;
      });
    }
  }

  void _seekToPosition(double value) {
    final position = Duration(seconds: value.round());
    _controller.seekTo(position);
  }

  // Method to show the error dialog when video loading fails
  void _showConnectionErrorDialog() {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Center(
            child: Text('Connection Error'),
          ),
          titlePadding: const EdgeInsets.symmetric(vertical: 12.0),
          insetPadding:
              const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40),
          content: const Text(
              'Internet connection not found or video could not be loaded.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Retry'),
              onPressed: () {
                Navigator.of(context).pop();
                // Retry loading the video
                setState(() {
                  _controller.initialize();
                });
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _toggleFullScreen() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FullscreenVideoPlayer(
        controller: _controller,
        onExitFullScreen: () {
          Navigator.of(context).pop();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Video Player
        GestureDetector(
          onTap: _togglePlayPause, // Play/Pause on tap
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      VideoPlayer(_controller),
                      if (!_isPlaying && !_isCompleted)
                        const Icon(
                          Icons.play_circle_outline,
                          size: 64.0,
                          color: Colors.white,
                        ),
                      if (_isCompleted)
                        const Icon(
                          Icons.replay,
                          size: 64.0,
                          color: Colors.white,
                        ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (_controller.value.isInitialized && !_hasError)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                      overlayShape:
                                          SliderComponentShape.noOverlay),
                                  child: Slider(
                                    min: 0.0,
                                    max: _duration?.inSeconds.toDouble() ?? 1.0,
                                    value:
                                        _position?.inSeconds.toDouble() ?? 0.0,
                                    onChanged: (value) {
                                      _seekToPosition(value);
                                    },
                                  ),
                                ),
                              ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.fullscreen,
                                    color: Colors.white,
                                  ),
                                  onPressed: _toggleFullScreen,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(child: const CircularProgressIndicator()),
        ),
      ],
    );
  }
}

class FullscreenVideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;
  final VoidCallback onExitFullScreen;

  const FullscreenVideoPlayer(
      {super.key, required this.controller, required this.onExitFullScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
              },
              child: controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    )
                  : const CircularProgressIndicator(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Slider(
                      min: 0.0,
                      max: controller.value.duration.inSeconds.toDouble(),
                      value: controller.value.position.inSeconds.toDouble(),
                      onChanged: (value) {
                        controller.seekTo(Duration(seconds: value.round()));
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.fullscreen_exit,
                          color: Colors.white,
                        ),
                        onPressed: onExitFullScreen,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AudioPlayerWidget extends StatefulWidget {
  final AudioPlayer player;

  const AudioPlayerWidget({
    required this.player,
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return _AudioPlayerWidgetState();
  }
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
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
    final color = Theme.of(context).primaryColorLight;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
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
