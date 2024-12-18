part of 'main.dart';

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
