import 'package:flutter_test/flutter_test.dart';

import 'package:research_package/research_package.dart';

void main() {
  test('check task contains right step', () {
    List<SubStep> subSteps = [];
    List<Step> steps = [];

    for (int i = 0; i < 5; i++) {
      SubStep subStep = SubStep('substepname');
      subSteps.add(subStep);
    }

    for (int i = 0; i < 5; i++) {
      steps.add(Step('stepname', subSteps));
    }


    final task = Task(steps);


    expect(task.steps.length, 5);
    expect(task.steps[0].subSteps.length, 5);
  });
}
