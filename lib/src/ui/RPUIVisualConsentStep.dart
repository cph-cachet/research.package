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

class _RPUIVisualConsentStep extends State<RPUIVisualConsentStep>
    with SingleTickerProviderStateMixin {
  Animation<double> _scale;
  AnimationController _controller;
  int _pageNr = 0;
  bool _lastPage = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);
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

  void _showCancelDialog() {
    showDialog(
      context: context,
      builder: (context) {
        RPLocalizations locale = RPLocalizations.of(context);
        return AlertDialog(
          content: Text(locale?.translate('quit_confirmation') ??
              'Are you sure you want to quit?'),
          actions: <Widget>[
            OutlinedButton(
              child: Text(locale?.translate('YES') ?? "YES"),
              onPressed: () {
                Navigator.of(context).pop(); // Pop the popup
                Navigator.of(context).pop(); // Pop the screen
              },
            ),
            ElevatedButton(
                child: Text(locale?.translate('NO') ?? 'NO'),
                onPressed: () => Navigator.of(context).pop() // Pop the popup,
                )
          ],
        );
      },
    );
  }

  Widget _carouselBar() {
    return Container(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Spacer
          // TODO:
          Expanded(
            child: Container(),
            flex: 1,
          ),
          // Carousel indicator
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.consentDocument.sections.map(
                (section) {
                  var index = widget.consentDocument.sections.indexOf(section);
                  return Container(
                    width: 7.0,
                    height: 7.0,
                    margin: EdgeInsets.symmetric(horizontal: 6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index <= _pageNr
                          ? Theme.of(context).accentColor
                          : Theme.of(context).unselectedWidgetColor,
                    ),
                  );
                },
              ).toList(),
            ),
          ),
          // Close button
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(
                Icons.highlight_off,
                color: Theme.of(context).accentColor,
              ),
              onPressed: _showCancelDialog,
            ),
          ),
        ],
      ),
    );
  }

  Widget _illustrationForType(RPConsentSection section) {
    const double iconSize = 80.0;
    const double largeIconSize = 200.0;

    switch (section.type) {
      case RPConsentSectionType.Overview:
        return Image.asset(
          'assets/icons/handshake.png',
          package: 'research_package',
          width: largeIconSize,
          height: largeIconSize,
        );
        break;
      case RPConsentSectionType.DataUse:
        return Image.asset(
          'assets/icons/document.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.TimeCommitment:
        return Image.asset(
          'assets/icons/deadline.png',
          package: 'research_package',
          width: largeIconSize,
          height: largeIconSize,
        );
        break;
      case RPConsentSectionType.StudySurvey:
        return Image.asset(
          'assets/icons/analysis.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.Withdrawing:
        return Image.asset(
          'assets/icons/networking.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.Custom:
        return section.customIllustration;
        break;
      case RPConsentSectionType.DataGathering:
        return Image.asset(
          'assets/icons/management.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.Privacy:
        return Image.asset(
          'assets/icons/archive.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.StudyTasks:
        return Image.asset(
          'assets/icons/task.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.Welcome:
        return Image.asset(
          'assets/icons/handshake.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.AboutUs:
        return Image.asset(
          'assets/icons/id.png',
          package: 'research_package',
          width: largeIconSize,
          height: largeIconSize,
        );
        break;
      case RPConsentSectionType.Goals:
        return Image.asset(
          'assets/icons/target.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.Benefits:
        return Image.asset(
          'assets/icons/analysis.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.DataHandling:
        return Image.asset(
          'assets/icons/archive.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.Duration:
        return Image.asset(
          'assets/icons/deadline.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      case RPConsentSectionType.YourRights:
        return Image.asset(
          'assets/icons/networking.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
        break;
      default:
        return null;
    }
  }

  Widget _consentSectionPageBuilder(BuildContext context, int index) {
    RPConsentSection section = widget.consentDocument.sections[index];
    RPLocalizations locale = RPLocalizations.of(context);
    if (section.title == null) {
      // TODO: Why can such a section be instantiated when it later leads to exceptions?
      throw Exception(
          'No title has been found for the Consent Section. Probably a Custom Section was attempted to instantiate without providing the title text');
    }

    // Display the list builder if type is of these types otherwise show normal.
    if (section.type == RPConsentSectionType.UserDataCollection ||
        section.type == RPConsentSectionType.PassiveDataCollection) {
      return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                locale?.translate(section.title) ?? section.title,
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              locale?.translate(section.summary) ?? section.summary,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: section.dataTypes.length,
                itemBuilder: (context, index) {
                  return DataCollectionListItem(section.dataTypes[index]);
                },
              ),
            ),
          ],
        ),
      );
    } else
      return Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: ScaleTransition(
                scale: _scale,
                child: _illustrationForType(section),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                  child: Text(
                    locale?.translate(section.title) ?? section.title,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.start,
                  ),
                ),
                SingleChildScrollView(
                  child: Text(
                    locale?.translate(section.summary) ?? section.summary,
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.start,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: OutlinedButton.icon(
                    icon: Icon(Icons.help),
                    label: Text(
                      locale?.translate('Learn more...') ?? 'Learn more...',
                    ),
                    onPressed: () => _pushContent(
                      section.title,
                      section.content,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }

  Widget _navigationButtons(PageController controller) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0, top: 10.0, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          OutlinedButton(
            child: Text(
              RPLocalizations.of(context)?.translate('CANCEL') ?? 'CANCEL',
            ),
            onPressed: () => _showCancelDialog(),
          ),
          ElevatedButton(
            child: _lastPage
                ? Text(
                    RPLocalizations.of(context)?.translate('see_summary') ??
                        'SEE SUMMARY',
                  )
                : Text(
                    RPLocalizations.of(context)?.translate('next') ?? 'NEXT',
                  ),
            onPressed: _lastPage
                ? () => blocTask.sendStatus(StepStatus.Finished)
                : () => controller.nextPage(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn),
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
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _carouselBar(),
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
    RPLocalizations locale = RPLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale?.translate(this.title) ?? this.title),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
            child: Text(
          locale?.translate(this.content) ?? this.content,
          style: Theme.of(context).textTheme.bodyText1,
        )),
      ),
    );
  }
}

class DataCollectionListItem extends StatefulWidget {
  final RPDataTypeSection dataTypeSection;

  DataCollectionListItem(this.dataTypeSection);
  @override
  _DataCollectionListItemState createState() => _DataCollectionListItemState();
}

class _DataCollectionListItemState extends State<DataCollectionListItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Container(
      child: ExpansionTile(
        title: Text(
          locale?.translate(widget.dataTypeSection.dataName) ??
              widget.dataTypeSection.dataName,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.start,
        ),
        childrenPadding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
        children: [
          Text(
            locale?.translate(widget.dataTypeSection.dataInformation) ??
                widget.dataTypeSection.dataInformation,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
