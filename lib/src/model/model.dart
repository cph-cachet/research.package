class Task {
  List<Step> steps;

  Task(this.steps);
}

class Step {
  String name;
  List<SubStep> subSteps;

  Step(this.name, this.subSteps);
}

class SubStep {
  String name;

  SubStep(this.name);
}

enum StepType {
  Instruction,
  Question,
  Consent
}

enum AnswerFormatType {
  Date,
  Text,
  Numeric
}

