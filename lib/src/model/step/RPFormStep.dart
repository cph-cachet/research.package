part of research_package_model;

/*
  FormStep is containing more steps so you can show them on the same screen.
 */

class RPFormStep extends RPStep {
  List<RPStep> steps;

  RPFormStep(String identifier, this.steps) : super(identifier);
}
