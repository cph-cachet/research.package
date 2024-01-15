import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:research_package/research_package.dart';

import 'informed_consent_page.dart';
import 'linear_survey_page.dart';
import 'navigable_survey_page.dart';

Future main() async {
  // initialize cognition package
  // only used if you load a cognition configuration from a json file
  ResearchPackage.ensureInitialized();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en'),
        Locale('da'),
        Locale('fr'),
      ],
      localizationsDelegates: [
        // Research Package translations - supports translation of both the
        // RP-specific text as well as app-specific text.
        //  - translations of the RP text is part of the RP Flutter package
        //  - the translations of app text is located in the 'assets/lang/' folder
        //  - the translations of informed consent and surveys are part of the
        //    app text and also included in the the 'assets/lang/' files
        //  - note that only some text is translated -- illustrates that RP
        //    works both with and without translation.
        RPLocalizations.delegate,

        // Research Package translations - supports translation of both;
        //  - the RP-specific text
        //  - app-specific text using the [AssetLocalizationLoader]
        //  - a map-based localization loader [MapLocalizationLoader]
        // RPLocalizationsDelegate(loaders: [
        //   AssetLocalizationLoader(),
        //   MapLocalizationLoader({
        //     'en': {'app_name': 'Research Package Demo'},
        //     'da': {'app_name': 'Research Package Demonstration'},
        //     'fr': {'app_name': 'Demonstration de Research Package'},
        //   }),
        // ]),

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
          if (supportedLocale.languageCode == locale!.languageCode) {
            return supportedLocale;
          }
        }
        // if the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      theme: ThemeData.light(),
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
    RPLocalizations? locale = RPLocalizations.of(context);

    return Scaffold(
      backgroundColor: Color(0xff003F6E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(height: 50),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Image.asset(
                "assets/images/carp_logo.png",
                height: 80,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
                child: Column(
                  children: <Widget>[
                    Text(
                      locale?.translate("home.welcome") ?? "Welcome",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Container(height: 5),
                    Text(
                      locale?.translate("home.questions") ?? "Questions?",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    Container(height: 5),
                    Text(
                      "cph_cachet@gmail.com",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                    //Container(height: 50),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffC32C39),
                        fixedSize: const Size(300, 60),
                      ),
                      child: Text(
                        locale?.translate("informed_consent") ??
                            "Informed Consent",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<dynamic>(
                            builder: (context) => InformedConsentPage()));
                      },
                    ),
                    Container(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffC32C39),
                        fixedSize: const Size(300, 60),
                      ),
                      child: Text(
                        locale?.translate("linear_survey") ?? "Linear Survey",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<dynamic>(
                            builder: (context) => LinearSurveyPage()));
                      },
                    ),
                    Container(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffC32C39),
                        fixedSize: const Size(300, 60),
                      ),
                      child: Text(
                        locale?.translate("branching_survey") ??
                            "Branching Survey",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute<dynamic>(
                            builder: (context) => NavigableSurveyPage()));
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Image.asset(
          "assets/images/cachet-logo-white.png",
          height: 50,
        ),
      )),
    );
  }
}
