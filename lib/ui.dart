/// The UI library of Research Package.
/// Contains various UI representations (Widgets) of the objects declared in [research_package_model].
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

part 'src/ui/questionbody/RPUIIntegerQuestionBody.dart';
part 'src/ui/questionbody/RPUISingleChoiceQuestionBody.dart';
