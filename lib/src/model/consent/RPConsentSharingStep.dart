/*
Based on http://researchkit.org/docs/Classes/ORKConsentSharingStep.html
 */
//import '../step/RPQuestionStep.dart';

part of research_package_model;

/*
  The RPConsentSharingStep class represents a question step that includes prepopulated
  content that asks users about how much they’re willing to allow data to be shared after collection.
 */

class RPConsentSharingStep extends RPQuestionStep {

  RPConsentSharingStep(String identifier) : super(identifier) {
   super.optional = false;
  }
}
