/// The UI library of Research Package.
/// Contains various UI representations (Widgets) of the objects declared in [research_package_model].
/// Many of these Widgets are responsible for making the collected results accessible to others.
/// Also contains general styles used in Research Package UI [RPStyles]

library research_package_ui;

// Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:signature/signature.dart';
import 'dart:async';
//import 'package:rxdart/rxdart.dart';

import 'package:research_package/src/model/model.dart';

// Library elements
part 'RPStyles.dart';

part 'RPUIOrderedTask.dart';

part 'RPUIVisualConsentStep.dart';
part 'RPUIConsentReviewStep.dart';

part 'RPUIQuestionStep.dart';
part 'RPUIInstructionStep.dart';
part 'RPUICompletionStep.dart';

part 'questionbody/RPUIIntegerQuestionBody.dart';
part 'questionbody/RPUISingleChoiceQuestionBody.dart';
