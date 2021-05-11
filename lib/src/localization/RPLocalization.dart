part of research_package_ui;

/// Localization support. Use [translate] to translate any text used in
/// RP or the app in general.
class RPLocalizations {
  Map<String, String> _localizedStrings;

  final Locale locale;

  /// Create a localization based on [locale].
  RPLocalizations(this.locale);

  /// Helper method to keep the code in the widgets concise
  /// Localizations are accessed using an [InheritedWidget] "of" syntax
  static RPLocalizations of(BuildContext context) {
    return Localizations.of<RPLocalizations>(context, RPLocalizations);
  }

  /// Load the language JSON file from `assets/lang/${locale.languageCode}.json`
  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  /// Translate [text] to this [locale].
  /// If [text] is not translated, [text] is returned untranslated.
  String translate(String text) =>
      (_localizedStrings.containsKey(text)) ? _localizedStrings[text] : text;

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
    RPLocalizations localizations = RPLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_RPLocalizationsDelegate old) => false;
}
