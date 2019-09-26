import 'package:flutter/material.dart';
import 'package:research_package/research_package.dart';
import 'research_package_objects/survey_objects.dart';

class SurveyPage extends StatelessWidget {
  void resultCallback(RPTaskResult result) {
    // Do anything with the result
    print(result.results.keys);
  }

  @override
  Widget build(BuildContext context) {
    return RPUIOrderedTask(
      task: surveyTask,
      onSubmit: (result) {
        resultCallback(result);
      },
    );
  }
}
