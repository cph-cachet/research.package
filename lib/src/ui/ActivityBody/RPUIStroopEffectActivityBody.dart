part of research_package_ui;

class RPUIStroopEffectActivityBody extends StatefulWidget {
  final RPStroopEffectActivity activity;
  final Function(dynamic) onResultChange;
  final RPActivityEventLogger eventLogger;

  RPUIStroopEffectActivityBody(
      this.activity, this.eventLogger, this.onResultChange);

  @override
  _RPUIStroopEffectActivityBodyState createState() =>
      _RPUIStroopEffectActivityBodyState();
}

class _RPUIStroopEffectActivityBodyState
    extends State<RPUIStroopEffectActivityBody> {
  ActivityStatus activityStatus;
  int mistakes = 0;
  int correctTaps = 0;
  int totalWords = 0;
  int cWordIndex = 0;
  int wColorIndex = 0;
  final _random = new Random();
  Timer t = new Timer(Duration(seconds: 0),
      () {}); //construct for further control of timer. Cancel at window collapse.
  Timer pulseTimer =
      new Timer(Duration(seconds: 0), () {}); //pulse timer control

  //bool testLive = false; //test going on, screen flag
  //bool testBegin = true; //pre test screen flag
  bool disableButton = false; //makes sure spamming doesn't disturb the test
  bool clicked = false; //boolean to track if the user taps an answer in time
  List<String> possColorsString = [
    'BLUE',
    'GREEN',
    'RED',
    'YELLOW'
  ]; //the two lists are ordered, like in a map.
  //map is not used due to unwanted complexity
  List<Color> possColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.yellow
  ];
  List<Color> backgroundButtons = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];
  String cWord = '';
  Color wColor = Colors.white;

  @override
  initState() {
    super.initState();
    cWordIndex = _random.nextInt(possColorsString.length);
    wColorIndex = _random.nextInt(possColors.length);
    cWord = possColorsString[cWordIndex];
    wColor = possColors[wColorIndex];
    if (widget.activity.includeInstructions) {
      activityStatus = ActivityStatus.Instruction;
      widget.eventLogger.instructionStarted();
    } else {
      activityStatus = ActivityStatus.Test;
      widget.eventLogger.testStarted();
      startTest();
    }
  }

  void startTest() {
    if (this.mounted) {
      widget.eventLogger.instructionEnded();
      widget.eventLogger.testStarted();
      setState(() {
        //change screen
        activityStatus = ActivityStatus.Test;
      });
    }
    Timer(Duration(seconds: widget.activity.lengthOfTest), () {
      //when time is up, change window and set result
      widget.eventLogger.testEnded();
      if (this.mounted) {
        setState(() {});
        widget.onResultChange(
            {"mistakes": mistakes, "correct taps": correctTaps});
        if (widget.activity.includeResults) {
          widget.eventLogger.resultsShown();
          setState(() {
            activityStatus = ActivityStatus.Result;
          });
        }
      }
    });
    wordPulse();
  }

  void wordPulse() async {
    //control pulsation of words and pause between them
    disableButton = true;
    pulseTimer.cancel();
    //make sure window is mounted and that test is live before setting state.
    if (this.mounted && activityStatus == ActivityStatus.Test) {
      setState(() {
        cWord = '----';
        wColor = Colors.black;
        backgroundButtons = [
          Colors.white,
          Colors.white,
          Colors.white,
          Colors.white
        ]; //reset feedback
      });
      await Future.delayed(Duration(
          milliseconds:
              widget.activity.delayTime)); //delay before showing next word
      if (this.mounted && activityStatus == ActivityStatus.Test) {
        setState(() {
          cWordIndex = _random.nextInt(possColorsString.length);
          wColorIndex = _random.nextInt(possColors.length);
          cWord = possColorsString[cWordIndex];
          wColor = possColors[wColorIndex]; //pick word and color for display
        });
      }
      disableButton = false; //make buttons tap-able
    }

    pulseTimer = Timer(Duration(milliseconds: widget.activity.displayTime), () {
      if (activityStatus == ActivityStatus.Test) {
        if (!clicked) {
          //if tap doesnt happen in time, count is a mistake.
          mistakes++;
          totalWords++;
          // totalWords = totalWords + mistakes + correctTaps;
          // totalWords = mistakes + correctTaps;
          String widgetNoTapColor = possColorsString[wColorIndex];
          widget.eventLogger.addWrongGesture('Button tap',
              'No color tapped. The color was $widgetNoTapColor. The word spelled $cWord. Total words passed: $totalWords');
        } else {
          clicked = false;
        }
        wordPulse();
      }
    }); //call wordPulse recursively for periodic timer effect
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
                'Tap the color, of the word you see on screen. E.g. tap the box that says "green" when a green word appears',
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
                            'packages/research_package/assets/images/Stroopintro.png'))),
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
        //main screen for test - contains word and buttons to push
        return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 200,
                      child: Text(
                        cWord,
                        style: TextStyle(fontSize: 45, color: wColor),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _makeButton(0),
                    _makeButton(1),
                    _makeButton(2),
                    _makeButton(3),
                  ])
            ]);
      case ActivityStatus.Result:
        return Container(
            //result screen
            padding: EdgeInsets.all(20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'The test is done!',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Correct answers: $correctTaps',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Wrong answers or missed words: $mistakes',
                          style: TextStyle(fontSize: 22),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 20,
                          textAlign: TextAlign.center,
                        ),
                      ]),
                ]));
    }
  }

  Widget _makeButton(int buttonNum) {
    //make material buttons for possible colors
    String buttonCode = possColorsString[buttonNum];
    return (Container(
        height: 75,
        width: MediaQuery.of(context).size.width / 5,
        child: MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5),
              side: BorderSide(color: Colors.black, width: 3)),
          color: backgroundButtons[
              buttonNum], //set background on buttons for feedback
          onPressed: () {
            String widgetTapColor = possColorsString[wColorIndex];
            if (!disableButton) {
              clicked = true;
              if (wColor == possColors[buttonNum]) {
                //if a button was pressed, produce new word
                correctTaps++;
                totalWords++;
                if (this.mounted && activityStatus == ActivityStatus.Test) {
                  setState(() {
                    backgroundButtons[buttonNum] =
                        Colors.green; //set feedback color
                  });
                  widget.eventLogger.addCorrectGesture('Button tap',
                      'Correct color tapped. The color was $widgetTapColor and the word spelled $cWord. Total words passed: $totalWords');
                }
              } else {
                mistakes++;
                totalWords++;
                if (this.mounted && activityStatus == ActivityStatus.Test) {
                  setState(() {
                    backgroundButtons[buttonNum] = Colors.red;
                  });
                  widget.eventLogger.addWrongGesture('Button tap',
                      'Incorrect color tapped. The color tapped was $buttonCode but should have been $widgetTapColor. The word spelled $cWord. Total words passed: $totalWords');
                }
              }
              //wordPulse(); //this one instantly give new word if something is clicked.
            }
          },
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text('$buttonCode', style: TextStyle(fontSize: 19)),
          ),
        )));
  }
}
