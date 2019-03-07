part of research_package_ui;

class RPUIVisualConsentStep extends StatefulWidget {
  RPUIVisualConsentStep({@required this.consentDocument});
  final RPConsentDocument consentDocument;

  @override
  _RPUIVisualConsentStep createState() => _RPUIVisualConsentStep();
}

class _RPUIVisualConsentStep extends State<RPUIVisualConsentStep> {
  int _pageNr = 0;
  bool _lastPage = false;

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
        builder: (context) => ContentRoute(
              title: title,
              content: content,
            ),
      ),
    );
  }

  IconData _iconDataForType(RPConsentSectionType sectionType) {
    switch (sectionType) {
      case RPConsentSectionType.Overview:
        return null;
        break;
      case RPConsentSectionType.DataUse:
        return Icons.search;
        break;
      case RPConsentSectionType.TimeCommitment:
        return Icons.access_time;
        break;
      case RPConsentSectionType.StudySurvey:
        return Icons.format_list_bulleted;
        break;
      case RPConsentSectionType.Withdrawing:
        return Icons.cancel;
        break;
      case RPConsentSectionType.Custom:
        return Icons.access_time;
        break;
      case RPConsentSectionType.DataGathering:
        return Icons.timeline;
        break;
      case RPConsentSectionType.Privacy:
        return Icons.lock_outline;
        break;
      case RPConsentSectionType.StudyTasks:
        return Icons.check_circle_outline;
        break;
      default:
        return null;
    }
  }

  Widget _consentSectionPageBuilder(BuildContext context, int index) {
    RPConsentSection section = widget.consentDocument.sections[index];
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
              style: RPStyles.H1,
              textAlign: TextAlign.center,
            ),
            Icon(
              _iconDataForType(section.type),
              size: 80.0,
              color: RPStyles.cachetBlue,
            ),
            Column(
              children: <Widget>[
                Text(
                  section.summary,
                  style: RPStyles.H2,
                  textAlign: TextAlign.center,
                ),
                FlatButton(
                  textTheme: ButtonTextTheme.accent,
                  child: Text("Learn more..."),
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
              FlatButton(
                child: Text("NO"),
                onPressed: () => print("NO"),
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
          RaisedButton(
            padding: EdgeInsets.all(10.0),
            color: RPStyles.cachetBlue,
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
                ? () => blocConsent.changeStatus(StepStatus.Finished) //_pushReview(widget.consentDocument)
                : () => controller.nextPage(duration: Duration(milliseconds: 400), curve: Curves.fastOutSlowIn),
          ),
          FlatButton(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "CANCEL",
              style: TextStyle(color: Colors.redAccent),
            ),
            onPressed: () => _showCancelDialog(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();

    return Theme(
      data: RPStyles.cachetTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Consent"),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: PageView.builder(
                onPageChanged: (pageNr) => _goToNextPage(pageNr),
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

class ContentRoute extends StatelessWidget {
  final String title;
  final String content;

  ContentRoute({this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: RPStyles.cachetTheme,
      child: Scaffold(
        appBar: AppBar(
          title: Text(this.title),
//        backgroundColor: RPStyles.cachetBlue,
        ),
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Text(this.content),
        ),
      ),
    );
  }
}
