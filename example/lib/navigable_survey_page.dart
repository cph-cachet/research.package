import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:research_package/research_package.dart';
import 'package:research_package_demo_app/linear_survey_page.dart';
import 'dart:convert';

import 'package:research_package_demo_app/research_package_objects/navigation_step_jump_rule.dart';

class NavigableSurveyPage extends StatelessWidget {
  String _encode(Object object) =>
      const JsonEncoder.withIndent(' ').convert(object);

  void resultCallback(RPTaskResult result) {
    // Do anything with the result
    log(_encode(result));
  }

  void cancelCallBack(RPTaskResult result) {
    // Do anything with the result at the moment of the cancellation
    print("The result so far:\n" + _encode(result));
  }

  @override
  Widget build(BuildContext context) {
    // Example of serialization to and from JSON
    RPNavigableOrderedTask task = RPNavigableOrderedTask.fromJson(
        json.decode(_encode(stepJumpNavigationExample1)));

    return RPUITask(
      task: task,
      // task: navigableSurveyTaskRPStepJumpRule,
      onSubmit: (RPTaskResult result) {
        // if (result.results['<question identifier>'].results['answer'].first.value == <Value of the RPChoice>) {
        // Example here
        if (result.results['smokingQuestionId'].results['answer'].first.value ==
            1) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => LinearSurveyPage()));
        }
      },
      onCancel: (RPTaskResult? result) {
        if (result == null) {
          print("No result");
        } else
          cancelCallBack(result);
      },
    );
  }
}
