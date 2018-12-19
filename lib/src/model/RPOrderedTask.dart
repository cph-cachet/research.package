import 'RPStep.dart';
import 'RPFormStep.dart';
import 'RPTask.dart';

/*
  This is an abstract class (interface/protocol) for Task.
  It's the parent of OrderedTask

  Task is the "parent" object which contains [Step] and basically everything is a Step. (e.g. Instruction, Question)

 */

class RPOrderedTask extends RPTask {
  // This can be a list of Steps or FormStep
  List<RPStep> steps;

  String name;

  RPOrderedTask(
    String identifier,
    this.steps,
    this.name,
  ) : super(identifier);
}
