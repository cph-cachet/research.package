import 'package:flutter/material.dart';
import 'informed_consent_page.dart';
import 'linear_survey_page.dart';
import 'navigable_survey_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(primaryColor: Colors.deepPurple, accentColor: Colors.deepOrangeAccent),
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
                padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 8),
                child: Text(
                  "With Research Package you can obtain informed consent, create surveys and collect their results",
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => InformedConsentPage()));
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LinearSurveyPage()));
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
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NavigableSurveyPage()));
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
