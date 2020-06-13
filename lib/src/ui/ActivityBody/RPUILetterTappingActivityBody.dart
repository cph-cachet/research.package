part of research_package_ui;

class RPUILetterTappingActivityBody extends StatefulWidget {
  final RPLetterTappingActivity activity;
  final Function(dynamic) onResultChange;
  final RPActivityEventLogger eventLogger;

  RPUILetterTappingActivityBody(
      this.activity, this.eventLogger, this.onResultChange);

  @override
  _RPUILetterTappingActivityBodyState createState() =>
      _RPUILetterTappingActivityBodyState();
}

class _RPUILetterTappingActivityBodyState
    extends State<RPUILetterTappingActivityBody> {
  SoundService soundService;
  AudioCache player;
  AudioPlayer audioPlayer;
  String currentLetter;
  String lastLetter;
  int errors = 0;
  Timer timer;
  bool shouldTap;
  bool lastWasTapped;
  bool wasTapped;
  int letterIndex = 0;
  ActivityStatus activityStatus;
  List<String> alphabet = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
  ];
  List<String> mocaTestList = [
    'F',
    'B',
    'A',
    'C',
    'M',
    'N',
    'A',
    'A',
    'J',
    'K',
    'L',
    'B',
    'A',
    'F',
    'A',
    'K',
    'D',
    'E',
    'A',
    'A',
    'A',
    'J',
    'A',
    'M',
    'O',
    'F',
    'A',
    'A',
    'B'
  ];

  @override
  initState() {
    super.initState();
    soundService = SoundService(alphabet
        .map((item) => ('../packages/research_package/assets/sounds/$item.mp3'))
        .toList());
    currentLetter = 'F';
    lastLetter = '';
    if (widget.activity.includeInstructions) {
      activityStatus = ActivityStatus.Instruction;
      widget.eventLogger.instructionStarted();
    } else {
      activityStatus = ActivityStatus.Test;
      widget.eventLogger.testStarted();
      startTest();
    }
  }

  void startTest() async {
    widget.eventLogger.instructionEnded();
    widget.eventLogger.testStarted();
    setState(() {
      activityStatus = ActivityStatus.Test;
    });
    await Future.delayed(Duration(seconds: 2));
    for (String letter in mocaTestList) {
      if (!this.mounted) break;
      soundService
          .play('../packages/research_package/assets/sounds/$letter.mp3');
      updateLetter(letter);
      await Future.delayed(Duration(milliseconds: 1000));
      if (letterIndex < 29) letterIndex += 1;
    }
    updateLetter('');
    if (this.mounted) {
      widget.onResultChange(errors);
      widget.eventLogger.testEnded();
      if (widget.activity.includeResults) {
        widget.eventLogger.resultsShown();
        setState(() {
          activityStatus = ActivityStatus.Result;
        });
      }
    }
  }

  void updateLetter(String newLetter) {
    if (lastLetter == 'A' && !lastWasTapped) {
      errors += 1;
      String s;
      if (letterIndex == mocaTestList.length) {
        s = '${mocaTestList.getRange(0, letterIndex - 2)} >A< ${mocaTestList.getRange(letterIndex - 1, mocaTestList.length)}';
      } else {
        print(letterIndex);
        s = '${mocaTestList.getRange(0, letterIndex - 2)} >A< ${mocaTestList.getRange(letterIndex - 1, mocaTestList.length)}';
      }
      widget.eventLogger
          .addWrongGesture('Missed button tap', 'Did not press button on: $s');
    }
    lastWasTapped = wasTapped;
    wasTapped = false;
    lastLetter = currentLetter;
    currentLetter = newLetter;
  }

  @override
  Widget build(BuildContext context) {
    switch (activityStatus) {
      case ActivityStatus.Instruction:
        return Column(
          //entry screen with rules and start button
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Turn your sound on! Then, tap the button on the next screen, whenever you hear the letter "A" being said.',
                style: TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 20,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width / 1.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                            'packages/research_package/assets/images/Letterintro.png'))),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                onPressed: () {
                  startTest();
                },
                child: Text(
                  'Ready',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        );
      case ActivityStatus.Test:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 100,
              height: 60,
              child: OutlineButton(
                child: Text('A'),
                onPressed: () {
                  // X - X
                  if (currentLetter != 'A' && lastLetter != 'A') {
                    errors += 1;
                    String s =
                        '${(letterIndex > 0) ? mocaTestList.getRange(0, letterIndex) : ''}' +
                            '>$currentLetter<' +
                            '${mocaTestList.getRange(letterIndex + 1, mocaTestList.length)}';
                    widget.eventLogger.addWrongGesture(
                        'Button tap', 'Pressed button on wrong letter: $s');
                  }
                  // A - A
                  if (lastLetter == 'A' && currentLetter == 'A') {
                    if (!lastWasTapped) {
                      widget.eventLogger.addCorrectGesture('Button tap',
                          'Tapped letter with a delay: ${mocaTestList.getRange(0, letterIndex - 1)} >A< ${mocaTestList.getRange(letterIndex, mocaTestList.length)}');
                      lastWasTapped = true;
                    } else if (lastWasTapped && !wasTapped) {
                      widget.eventLogger.addCorrectGesture('Button tap',
                          'Tapped letter without delay: ${mocaTestList.getRange(0, letterIndex)} >A< ${mocaTestList.getRange(letterIndex + 1, mocaTestList.length)}');
                      wasTapped = true;
                    } else {
                      errors += 1;
                      widget.eventLogger.addWrongGesture('Button tap',
                          'Tapped letter too many times: ${mocaTestList.getRange(0, letterIndex)} >A< ${mocaTestList.getRange(letterIndex + 1, mocaTestList.length)}');
                    }
                  }
                  // A - X
                  if (lastLetter == 'A' && currentLetter != 'A') {
                    if (lastWasTapped) {
                      errors += 1;
                      widget.eventLogger.addWrongGesture('Button tap',
                          'Tapped letter too many times: ${mocaTestList.getRange(0, letterIndex - 1)} >A< ${mocaTestList.getRange(letterIndex, mocaTestList.length)}');
//                      print(
//                          'Error at $lastLetter $currentLetter - Tapped last letter as it was A, but it was already tapped');
                    } else {
                      lastWasTapped = true;
                      widget.eventLogger.addCorrectGesture('Button tap',
                          'Tapped letter with a delay: ${mocaTestList.getRange(0, letterIndex - 1)} >A< ${mocaTestList.getRange(letterIndex, mocaTestList.length)}');
                    }
                  }
                  // X - A
                  if (lastLetter != 'A' && currentLetter == 'A') {
                    if (wasTapped) {
                      errors += 1;
                      widget.eventLogger.addWrongGesture('Button tap',
                          'Tapped letter too many times: ${mocaTestList.getRange(0, letterIndex - 1)} >A< ${mocaTestList.getRange(letterIndex + 1, mocaTestList.length)}');
//                      print(
//                          'Error at $lastLetter $currentLetter - Tapped current letter A while wasTapped = true');
                    } else {
                      wasTapped = true;
                      widget.eventLogger.addCorrectGesture('Button tap',
                          'Tapped letter without delay: ${mocaTestList.getRange(0, letterIndex)} >A< ${mocaTestList.getRange(letterIndex + 1, mocaTestList.length)}');
                    }
                  }
                },
              ),
            )
          ],
        );
      case ActivityStatus.Result:
        return Container(
          child: Center(
            child: Text(
              'You had $errors mistakes',
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
        );
    }
  }
}

class SoundService {
  final List<String> files;

  SoundService(this.files) {
    player.loadAll(files);
  }

  static final player = AudioCache();

  void play(String path) async {
    await player.play(path, mode: PlayerMode.LOW_LATENCY);
  }
}
