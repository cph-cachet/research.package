import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:research_package/research_package.dart';
import 'research_package_objects/navigation_step_jump_rule.dart';
import 'package:carp_serializable/carp_serializable.dart';

class NavigableSurveyPage extends StatelessWidget {
  void resultCallback(RPTaskResult result) => log(toJsonString(result));

  void cancelCallBack(RPTaskResult? result) => (result == null)
      ? log("No result")
      : log("The result so far:\n" + toJsonString(result));

  @override
  Widget build(BuildContext context) {
    return RPUITask(
      task: stepJumpNavigationExample1,
      onSubmit: resultCallback,
      onCancel: cancelCallBack,
    );
  }
}
