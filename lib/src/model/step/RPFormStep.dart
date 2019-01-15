import 'package:research_package/src/model/step/RPStep.dart';

/*
  FormStep is containing more steps so you can show them on the same screen.
 */

class FormStep extends RPStep {
  List<RPStep> steps;

  FormStep(String identifier, this.steps) : super(identifier);
}
