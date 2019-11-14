# Research Package
[![pub package](https://img.shields.io/pub/v/research_package.svg)](https://pub.dartlang.org/packages/research_package)

This is a Flutter package implementing support for surveys and obtaining informed consent containing models, UI elements and screens. 
The motivation is coming from two similar native libraries [ResearchStack](http://researchstack.org/) and [ResearchKit](http://researchkit.org/).

The main modules of the above mentioned libraries are:
- Consent - [How it's done in ResearchKit](http://researchkit.org/docs/docs/InformedConsent/InformedConsent.html) - Implemented
- Survey - [How it's done in ResearchKit](http://researchkit.org/docs/docs/Survey/CreatingSurveys.html) - Implemented
- Active Task - [How it's done in ResearchKit](http://researchkit.org/docs/docs/ActiveTasks/ActiveTasks.html) - Can be implemented later with the help of flutter [plugins](https://github.com/cph-cachet/flutter-plugins) by CACHET.
  
## Getting Started

Research Package is published to Pub: [![pub package](https://img.shields.io/pub/v/research_package.svg)](https://pub.dartlang.org/packages/research_package) 

You can start using it by adding it to your dependencies.

After you run the `flutter packages get` command you are able to import and start using Research Package. With the following line you have access both to the Model and the UI part of the package.

```dart
import 'package:research_package/model.dart';
import 'package:research_package/ui.dart';
```

Remember, that objects starting with `RP` are part of the Model (like `RPConsentDocument`) while those which start with `RPUI` are part of the UI library (like `RPUIVisualConsentStep`).

## Example application

To get an overview of Research Package's features please have a look at the example application available [in this folder](https://github.com/cph-cachet/research.package/tree/master/example).

## Similarity to ResearchKit and ResearchStack

Research Package is clearly similar to these two existent framework. A goal with the package was to help developers enjoy the same features with Flutter's cross-platform framework. 
The names, functionalities and most of the logic are similar or identical to the previously mentioned two framework. This way we believe that the transition for those who have used them before will be easier and smoother.

## Current stage

The project is work in progress. New Answer Formats are being added to the survey module of the framework constanly. 
The available Answer Formats are the following at the moment:
- Single Choice
- Multiple Choice
- Integer

## Use Cases

One of the goals for the package was to make it capable of handling a [WHO5](https://www.psykiatri-regionh.dk/who-5/Documents/WHO5_English.pdf) survey. As an example at this point Research Package can obtain the informed consent from the participant, show the WHO5 survey questions and collect the results.

### Naming

We are following Apple's pattern when it comes to naming. There's a prefix ORK (Open Research Kit) before the names of classes, types etc. in ResearchKit, so our names are starting with the RP prefix which stands for Research Package.

For UI widgets we are using the RPUI (Research Package UI) prefix.

### Useful Links
In order to familiarize with the Framework and potentially extend it, it's might worth to have a look at these links about Research Kit and Research Stack.  

- ResearchKit
  - [Official Tutorial on how to use ResearchKit in ObjectiveC](http://researchkit.org/docs/docs/Survey/CreatingSurveys.html)
You can get a good understading of the flow and the basic concepts.
Also there's a useful presentation of the different AnswerFormats.
  - [Hierarchy of objects in ResearchKit](http://researchkit.org/docs/hierarchy.html)
This is a good representation of a possible file/class hierarchy for ResearchPackage.
  - [Tutorial on how to use ResearchKit in Swift](https://www.raywenderlich.com/1820-researchkit-tutorial-with-swift-getting-started)
  - [Sample Apps for ResearchKit in Swift](https://github.com/ResearchKit/ResearchKit/tree/master/samples)

- ResearchStack
  - [Sample App for ResearchStack](https://github.com/ResearchStack/SampleApp)
  - [Tutorial on how to use ResearchStack in Java](https://www.raywenderlich.com/637-researchstack-tutorial-getting-started)
