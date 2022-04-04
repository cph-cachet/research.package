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
  late RPConsentSignatureResult consentSignatureResult;
  RPSignatureResult? signatureResult;
  late RPStepResult result;

  @override
  void initState() {
    // Instantiate result so the counter starts
    RPAnswerFormat? af;
    try {
      af = (widget.step as RPQuestionStep).answerFormat;
    } catch (e) {
      print(e);
    }
    result = RPStepResult(identifier: widget.step.identifier, answerFormat: af);
    result.questionTitle = widget.step.consentDocument.title;
    super.initState();
  }

  void _setSignatureResult(RPSignatureResult? result) {
    setState(() {
      signatureResult = result;
    });
    createAndSendResult();
  }

  @override
  void createAndSendResult() {
    consentSignatureResult = RPConsentSignatureResult(
        widget.step.identifier, widget.step.consentDocument, signatureResult)
      ..endDate = DateTime.now();

    consentSignatureResult.consentDocument.signatures.isEmpty
        ? result.setResultForIdentifier(
            "no signature collected", consentSignatureResult)
        : result.setResultForIdentifier(
            consentSignatureResult.consentDocument.signatures.first.identifier,
            consentSignatureResult);
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
  final void Function(RPSignatureResult?) onNoSignature;

  _TextPresenterRoute(this.step, this.onNoSignature);

  @override
  __TextPresenterRouteState createState() => __TextPresenterRouteState();
}

class __TextPresenterRouteState extends State<_TextPresenterRoute> {
  Widget _reviewCellBuilder(BuildContext context, int index) {
    RPLocalizations? locale = RPLocalizations.of(context);
    // Return the header as the first element.
    if (index == 0) {
      return Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 44.0),
          child: Text(
            locale?.translate('review_form') ??
                'Review this form below, and tap AGREE if you\'re ready to continue.',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.start,
          ),
        ),
      ]);
    }
    index -= 1;

    if (widget.step.consentDocument.sections[index].type ==
            RPConsentSectionType.PassiveDataCollection ||
        widget.step.consentDocument.sections[index].type ==
            RPConsentSectionType.UserDataCollection) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 4),
              child: Text(
                locale?.translate(
                        widget.step.consentDocument.sections[index].title) ??
                    widget.step.consentDocument.sections[index].title,
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.step.consentDocument.sections[index]
                  .dataTypes! // DataTypes must be provided given a data collection section has been created.
                  .map((e) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 4, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        locale?.translate(e.dataName) ?? e.dataName,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        locale?.translate(e.dataInformation) ??
                            e.dataInformation,
                        style: Theme.of(context).textTheme.bodyText2,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Text(
              locale?.translate(
                      widget.step.consentDocument.sections[index].title) ??
                  widget.step.consentDocument.sections[index].title,
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(color: Theme.of(context).primaryColor),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            locale?.translate(widget.step.consentDocument.sections[index]
                    .summary!) ?? // Content must be provided given a section has been created that isnt data collection.
                widget.step.consentDocument.sections[index].summary!,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.start,
          ),
          Text(
            locale?.translate(widget.step.consentDocument.sections[index]
                    .content!) ?? // Content must be provided given a section has been created that isnt data collection.
                widget.step.consentDocument.sections[index].content!,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    void _showConsentDialog(VoidCallback onPressedCallback) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title:
                Text(locale?.translate(widget.step.text!) ?? widget.step.text!),
            content: Text(locale?.translate(widget.step.reasonForConsent!) ??
                widget.step.reasonForConsent!),
            actions: <Widget>[
              OutlinedButton(
                child: Text(
                  locale?.translate('CANCEL') ?? 'CANCEL',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
                child: Text(locale?.translate('AGREE') ?? "AGREE",
                    style: Theme.of(context).textTheme.button),
                onPressed: onPressedCallback,
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: widget.step.consentDocument.sections.length + 1,
          itemBuilder: _reviewCellBuilder,
        ),
      ),
      persistentFooterButtons: <Widget>[
        OutlinedButton(
          child: Text(
            locale?.translate('DISAGREE') ?? 'DISAGREE',
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            blocTask.sendStatus(RPStepStatus.Canceled);
          },
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).primaryColor),
          ),
          child: Text(
            locale?.translate('AGREE') ?? "AGREE",
            style: Theme.of(context).textTheme.button,
          ),
          onPressed: () {
            _showConsentDialog(
              widget.step.consentDocument.signatures.isNotEmpty
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
                      blocTask.sendStatus(RPStepStatus.Finished);
                    },
            );
          },
        ),
      ],
    );
  }
}

class _SignatureRoute extends StatefulWidget {
  final RPConsentSignature _consentSignature;
  final void Function(RPSignatureResult) _onFinished;

  _SignatureRoute(_, this._consentSignature, this._onFinished);

  @override
  _SignatureRouteState createState() => _SignatureRouteState();
}

class _SignatureRouteState extends State<_SignatureRoute> {
  late bool _isNameFilled;
  late bool _isSignatureAdded;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  final SignatureController _signatureController = SignatureController(
    penStrokeWidth: 4,
    penColor: Colors.red,
    exportBackgroundColor: Colors.blue,
  );
  late Signature _signature;

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
    RPLocalizations? locale = RPLocalizations.of(context);
    final node = FocusScope.of(context);
    return Column(
      children: <Widget>[
        TextFormField(
          autofocus: true,
          textInputAction: TextInputAction.next,
          onEditingComplete: () => node.nextFocus(),
          controller: _firstNameController,
          decoration: InputDecoration(
            labelText: locale?.translate('first_name') ?? "First Name",
          ),
        ),
        TextFormField(
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) => node.unfocus(),
          controller: _lastNameController,
          decoration: InputDecoration(
              labelText: locale?.translate('last_name') ?? "Last Name"),
        ),
      ],
    );
  }

  Widget _signingField(BuildContext context) {
    RPLocalizations? locale = RPLocalizations.of(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            Text(
              locale?.translate('sign_with_finger') ??
                  'Please sign using your finger on the box below',
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                child: _signatureCanvas(),
              ),
            ),
            OutlinedButton(
              child: Text(
                locale?.translate('clear') ?? 'Clear',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
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
    RPLocalizations? locale = RPLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: ListView(
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
      ),
      persistentFooterButtons: <Widget>[
        ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
          child: Text(
            locale?.translate('NEXT') ?? "NEXT",
            style: Theme.of(context).primaryTextTheme.button,
          ),
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
                  blocTask.sendStatus(RPStepStatus.Finished);
                }
              : null,
        ),
        //),
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
