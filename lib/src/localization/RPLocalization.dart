part of research_package_ui;

/// /// Localization support for Research Package using [LocalizationLoader]
/// configurations.
///
/// Use [translate] to translate any text, like this:
///
/// ```
///  RPLocalizations.of(context).translate('key');
/// ```
///
class RPLocalizations {
  late Map<String, String> _translations;
  static final String assetPath = 'research_package/assets/lang';
  // static final String assetPath = 'assets/lang';

  final Locale locale;

  /// Create a localization based on [locale].
  RPLocalizations(this.locale);

  /// Returns the localized resources object of type [RPLocalizations] for the
  /// widget tree that corresponds to the given [context].
  ///
  /// Returns `null` if no resources object of type [RPLocalizations] exists within
  /// the given `context`.
  static RPLocalizations? of(BuildContext context) =>
      Localizations.of<RPLocalizations>(context, RPLocalizations);

  // String get keyName =>
  //     package == null ? assetName : 'packages/$package/$assetName';

  /// The name used to generate the key to obtain the localization asset.
  String get assetName =>
      // '$assetPath/${locale.languageCode}.json';
      'packages/$assetPath/${locale.languageCode}.json';

  /// Load the translations for Research Package.
  ///
  /// The translations is a combination of the static names in the package as
  /// provided in [assetName] combined with translations of the
  /// text content of informed consent and surveys, as provided by the [loader],
  /// which knows how to load such translations.
  Future<bool> load({LocalizationLoader? loader}) async {
    print("$runtimeType - loading '$assetName'");

    // first load the static translations as part of RP
    String jsonString = await rootBundle.loadString(
      assetName,
      cache: false,
    );

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _translations =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    if (loader != null) {
      Map<String, String> loadedTranslations = await loader.load(locale);
      // merge the two maps
      // note that keys in [_translations] is overwritten with keys in [loadedTranslations]
      // hence, it is possible to overwrite the default translations
      _translations.addAll(loadedTranslations);
    }

    return true;
  }

  /// Translate [key] to this [locale].
  /// If [key] is not translated, [key] is returned untranslated.
  String translate(String key) =>
      (_translations.containsKey(key)) ? _translations[key]! : key;

  /// A default [LocalizationsDelegate] for [RPLocalizations].
  ///
  /// This default delegate loads translations from the `assets/lang` file path.
  static LocalizationsDelegate<RPLocalizations> delegate =
      RPLocalizationsDelegate(loader: FileLocalizationLoader());
}

class RPLocalizationsDelegate extends LocalizationsDelegate<RPLocalizations> {
  final LocalizationLoader loader;
  bool _shouldReload = false;

  /// Create a [RPLocalizationsDelegate].
  RPLocalizationsDelegate({required this.loader});

  @override
  bool isSupported(Locale locale) {
    // we don't restrict the supported locales here since the user of RP
    // might create his/her own translations
    return true;
  }

  @override
  Future<RPLocalizations> load(Locale locale) async {
    RPLocalizations localizations = RPLocalizations(locale);
    await localizations.load(loader: loader);
    _shouldReload = false;
    return localizations;
  }

  /// Mark that this delegate should reload its translations.
  /// Usefull if, for example, downloaded from the network.
  void reload() => _shouldReload = true;

  @override
  bool shouldReload(RPLocalizationsDelegate old) => _shouldReload;
}

/// Interface for location loaders who knows how to load a translation
/// map for a [Locale].
abstract class LocalizationLoader {
  /// Load translations for [locale].
  Future<Map<String, String>> load(Locale locale);
}

/// A [LocalizationLoader] which can load translations from a map.
class MapLocalizationLoader implements LocalizationLoader {
  final Map<String, Map<String, String>> map;

  /// Create a [MapLocalizationLoader] based on the [map].
  /// [map] must map a language code to a map of translations keys
  /// mapped to translations.
  ///
  /// ```json
  ///  {
  ///    'en': {'header':'This is a header', ...},
  ///    'da': {'header':'Dette er en overskrift', ...},
  ///  }
  /// ```
  MapLocalizationLoader(this.map);

  @override
  Future<Map<String, String>> load(Locale locale) async =>
      (map.containsKey(locale.languageCode)) ? map[locale.languageCode]! : {};
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
    String path = '$basePath/${locale.languageCode}.json';
    print("$runtimeType - loading '$path'");
    String jsonString = await rootBundle.loadString(path);

    Map<String, dynamic> jsonMap = json.decode(jsonString);
    Map<String, String> translations =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return translations;
  }
}
