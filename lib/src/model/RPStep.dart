// The class is based on ORKConsentSignature (http://researchkit.org/docs/Classes/ORKStep.html)
// and ConsentSignature (https://github.com/ResearchStack/ResearchStack/blob/master/backbone/src/main/java/org/researchstack/backbone/step/Step.java)
import 'RPTask.dart';

/*
  This is a universal Step class.
  To implement a new type of step, subclass Step and add your additional properties.
*/

class RPStep {
  final String _identifier;
  // RS has it but RK doesn't
  int _stepTitle;
  bool _optional;
  String _title;
  String _text;
  //TODO: Find out how we should manage the layout in flutter
  //class stepLayoutClass


  // The following fields are in RK but not implemented in ResearchStack
  // These options can be developed as needed or removed if we find they are not necessary
  bool _restorable;
  RPTask _task;
  bool _shouldTintImages;
  bool _showsProgress;
  bool _allowsBackNavigation;
  bool _useSurveyMode;

  RPStep(this._identifier);
  RPStep.withTitle(this._identifier, this._title);

  String get getIdentifier => _identifier;

  bool get isOptional => _optional;

  String get getTitle => _title;

  String get getText => _text;

  set setOptional(bool optional) {
    this._optional = optional;
  }

  set setTitle(String title) {
    this._title = title;
  }

  set setText(String text) {
    this._text = text;
  }
}
