part of research_package_model;

/// A Trail Making Test
class RPTrailMakingActivity extends RPActivityStep {
  /// Contructor for creating a Trail Making Test.
  RPTrailMakingActivity(String identifier,
      {includeInstructions = true,
      includeResults = true,
      this.trailType = TrailType.A})
      : super(identifier,
            includeInstructions: includeInstructions,
            includeResults: includeResults);

  /// The type of trail used in the test.
  /// [TrailType.A] uses numbers only.
  /// [TrailType.B] uses numbers AND letters alternating.
  TrailType trailType;
}

/// The type of Trail used in a Trail Making Test.
enum TrailType { A, B }
