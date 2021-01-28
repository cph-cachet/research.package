import 'package:flutter/material.dart';
import 'package:research_package/research_package.dart';
import 'research_package_objects/linear_survey_objects.dart';
import 'dart:convert';

class LinearSurveyPage extends StatelessWidget {
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
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Theme(
      data: ThemeData(
        primaryColor: isDarkMode ? Colors.orange : Colors.red,
        accentColor: isDarkMode ? Colors.blue : Colors.green,
        backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
        dividerColor: isDarkMode ? Colors.grey[600] : Colors.grey,
        textTheme: isDarkMode ? Typography.whiteMountainView : Typography.blackMountainView,
      ),
      child: RPUITask(
        task: linearSurveyTask,
        onSubmit: (result) {
          resultCallback(result);
        },
        onCancel: ([res]) => print('survey canceled'),
        // No onCancel
        // If there's no onCancel provided the survey just quits
      ),
    );
  }
}
