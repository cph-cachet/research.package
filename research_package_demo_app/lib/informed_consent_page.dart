import 'package:flutter/material.dart';
import 'package:research_package/research_package.dart';
import 'research_package_objects/infomed_consent_objects.dart';

class InformedConsentPage extends StatelessWidget {
  void resultCallback(RPTaskResult result) {
    // Do anything with the result
    print(result.results.keys);
  }

  @override
  Widget build(BuildContext context) {
    return RPUIOrderedTask(
      task: consentTask,
      onSubmit: (result) {
        resultCallback(result);
      },
    );
  }
}
