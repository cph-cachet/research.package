part of research_package_model;

class RPTaskResult extends RPResult {
  Map<String, RPStepResult> _results;

  RPTaskResult(String identifier) : super(identifier) {
    this._results = Map<String, RPStepResult>();
  }

  Map<String, RPStepResult> get results => _results;

  RPStepResult getStepResultForIdentifier(String identifier) => _results[identifier];

  void setStepResultForIdentifier(String identifier, RPStepResult stepResult) {
    _results[identifier] = stepResult;
  }
}
