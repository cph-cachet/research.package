part of research_package_model;

/// The result object of a step with no result. 
/// 
/// This is a quick fix to streams that can no longer take null values.
// TODO: Restructure to a possible state machine
class RPNoResult extends RPResult {

  RPNoResult() : super('NoResult');
}
