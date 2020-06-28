part of research_package_model;

/// A Stroop Effect Test
class RPStroopEffectActivity extends RPActivityStep {
  /// Contructor for creating a Stroop effect Test.
  RPStroopEffectActivity(String identifier,
      {includeInstructions = true,
      includeResults = true,
      this.lengthOfTest = 40,
      this.displayTime = 1000,
      this.delayTime = 750})
      : super(identifier,
            includeInstructions: includeInstructions,
            includeResults: includeResults);

  /// Test duration in seconds. Default is 40 seconds.
  int lengthOfTest;

  /// Amount of time each word is displayed in milliseconds. Default is 1000 ms.
  int displayTime;

  /// Amount of time between words in ms. Default is 750 ms.
  int delayTime;
}
