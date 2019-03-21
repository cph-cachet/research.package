// The class is based on ORKStep (http://researchkit.org/docs/Classes/ORKStep.html)
// and Step (https://github.com/ResearchStack/ResearchStack/blob/master/backbone/src/main/java/org/researchstack/backbone/step/Step.java)
part of research_package_model;

/*
  This is a universal Step class.
  To implement a new type of step, subclass Step and add your additional properties.

  Whether your app is giving instructions, presenting a form or survey,
  obtaining consent, or running an active task, everything in the ResearchKit framework is a collection of steps ([RPStep] objects),
  which together form a task (an RPTask object)
*/

class RPStep {
  final String _identifier;
  // RS has it but RK doesn't. IMO it's super confusing
  int _stepTitle;
  bool _optional;
  String _title;
  String _text;
  Widget _stepWidget;

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

  String get identifier => _identifier;

  bool get optional => _optional;

  String get title => _title;

  String get text => _text;

  Widget get stepWidget => _stepWidget;

  set optional(bool optional) {
    this._optional = optional;
  }

  set title(String title) {
    this._title = title;
  }

  set text(String text) {
    this._text = text;
  }
}

//TODO: status for finishing a whole task
// Status to be sent to the Bloc so the Task Widget is notified about the navigation
enum StepStatus { Finished, Canceled, Ongoing, Back }
