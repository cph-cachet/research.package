import 'package:carp_serializable/carp_serializable.dart';
import 'package:test/test.dart';
import 'package:research_package/research_package.dart';

/// These tests takes the examples from the example app and tests de/serialization.
void main() {
  setUp(() {
    // initialize the package and json deserialization functions
    ResearchPackage.ensureInitialized();
  });

  group('JSON', () {
    test('Issue #125', () {
      Map<String, dynamic> jsonInstruction = {
        "__type": "RPInstructionStep",
        "identifier": "instructionID",
        "title": "Welcome!",
        "detailText":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultricies feugiat turpis nec efficitur. Integer in pharetra libero. Proin a leo eu enim porttitor hendrerit. Suspendisse vestibulum interdum mollis. Donec in sapien ut orci ultricies laoreet. Ut maximus ante id arcu feugiat scelerisque. Proin non rutrum libero. Aliquam blandit arcu ac dolor consequat maximus. Integer et dolor quis quam tempor porta quis vel nibh. Phasellus ullamcorper fringilla lorem, ac tempus sem cursus a. Aliquam maximus facilisis quam. Morbi hendrerit tempor tellus, ac hendrerit augue tincidunt eu. Cras convallis lorem at nulla mattis tristique.",
        "footnote": "(1) Important footnote",
        "imagePath": "assets/images/waving-hand.png",
        "text": "informed_consent.welcome_text",
      };

      var instructionStep = RPInstructionStep.fromJson(jsonInstruction);
      print(toJsonString(instructionStep));
      expect(instructionStep.identifier, 'instructionID');
    });
  });
}
