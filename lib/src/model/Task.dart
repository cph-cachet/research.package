import 'Step.dart';
import 'FormStep.dart';
/*
  This is a universal Task class.

  Maybe we can make this a super class of more specified Task classes
  (e.g. OrderedTask).

  Task is the "parent" object which contains [Step] and basically everything is a Step. (e.g. Instruction, Question)

 */

class Task {
  // This can be a list of Steps or FormStep
  List steps;

  String name;

  Task(
    this.steps,
    this.name,
  );
}
