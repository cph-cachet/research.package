part of research_package_model;

/// A Paired Associates Learning Test
class RPPairedAssociatesLearningActivity extends RPActivityStep {
  /// Contructor for creating a Paired Associates Learning Test.
  RPPairedAssociatesLearningActivity(String identifier,
      {includeInstructions = true,
      includeResults = true,
      this.maxTestDuration = 100})
      : super(identifier,
            includeInstructions: includeInstructions,
            includeResults: includeResults);

  /// The maximum length of the test. Default is 100 seconds
  int maxTestDuration;
}
