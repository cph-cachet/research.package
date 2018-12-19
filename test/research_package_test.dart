import 'package:flutter_test/flutter_test.dart';
import 'package:research_package/research_package.dart';

void main() {
  const id = 'thisisauniqueid123';

  test('check task id getter', () {
    RPOrderedTask orderedTask = RPOrderedTask(id, null, null);

    expect(orderedTask.identifier, id);
  });
}