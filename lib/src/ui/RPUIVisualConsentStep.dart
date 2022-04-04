part of research_package_ui;

/// The UI representation of [RPVisualConsentStep]
///
/// In general, you don’t need to instantiate an visual consent step widget directly.
/// Instead, add an visual consent step to a task and present the task using a task widget.
/// When appropriate, the task widget instantiates the visual consent step widget for the step.
class RPUIVisualConsentStep extends StatefulWidget {
  RPUIVisualConsentStep({required this.consentDocument});
  final RPConsentDocument consentDocument;

  @override
  _RPUIVisualConsentStep createState() => _RPUIVisualConsentStep();
}

class _RPUIVisualConsentStep extends State<RPUIVisualConsentStep>
    with SingleTickerProviderStateMixin {
  int _pageNr = 0;
  bool _lastPage = false;

  @override
  void initState() {
    super.initState();
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
        RPLocalizations? locale = RPLocalizations.of(context);
        return AlertDialog(
          content: Text(locale?.translate('quit_confirmation') ??
              "Are you sure you want to quit?"),
          actions: <Widget>[
            OutlinedButton(
              child: Text(
                locale?.translate('YES') ?? "YES",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Pop the popup
                Navigator.of(context).pop(); // Pop the screen
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text(
                  RPLocalizations.of(context)?.translate('NO') ?? 'NO',
                  style: Theme.of(context).primaryTextTheme.button,
                ),
                onPressed: () => Navigator.of(context).pop() // Pop the popup,
                )
          ],
        );
      },
    );
  }

  Widget _illustrationForType(RPConsentSection section) {
    const double iconSize = 80.0;
    // const double largeIconSize = 200.0;

    switch (section.type) {
      case RPConsentSectionType.Overview:
        return Image.asset(
          'assets/icons/handshake.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.DataUse:
        return Image.asset(
          'assets/icons/document.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.TimeCommitment:
        return Image.asset(
          'assets/icons/deadline.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.StudySurvey:
        return Image.asset(
          'assets/icons/analysis.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Withdrawing:
        return Image.asset(
          'assets/icons/networking.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Custom:
        return section.customIllustration ?? Container();
      case RPConsentSectionType.DataGathering:
        return Image.asset(
          'assets/icons/management.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Privacy:
        return Image.asset(
          'assets/icons/archive.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.StudyTasks:
        return Image.asset(
          'assets/icons/task.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Welcome:
        return Image.asset(
          'assets/icons/handshake.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.AboutUs:
        return Image.asset(
          'assets/icons/id.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Goals:
        return Image.asset(
          'assets/icons/target.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Benefits:
        return Image.asset(
          'assets/icons/analysis.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.DataHandling:
        return Image.asset(
          'assets/icons/archive.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Duration:
        return Image.asset(
          'assets/icons/deadline.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.YourRights:
        return Image.asset(
          'assets/icons/networking.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Location:
        return Image.asset(
          'assets/icons/location.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      case RPConsentSectionType.Health:
        return Image.asset(
          'assets/icons/health.png',
          package: 'research_package',
          width: iconSize,
          height: iconSize,
        );
      default:
        return Container();
    }
  }

  Widget _consentSectionPageBuilder(BuildContext context, int index) {
    RPConsentSection section = widget.consentDocument.sections[index];
    RPLocalizations? locale = RPLocalizations.of(context);

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
              locale?.translate(section.summary!) ?? section.summary!,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: section.dataTypes!.length,
                itemBuilder: (context, index) {
                  return DataCollectionListItem(section.dataTypes![index]);
                },
              ),
            ),
          ],
        ),
      );
    } else
      return Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Stack(
                children: [
                  SizedBox(
                    child: _illustrationForType(section),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.25,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  locale?.translate(section.title) ?? section.title,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 5),
                Text(locale?.translate(section.summary!) ?? section.summary!,
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () => _pushContent(
                    section.title,
                    section.content!,
                  ),
                  child: Text(
                      RPLocalizations.of(context)?.translate('learn_more') ??
                          "Learn more...",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Theme.of(context).primaryColor)),
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
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: () => _showCancelDialog(),
          ),
          TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Theme.of(context).primaryColor),
            ),
            child: _lastPage
                ? Text(
                    RPLocalizations.of(context)?.translate('SEE_SUMMARY') ??
                        "SEE SUMMARY",
                    style: TextStyle(color: Colors.white),
                  )
                : Text(
                    RPLocalizations.of(context)?.translate('NEXT') ?? "NEXT",
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  ),
            onPressed: _lastPage
                ? () => blocTask.sendStatus(RPStepStatus.Finished)
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
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  onPageChanged: (pageNr) {
                    _goToNextPage(pageNr);
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

  _ContentRoute({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          SizedBox(height: 35),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.clear,
                    color: Theme.of(context).primaryColor, size: 30),
                onPressed: () => Navigator.of(context).pop(),
              ),
              SizedBox(width: 5),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  locale?.translate(this.content) ?? this.content,
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ),
        ],
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
    RPLocalizations? locale = RPLocalizations.of(context);
    return Container(
      child: ExpansionTile(
        expandedAlignment: Alignment.centerLeft,
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
