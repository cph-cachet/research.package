part of research_package_ui;

/// The UI representation of [RPVisualConsentStep]
///
/// In general, you don’t need to instantiate an visual consent step widget directly.
/// Instead, add an visual consent step to a task and present the task using a task widget.
/// When appropriate, the task widget instantiates the visual consent step widget for the step.
class RPUIVisualConsentStep extends StatefulWidget {
  RPUIVisualConsentStep({@required this.consentDocument});
  final RPConsentDocument consentDocument;

  @override
  _RPUIVisualConsentStep createState() => _RPUIVisualConsentStep();
}

class _RPUIVisualConsentStep extends State<RPUIVisualConsentStep> with SingleTickerProviderStateMixin {
  Animation<double> _scale;
  AnimationController _controller;
  int _pageNr = 0;
  bool _lastPage = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    _scale = Tween(begin: 0.6, end: 1.0)
        .chain(
          CurveTween(
            curve: Interval(0.3, 1.0, curve: Curves.easeInOut),
          ),
        )
        .animate(_controller);
  }

  void _goToNextPage(pageNr) {
    setState(() {
      _pageNr = pageNr;
      if (_pageNr == widget.consentDocument.sections.length - 1) {
        _lastPage = true;
      }
    });
  }

  _pushContent(String title, String content) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => _ContentRoute(
          title: title,
          content: content,
        ),
      ),
    );
  }

  Widget _illustrationForType(RPConsentSection section) {
    double iconSize = 80.0;
    
    switch (section.type) {
      case RPConsentSectionType.Overview:
        return null;
        break;
      case RPConsentSectionType.DataUse:
        return Icon(
          Icons.search,
          size: iconSize,
        );
        break;
      case RPConsentSectionType.TimeCommitment:
        return Icon(
          Icons.access_time,
          size: iconSize,
        );
        break;
      case RPConsentSectionType.StudySurvey:
        return Icon(
          Icons.format_list_bulleted,
          size: iconSize,
        );
        break;
      case RPConsentSectionType.Withdrawing:
        return Icon(
          Icons.cancel,
          size: iconSize,
        );
        break;
      case RPConsentSectionType.Custom:
        return section.customIllustration;
        break;
      case RPConsentSectionType.DataGathering:
        return Icon(
          Icons.timeline,
          size: iconSize,
        );
        break;
      case RPConsentSectionType.Privacy:
        return Icon(
          Icons.lock_outline,
          size: iconSize,
        );
        break;
      case RPConsentSectionType.StudyTasks:
        return Icon(
          Icons.check_circle_outline,
          size: iconSize,
        );
        break;
      default:
        return null;
    }
  }

  Widget _consentSectionPageBuilder(BuildContext context, int index) {
    RPConsentSection section = widget.consentDocument.sections[index];
    if (section.title == null) {
      throw Exception(
          "No title has been found for the Consent Section. Probably a Custom Section was attempted to instantiate without providing the title text");
    }

    return Container(
      padding: EdgeInsets.all(10.0),
      //color: Colors.white,
      child: Card(
        elevation: 2.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              section.title,
              style: RPStyles.h1,
              textAlign: TextAlign.center,
            ),
            ScaleTransition(
              scale: _scale,
              child: _illustrationForType(section),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    section.summary,
                    style: RPStyles.h3,
                    textAlign: TextAlign.center,
                  ),
                ),
                FlatButton(
                  textTheme: ButtonTextTheme.accent,
                  child: Text("Learn more..."), // TODO: Localization
                  onPressed: () => _pushContent(
                    section.title,
                    section.content,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigationButtons(PageController controller) {
    void _showCancelDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Are you sure you want to quit?"),
            actions: <Widget>[
              FlatButton(
                child: Text("YES"),
                onPressed: () {
                  Navigator.of(context).pop(); // Pop the popup
                  Navigator.of(context).pop(); // Pop the screen
                },
              ),
              FlatButton(child: Text("NO"), onPressed: () => Navigator.of(context).pop() // Pop the popup,
                  )
            ],
          );
        },
      );
    }

    return Container(
      padding: EdgeInsets.only(bottom: 20.0, top: 10.0),
      child: Column(
        children: <Widget>[
          ButtonTheme(
            minWidth: 150,
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(10.0),
              child: _lastPage
                  ? Text(
                      "SEE SUMMARY",
                      style: RPStyles.whiteText,
                    )
                  : Text(
                      "NEXT",
                      style: RPStyles.whiteText,
                    ),
              onPressed: _lastPage
                  ? () => blocTask.sendStatus(StepStatus.Finished)
                  : () => controller.nextPage(duration: Duration(milliseconds: 400), curve: Curves.fastOutSlowIn),
            ),
          ),
          ButtonTheme(
            minWidth: 150,
            child: FlatButton(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "CANCEL",
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
              onPressed: () => _showCancelDialog(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return WillPopScope(
      onWillPop: () => null,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.consentDocument.title),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                onPageChanged: (pageNr) {
                  _goToNextPage(pageNr);
                  _controller.forward(from: 0.3);
                },
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.consentDocument.sections.length,
                controller: controller,
                itemBuilder: _consentSectionPageBuilder,
              ),
            ),
            _navigationButtons(controller),
          ],
        ),
      ),
    );
  }
}

class _ContentRoute extends StatelessWidget {
  final String title;
  final String content;

  _ContentRoute({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(child: Text(this.content)),
      ),
    );
  }
}
