part of research_package_model;

/// A Letter A Tapping Test
class RPLetterTappingActivity extends RPActivityStep {
  /// Contructor for creating a Letter A Tapping Test.
  RPLetterTappingActivity(String identifier,
      {includeInstructions = true, includeResults = true})
      : super(identifier,
            includeInstructions: includeInstructions,
            includeResults: includeResults);
}
