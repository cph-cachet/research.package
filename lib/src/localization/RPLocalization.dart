part of research_package_ui;

class RPLocalizations {
  final Locale locale;

  RPLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static RPLocalizations of(BuildContext context) {
    return Localizations.of<RPLocalizations>(context, RPLocalizations);
  }

  Map<String, String> _localizedStrings;

  Future<bool> load() async {
    // Load the language JSON file from the "lang" folder
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizedStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    if (_localizedStrings[key] == null) print('Translation of $key not found');
    return _localizedStrings[key];
  }

  // Static member to have a simple access to the delegate from the MaterialApp
  static const LocalizationsDelegate<RPLocalizations> delegate =
      _RPLocalizationsDelegate();
}

class _RPLocalizationsDelegate extends LocalizationsDelegate<RPLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _RPLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return true;
  }

  @override
  Future<RPLocalizations> load(Locale locale) async {
    // RPLocalizations class is where the JSON loading actually runs
    RPLocalizations localizations = new RPLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_RPLocalizationsDelegate old) => false;
}
