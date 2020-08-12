import 'package:flutter/material.dart';
import 'package:research_package/research_package.dart';
import 'research_package_objects/navigable_survey_objects.dart';
import 'dart:convert';

class NavigableSurveyPage extends StatelessWidget {
  String _encode(Object object) => const JsonEncoder.withIndent(' ').convert(object);

  void resultCallback(RPTaskResult result) {
    // Do anything with the result
    print(_encode(result));
  }

  void cancelCallBack(RPTaskResult result) {
    // Do anything with the result at the moment of the cancellation
    print("The result so far:\n" + _encode(result));
  }

  @override
  Widget build(BuildContext context) {
    return RPUITask(
      task: navigableSurveyTask,
      onSubmit: (result) {
        resultCallback(result);
      },
      onCancel: ([result]) {
        cancelCallBack(result);
      },
    );
  }
}
