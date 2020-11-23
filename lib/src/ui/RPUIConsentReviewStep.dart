part of research_package_ui;

/// The UI representation of [RPConsentReviewStep]
///
/// You should not need to instantiate a consent review step widget directly.
/// Instead, include a consent review step in a task, and present a task widget for that task.
class RPUIConsentReviewStep extends StatefulWidget {
  final RPConsentReviewStep step;

  RPUIConsentReviewStep(this.step);

  @override
  _RPUIConsentReviewStepState createState() => _RPUIConsentReviewStepState();
}

class _RPUIConsentReviewStepState extends State<RPUIConsentReviewStep>
    with CanSaveResult {
  RPConsentSignatureResult consentSignatureResult;
  RPSignatureResult signatureResult;
  RPStepResult result;

  @override
  void initState() {
    // Instantiate result so the counter starts
    result = RPStepResult.withParams(widget.step);
    super.initState();
  }

  void _setSignatureResult(RPSignatureResult result) {
    setState(() {
      signatureResult = result;
    });
    createAndSendResult();
  }

  @override
  void createAndSendResult() {
    consentSignatureResult = RPConsentSignatureResult.withParams(
        widget.step.identifier, widget.step.consentDocument, signatureResult)
      ..endDate = DateTime.now();

    consentSignatureResult.consentDocument.signatures == null
        ? result.setResultForIdentifier(
            "no signature collected", consentSignatureResult)
        : //TODO: modify identifier to match the id of rpconsentsignature
        result.setResultForIdentifier(
            consentSignatureResult.consentDocument.signatures.first.identifier,
            consentSignatureResult); //TODO: modify identifier to match the id of RPConsentSignature

    blocTask.sendStepResult(result);
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'consent_review/text',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'consent_review/text':
            builder = (BuildContext _) => _TextPresenterRoute(widget.step,
                (signatureResult) => _setSignatureResult(signatureResult));
            break;
          case 'consent_review/signature':
            builder = (BuildContext _) => _SignatureRoute(
                  widget.step.title,
                  widget.step.consentDocument.signatures.first,
                  _setSignatureResult,
                );
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

class _TextPresenterRoute extends StatefulWidget {
  final RPConsentReviewStep step;
  final void Function(RPSignatureResult) onNoSignature;

  _TextPresenterRoute(this.step, this.onNoSignature);

  @override
  __TextPresenterRouteState createState() => __TextPresenterRouteState();
}

class __TextPresenterRouteState extends State<_TextPresenterRoute> {
  Widget _reviewCellBuilder(BuildContext context, int index) {
    RPLocalizations locale = RPLocalizations.of(context);
    // Return the header as the first element.
    if (index == 0) {
      return Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: Text(
              locale?.translate(
                      'Review this form below, and tap AGREE if you\'re ready to continue.') ??
                  'Review this form below, and tap AGREE if you\'re ready to continue.',
              style: TextStyle(fontWeight: FontWeight.w600),
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
              locale?.translate(
                      widget.step.consentDocument.sections[index].title) ??
                  widget.step.consentDocument.sections[index].title,
              style: RPStyles.h2,
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            locale?.translate(
                    widget.step.consentDocument.sections[index].content) ??
                widget.step.consentDocument.sections[index].content,
            style: TextStyle(height: 1.1),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    void _showConsentDialog(VoidCallback onPressedCallback) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:
                Text(locale?.translate(widget.step.text) ?? widget.step.text),
            content: Text(locale?.translate(widget.step.reasonForConsent) ??
                widget.step.reasonForConsent),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  locale?.translate('CANCEL') ?? "CANCEL",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              FlatButton(
                child: Text(
                  locale?.translate('AGREE') ?? "AGREE",
                  style: TextStyle(color: Theme.of(context).accentColor),
                ),
                onPressed: onPressedCallback,
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(locale?.translate('Review') ?? 'Review'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: widget.step.consentDocument.sections.length + 1,
        itemBuilder: _reviewCellBuilder,
      ),
      persistentFooterButtons: <Widget>[
        FlatButton(
          child: Text(
            locale?.translate('DISAGREE') ?? "DISAGREE",
            style: TextStyle(
              color: Theme.of(context).accentColor,
            ),
          ),
          onPressed: () {
            blocTask.sendStatus(StepStatus.Canceled);
          },
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text(
            locale?.translate('AGREE') ?? "AGREE",
            style: RPStyles.whiteText,
          ),
          onPressed: () => _showConsentDialog(
            widget.step.consentDocument.signatures != null
                ? () {
                    // Dismiss pop-up. It uses the root Navigator since it's an overlay
                    Navigator.of(context, rootNavigator: true).pop();
                    Navigator.of(context)
                        .pushReplacementNamed('consent_review/signature');
                  }
                : () {
                    // Dismiss pop-up. It uses the root Navigator since it's an overlay
                    Navigator.of(context, rootNavigator: true).pop();
                    widget.onNoSignature(null);
                    blocTask.sendStatus(StepStatus.Finished);
                  },
          ),
        ),
      ],
    );
  }
}

class _SignatureRoute extends StatefulWidget {
  final String _title;
  final RPConsentSignature _consentSignature;
  final void Function(RPSignatureResult) _onFinished;

  _SignatureRoute(this._title, this._consentSignature, this._onFinished);

  @override
  _SignatureRouteState createState() => _SignatureRouteState();
}

class _SignatureRouteState extends State<_SignatureRoute> {
  bool _isNameFilled;
  bool _isSignatureAdded;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );

  Signature _signature;

  Widget _signatureCanvas() {
    return GestureDetector(
      onTapDown: (e) {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      onPanStart: (e) {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      onTap: () {
        setState(() {
          if (_signatureController.isNotEmpty) {
            _isSignatureAdded = true;
          }
        });
      },
      onPanEnd: (e) {
        setState(() {
          if (_signatureController.isNotEmpty) {
            _isSignatureAdded = true;
          }
        });
      },
      child: Container(
        child: _signature,
      ),
    );
  }

  void _checkNameIsNotEmpty() {
    setState(() {
      _isNameFilled =
          (_firstNameController.text != '' && _lastNameController.text != '');
    });
  }

  @override
  void initState() {
    _signature = Signature(
      controller: _signatureController,
      height: 200,
      width: 300,
      backgroundColor: Colors.transparent,
    );

    widget._consentSignature.requiresSignatureImage
        ? _isSignatureAdded = false
        : _isSignatureAdded = true;
    widget._consentSignature.requiresName
        ? _isNameFilled = false
        : _isNameFilled = true;
    _firstNameController.addListener(_checkNameIsNotEmpty);
    _lastNameController.addListener(_checkNameIsNotEmpty);

    super.initState();
  }

  Widget _nameFields(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Column(
      children: <Widget>[
        TextFormField(
          autofocus: true,
          controller: _firstNameController,
          decoration: InputDecoration(
            labelText: locale?.translate('First Name') ?? "First Name",
          ),
        ),
        TextFormField(
          controller: _lastNameController,
          decoration: InputDecoration(
              labelText: locale?.translate('Last Name') ?? "Last Name"),
        ),
      ],
    );
  }

  Widget _signingField(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 24.0),
        child: Column(
          children: <Widget>[
            Text(
              locale?.translate(
                      'Please sign using your finger on the line below') ??
                  'Please sign using your finger on the line below',
              style: RPStyles.bodyText,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(24.0),
              child: Stack(children: [
                Positioned(
                  bottom: 40,
                  child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.grey),
                ),
                _signatureCanvas(),
              ]),
            ),
            FlatButton(
              child: Text(locale?.translate('Clear') ?? "Clear"),
              onPressed: _isSignatureAdded
                  ? () {
                      _signatureController.clear();
                      setState(() {
                        _isSignatureAdded = false;
                      });
                    }
                  : null,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations locale = RPLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale?.translate(widget._title) ?? widget._title),
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          widget._consentSignature.requiresName
              ? _nameFields(context)
              : Container(),
          widget._consentSignature.requiresSignatureImage
              ? _signingField(context)
              : Container(),
        ],
      ),
      persistentFooterButtons: <Widget>[
        RaisedButton(
          color: Theme.of(context).accentColor,
          textColor: Colors.white,
          onPressed: (_isNameFilled && _isSignatureAdded)
              ? () {
                  if (widget._consentSignature.requiresSignatureImage) {
                    _signatureController.toPngBytes().then(
                      (image) {
                        widget._onFinished(
                          RPSignatureResult.withParams(
                            _firstNameController.value.text,
                            _lastNameController.value.text,
                            // Converting the Uint8List into a string to make it compatible with JSON serialization
                            image.toString(),
                          ),
                        );
                      },
                    );
                  } else {
                    widget._onFinished(
                      RPSignatureResult.withParams(
                        _firstNameController.value.text,
                        _lastNameController.value.text,
                        // Since no signature was asked set the image blob to null
                        null,
                      ),
                    );
                  }
                  blocTask.sendStatus(StepStatus.Finished);
                }
              : null,
          child: Text(locale?.translate('NEXT') ?? 'NEXT'),
        )
      ],
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }
}
