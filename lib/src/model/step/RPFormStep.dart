part of research_package_model;

// TODO: not implemented yet

class RPFormStep extends RPStep {
  List<RPQuestionStep> _formSteps;

  RPFormStep(String identifier, this._formSteps) : super(identifier);

  List<RPQuestionStep> get steps => this._formSteps;

  set steps(List<RPQuestionStep> steps) {
    this._formSteps = steps;
  }

  @override
  Widget get stepWidget => RPUIFormStep(this);
}
