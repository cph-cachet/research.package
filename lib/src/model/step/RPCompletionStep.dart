part of research_package_model;

class RPCompletionStep extends RPStep {
  RPCompletionStep(String identifier) : super(identifier);

  @override
  Widget get stepWidget {
    return RPUICompletionStep(
      step: this,
    );
  }
}
