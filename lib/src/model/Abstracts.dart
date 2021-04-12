part of research_package_model;

/// A protocol to mark the Widgets which are producing [RPResult] objects.
/// They all need to implement the [createAndSendResult] method
abstract class CanSaveResult {
  /// This method should be implemented in all the Widgets which are producing
  /// an [RPResult] object.
  void createAndSendResult();
}
