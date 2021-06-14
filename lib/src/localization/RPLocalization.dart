part of research_package_ui;

/// Localization support. Use [translate] to translate any text used in
/// RP or the app in general.
class RPLocalizations {
  Map<String, String> _translations;
  static final String researchPackagePath = 'research_package/lib/lang';

  final Locale locale;

  /// Create a localization based on [locale].
  RPLocalizations(this.locale);

  /// Helper method to keep the code in the widgets concise
  /// Localizations are accessed using an [InheritedWidget] "of" syntax
  static RPLocalizations of(BuildContext context) {
    return Localizations.of<RPLocalizations>(context, RPLocalizations);
  }

  /// The name used to generate the key to obtain the localization asset.
  String get researchPackageFilename =>
      'packages/$researchPackagePath/${locale.languageCode}.json';

  /// Load the translations for Research Package.
  ///
  /// The translations is a combination of the static names in the package as
  /// provided in [researchPackageFilename] combined with translations of the
  /// text content of informed consent and surveys, as provided by the [loader],
  /// which knows how to load such translations.
  Future<bool> load({LocalizationLoader loader}) async {
    print("$runtimeType - loading '$researchPackageFilename'");
    String jsonString = await rootBundle.loadString(
      researchPackageFilename,
      cache: false,
    );

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _translations =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    if (loader != null) {
      Map<String, String> loadedTranslations = await loader.load(locale);
      _translations.addAll(loadedTranslations);
    }

    print(_translations);

    return true;
  }

  /// Translate [key] to this [locale].
  /// If [key] is not translated, [key] is returned untranslated.
  String translate(String key) {
    print('$key : ${_translations.containsKey(key)}');
    return (_translations.containsKey(key)) ? _translations[key] : key;
  }

  /// A default [LocalizationsDelegate] for [RPLocalizations].
  ///
  /// This default delegate loads translations from the `assets/lang` file path.
  static const LocalizationsDelegate<RPLocalizations> delegate =
      RPLocalizationsDelegate(loader: FileLocalizationLoader());
}

class RPLocalizationsDelegate extends LocalizationsDelegate<RPLocalizations> {
  final LocalizationLoader loader;

  /// Create a [RPLocalizationsDelegate].
  const RPLocalizationsDelegate({this.loader});

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    return true;
  }

  @override
  Future<RPLocalizations> load(Locale locale) async {
    RPLocalizations localizations = RPLocalizations(locale);
    await localizations.load(loader: loader);
    return localizations;
  }

  @override
  bool shouldReload(RPLocalizationsDelegate old) => false;
}

/// Interface for location loaders who knows how to load a translation
/// map for a [Locale].
abstract class LocalizationLoader {
  /// Load translations for [locale].
  Future<Map<String, String>> load(Locale locale);
}

/// A [LocalizationLoader] which can load translations from file
/// bundles. Remember to add the language file assets to the
/// `pubspec.yaml` file.
class FileLocalizationLoader implements LocalizationLoader {
  final String basePath;

  /// Create a file location loader.
  /// Loads from `assets/lang` per default.
  const FileLocalizationLoader({this.basePath = 'assets/lang'});

  @override
  Future<Map<String, String>> load(Locale locale) async {
    print("$runtimeType - loading '$locale'");
    String jsonString = await rootBundle.loadString(
      '$basePath/${locale.languageCode}.json',
    );

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    Map<String, String> translations =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return translations;
  }
}
