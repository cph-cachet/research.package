import 'package:flutter_test/flutter_test.dart';
import 'package:research_package/model.dart';
void main() {
  String id = 'thisisauniqueid123';
  List<RPStep> steps = [RPStep('1'), RPStep('2')];

  test('check task id getter', () {
    RPOrderedTask orderedTask = RPOrderedTask(id, steps);

    expect(orderedTask.identifier, id);
  });
}
