part of research_package_ui;

class RPUIConsentReviewStep extends StatefulWidget {
  final RPConsentDocument consentDocument;
  final String text;
  final String reasonForConsent;

  RPUIConsentReviewStep({
    @required this.consentDocument,
    @required this.text,
    @required this.reasonForConsent,
  });

  @override
  _RPUIConsentReviewStepState createState() => _RPUIConsentReviewStepState();
}

class _RPUIConsentReviewStepState extends State<RPUIConsentReviewStep> {
  Widget _reviewCellBuilder(BuildContext context, int index) {
    if (index == 0) {
      // return the header
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Review',
              style: RPStyles.H1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 64.0),
            child: Text(
              'Review this form below, and tap AGREE if you\'re ready to continue.',
              style: RPStyles.bodyText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }
    index -= 1;

    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              widget.consentDocument.sections[index].title,
              style: RPStyles.H2,
            ),
          ),
          Text(
            widget.consentDocument.sections[index].content,
            style: RPStyles.bodyText,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void _showConsentPopUp<T>({BuildContext context, Widget child}) {
      showDialog<T>(
        context: context,
        builder: (BuildContext context) => child,
      ).then<void>((T value) {
        // The value passed to Navigator.pop() or null.
        if (value != null) {
          print("pressed");
        }
      });
    }

    return Theme(
      data: Theme.of(context).copyWith(primaryColor: RPStyles.cachetBlue),
      child: Scaffold(
        appBar:
            RPStyles.RPAppBar(text: widget.consentDocument.signaturePageTitle),
        body: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: widget.consentDocument.sections.length + 1,
          itemBuilder: _reviewCellBuilder,
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(
              child: Text(
                "DISAGREE",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              onPressed: () => blocConsent.changeStatus(StepStatus.Canceled)),
          FlatButton(
            child: Text("AGREE"),
            onPressed: () => _showConsentPopUp(
                context: context,
                child: AlertDialog(
                  title: Text(widget.text),
                  content: Text(widget.reasonForConsent),
                  actions: <Widget>[
                    FlatButton(
                      child: Text("CANCEL"),
                      onPressed: () => print("CANCEL"),
                    ),
                    FlatButton(
                      child: Text("AGREE"),
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return NameInputRoute(
                            signaturePageTitle:
                                widget.consentDocument.signaturePageTitle,
                          );
                        }));
                      },
                      textTheme: ButtonTextTheme.primary,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class NameInputRoute extends StatefulWidget {
  final String signaturePageTitle;
  NameInputRoute({this.signaturePageTitle});

  @override
  _NameInputRouteState createState() => _NameInputRouteState();
}

class _NameInputRouteState extends State<NameInputRoute> {
  bool _isNameFilled;
  bool _isSignatureAdded;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

//  var _signatureCanvas = Signature(
//    height: 200,
//    backgroundColor: Colors.grey,
//  );

  void _checkNameNotEmpty() {
    setState(() {
      _isNameFilled =
          (_firstNameController.text != '' && _lastNameController.text != '');
    });
  }


  @override
  void initState() {
    _isNameFilled = false;
    _isSignatureAdded = false;
    _firstNameController.addListener(_checkNameNotEmpty);
    _lastNameController.addListener(_checkNameNotEmpty);
    super.initState();
  }

  Widget _nameFields() {
    return Column(
      children: <Widget>[
        TextFormField(
          autofocus: true,
          controller: _firstNameController,
          decoration: InputDecoration(
            labelText: "First Name",
          ), //TODO: Localization
        ),
        TextFormField(
          controller: _lastNameController,
          decoration:
              InputDecoration(labelText: "Last Name"), //TODO: Localization
        ),
      ],
    );
  }

  Widget _signingField() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 24.0),
        child: Column(
          children: <Widget>[
            Text(
              'Please sign using your finger in the box below.', //TODO: Localization
              style: RPStyles.bodyText,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Container(), //_signatureCanvas,
            ),
            FlatButton(
              child: Text("CLEAR"),
              onPressed: () => print(''), //_signatureCanvas.clear()
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: RPStyles.cachetBlue),
      child: Scaffold(
        appBar: RPStyles.RPAppBar(text: widget.signaturePageTitle),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            _nameFields(),
            _signingField(),
          ],
        ),
        persistentFooterButtons: <Widget>[
          FlatButton(
            onPressed: _isNameFilled ? () => print('Next') : null,
            child: Text('NEXT'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    super.dispose();
  }
}
