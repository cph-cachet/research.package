import 'package:flutter/material.dart';
import 'informed_consent_page.dart';
import 'linear_survey_page.dart';
import 'navigable_survey_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:research_package/research_package.dart';
import 'package:flutter_i18n/flutter_i18n.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('da'),
      ],
      localizationsDelegates: [
        FlutterI18nDelegate(
          translationLoader: FileTranslationLoader(),
          missingTranslationHandler: (key, locale) {
            print(
                "--- App : Missing Key: $key, languageCode: ${locale.languageCode}");
          },
        ),

        //For Research Package
        // FlutterI18nDelegate(
        //   translationLoader: FileTranslationLoader(basePath: 'assets/lang'),
        //   missingTranslationHandler: (key, locale) {
        //     print(
        //         "--- RP : Missing Key: $key, languageCode: ${locale.languageCode}");
        //   },
        // ),

        // Research Package translations
        RPLocalizations.delegate,
        // Built-in localization of basic text for Cupertino widgets
        GlobalCupertinoLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      // Returns a locale which will be used by the app
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode
              /*  && supportedLocale.countryCode == locale.countryCode */
              // TODO: Test on physical iPhone if Locale should use countryCode instead
              ) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      theme: ThemeData.light().copyWith(backgroundColor: Colors.white),
      darkTheme: ThemeData.dark(),
      title: 'Research Package Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Research Package Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
                child: Text(
                  // "Welcome to the Demo App - click below...",
                  FlutterI18n.translate(context, "app_info"),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Informed Consent",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => InformedConsentPage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Survey (Linear)",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LinearSurveyPage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlineButton(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Survey (Branching)",
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavigableSurveyPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Image.asset(
          "assets/images/cachet.png",
          height: 40,
        ),
      )),
    );
  }
}
