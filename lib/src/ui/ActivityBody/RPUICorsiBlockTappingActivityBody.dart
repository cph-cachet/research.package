part of research_package_ui;

class RPUICorsiBlockTappingActivityBody extends StatefulWidget {
  final RPCorsiBlockTappingActivity activity;
  final Function(dynamic) onResultChange;
  final RPActivityEventLogger eventLogger;

  RPUICorsiBlockTappingActivityBody(
      this.activity, this.eventLogger, this.onResultChange);

  @override
  _RPUICorsiBlockTappingActivityBodyState createState() =>
      _RPUICorsiBlockTappingActivityBodyState();
}

class _RPUICorsiBlockTappingActivityBodyState
    extends State<RPUICorsiBlockTappingActivityBody> {
  ActivityStatus activityStatus;
  int corsiSpan = 0;
  int highlightedBlockID;
  List<int> blocks;
  List<int> tapOrder = [];
  bool readyForTap = false;
  bool finishedTask = false;
  bool failedLast = false;
  String taskInfo = '';
  int numberOfBlocks = 2;

  @override
  initState() {
    super.initState();
    blocks = List.generate(9, (index) => index);
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
    setState(() {
      taskInfo = 'Wait';
      readyForTap = false;
      tapOrder.clear();
      blocks.shuffle();
    });
    await Future.delayed(Duration(seconds: 1));
    for (int i = 0; i < numberOfBlocks; i++) {
      if (activityStatus == ActivityStatus.Test && this.mounted) {
        setState(() {
          highlightedBlockID = blocks[i];
        });
      }
      await Future.delayed(Duration(milliseconds: 1000));
    }
    if (activityStatus == ActivityStatus.Test && this.mounted) {
      setState(() {
        highlightedBlockID = null;
        readyForTap = true;
        taskInfo = 'Go';
      });
    }
  }

  void onBlockTap(int index) async {
    setState(() {
      tapOrder.add(index);
    });
    if (tapOrder.length == numberOfBlocks) {
      finishedTask = true;
      bool wasCorrect = true;
      for (int x = 0; x < numberOfBlocks; x++) {
        if (tapOrder[x] != blocks[x]) wasCorrect = false;
      }
      if (!wasCorrect) {
        if (failedLast) {
          widget.eventLogger.addWrongGesture('Button tap',
              'Test Finished after second fail - Tapped the order: ${tapOrder}. The correct order was: ${blocks.getRange(0, numberOfBlocks)}');
          setState(() {
            taskInfo = 'Finished';
          });
          await Future.delayed(Duration(milliseconds: 700));
          this.widget.onResultChange(corsiSpan);
          widget.eventLogger.testEnded();
          if (widget.activity.includeResults) {
            widget.eventLogger.resultsShown();
            setState(() {
              activityStatus = ActivityStatus.Result;
            });
          }
        } else {
          widget.eventLogger.addWrongGesture('Button tap',
              'Failed first try - Tapped the order: ${tapOrder}. The correct order was: ${blocks.getRange(0, numberOfBlocks)}');
          failedLast = true;
          setState(() {
            taskInfo = 'Try again';
          });
          await Future.delayed(Duration(milliseconds: 700));
          startTest();
        }
      } else {
        widget.eventLogger.addCorrectGesture('Button tap',
            'Succeeded test in ${!failedLast ? 'first' : 'second'} try. Tap order was: $tapOrder');
        setState(() {
          failedLast = false;
          taskInfo = 'Well done';
        });
        corsiSpan = numberOfBlocks;
        numberOfBlocks++;
        await Future.delayed(Duration(milliseconds: 700));
        startTest();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (activityStatus) {
      case ActivityStatus.Instruction:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'You will see 9 tiles. An increasing number of the tiles will be highlighted in order. When the light in the top of the screen is green, and reads "go", you should press the blocks in the same order as they were highlighted.',
                style: TextStyle(fontSize: 20),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
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
                            'packages/research_package/assets/images/Corsiintro.png'))),
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
                  widget.eventLogger.instructionEnded();
                  widget.eventLogger.testStarted();
                  setState(() {
                    activityStatus = ActivityStatus.Test;
                  });
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
        break;
      case ActivityStatus.Test:
        return Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 70,
                width: 200,
                child: Center(
                  child: Text(
                    taskInfo,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                color: readyForTap ? Colors.green : Colors.red,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_makeButton(0), _makeButton(1)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_makeButton(2), _makeButton(3)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_makeButton(4), _makeButton(5), _makeButton(6)],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_makeButton(7), _makeButton(8)],
              ),
            ],
          ),
        );
        break;
      case ActivityStatus.Result:
        return Center(
          child: Text(
            'Your Corsi Span was $corsiSpan',
            style: TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
        );
      default:
        return Container();
    }
  }

  Widget _makeButton(int buttonNum) {
    return InkWell(
      child: Container(
        height: 60,
        width: 60,
        color: highlightedBlockID == buttonNum ? Colors.red : Colors.blue,
        child: Center(
          child: tapOrder.contains(buttonNum) ? Icon(Icons.check) : null,
        ),
      ),
      onTap: readyForTap
          ? () {
              onBlockTap(buttonNum);
            }
          : null,
    );
  }
}
