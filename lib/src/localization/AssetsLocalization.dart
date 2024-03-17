part of '../../ui.dart';

/// Localization support using assets files.
///
/// Use [translate] to translate any text.
///
/// All translations should be put in the `assets/lang/` folder as json files,
/// one for each local (e.g., `en.json`or `da.json`). Note that only the
/// `languageCode` of a `Locale` is used.
///
/// Remember to add the `assets/lang/` folder to the list of `assets` in the
/// `pubspec.yaml` file like this:
///
/// ```
/// flutter:
///   assets:
///     - assets/lang/
///     ...
/// ```
///
class AssetLocalizations {
  /// A map of available translations for this [locale].
  Map<String, String> translations = {};

  final Locale locale;

  /// Create an assets localization based on [locale].
  AssetLocalizations(this.locale);

  /// Returns the localized resources object of type [AssetLocalizations] for the
  /// widget tree that corresponds to the given [context].
  ///
  /// Returns `null` if no resources object of type [AssetLocalizations] exists within
  /// the given `context`.
  static AssetLocalizations? of(BuildContext context) =>
      Localizations.of<AssetLocalizations>(context, AssetLocalizations);

  /// The file name of the localization asset.
  String get filename => 'assets/lang/${locale.languageCode}.json';

  /// Load the translations from [filename] based on the [locale].
  Future<void> load() async {
    print("$runtimeType - loading '$filename'");

    String jsonString = await rootBundle.loadString(filename, cache: false);

    Map<String, dynamic> jsonMap =
        json.decode(jsonString) as Map<String, dynamic>;
    translations = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  }

  /// Can this [key] be translated by this localization?
  bool canTranslate(String key) => translations.containsKey(key);

  /// Translate [key] to this [locale].
  /// If [key] is not translated, [key] is returned 'as-is'.
  String translate(String key) =>
      (translations.containsKey(key)) ? translations[key]! : key;

  /// A default [LocalizationsDelegate] for [AssetLocalizations].
  ///
  /// This default delegate loads translations from the `assets/lang` file path.
  static const LocalizationsDelegate<AssetLocalizations> delegate =
      AssetLocalizationsDelegate();
}

/// A factory for a set of localized resources of type `AssetLocalizations`,
/// to be loaded by a [Localizations] widget.
class AssetLocalizationsDelegate
    extends LocalizationsDelegate<AssetLocalizations> {
  /// Create a [AssetLocalizationsDelegate].
  const AssetLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // we don't restrict the supported locales here since the user of RP
    // might create his/her own translations
    return true;
  }

  @override
  Future<AssetLocalizations> load(Locale locale) async {
    AssetLocalizations localizations = AssetLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AssetLocalizationsDelegate old) => false;
}
