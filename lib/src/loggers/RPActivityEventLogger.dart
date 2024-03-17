part of '../../ui.dart';

/// The information logger used in [RPUIActivityStep].
/// It fills and modifies a [RPActivityResult] with events from an activity.
class RPActivityEventLogger {
  final RPActivityResult result;

  RPActivityEventLogger(this.result);

  /// Sets the time of starting the test stage
  void testStarted() {
    result.stepTimes.testStarted = DateTime.now();
  }

  /// Sets the time of showing the test stage.
  /// The test might be delayed before it starts.
  void testShown() {
    result.stepTimes.testShown = DateTime.now();
  }

  /// Sets the time of ending the test stage
  void testEnded() {
    result.stepTimes.testEnded = DateTime.now();
  }

  /// Sets the time of starting the instruction stage
  void instructionStarted() {
    result.stepTimes.instructionStarted = DateTime.now();
  }

  /// Sets the time of ending the instruction stage
  void instructionEnded() {
    result.stepTimes.instructionEnded = DateTime.now();
  }

  /// Sets the time of starting the results stage
  void resultsShown() {
    result.stepTimes.resultsShown = DateTime.now();
  }

  /// Sets the time of ending the results stage
  void resultsClosed() {
    result.stepTimes.resultsClosed = DateTime.now();
  }

  /// Adds a correct gesture from the UI to the [RPActivityResult] with time, correctness, type and description.
  void addCorrectGesture(String type, String description) {
    result.interactions
        .add(Interaction(DateTime.now(), 'Correct gesture', type, description));
  }

  /// Adds a wrong gesture from the UI to the [RPActivityResult] with time, correctness, type and description.
  void addWrongGesture(String type, String description) {
    result.interactions
        .add(Interaction(DateTime.now(), 'Wrong gesture', type, description));
  }
}
