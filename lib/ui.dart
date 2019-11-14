/// The UI library of Research Package.
///
/// Normally you don't need to use these widgets directly. After creating the model objects from [research_package_model]
/// and adding them to an [RPTask] you can present the different elements by passing it to an [RPUIOrderedTask].
///
/// This library contains various UI representations (Widgets) of the objects declared in [research_package_model].
/// Many of these Widgets are responsible for making the collected results accessible to others.
/// Also contains general styles, UI statics used in Research Package UI in [RPStyles].

library research_package_ui;

// Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:signature/signature.dart';
import 'dart:async';

import 'package:research_package/model.dart';

// Library elements
part 'src/ui/RPStyles.dart';

part 'src/ui/RPUIOrderedTask.dart';

part 'src/ui/RPUIVisualConsentStep.dart';
part 'src/ui/RPUIConsentReviewStep.dart';

part 'src/ui/RPUIQuestionStep.dart';
part 'src/ui/RPUIInstructionStep.dart';
part 'src/ui/RPUICompletionStep.dart';
part 'src/ui/RPUIFormStep.dart';

part 'src/ui/QuestionBody/RPUIIntegerQuestionBody.dart';
part 'src/ui/QuestionBody/RPUIChoiceQuestionBody.dart';
