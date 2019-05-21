# research_package

This is a Flutter package implementing support for surveys like [ResearchStack](http://researchstack.org/) and [ResearchKit](http://researchkit.org/).

## Current stage

The main focus at the moment is to make Research Package capable of handling a [WHO5](https://www.psykiatri-regionh.dk/who-5/Documents/WHO5_English.pdf) survey.


Currently the focus is on creating a consent flow with the Dart model and Flutter UI widgets. 

Also, we are designing and implementing the domain model for ResearchPackage.
The package tries to follow the [ResearchStack](http://researchstack.org/) and [ResearchKit](http://researchkit.org/) patterns and namings.

The main modules of the above mentioned libraries are:
- Consent - [How it's done in ResearchKit](http://researchkit.org/docs/docs/InformedConsent/InformedConsent.html)
- Survey - [How it's done in ResearchKit](http://researchkit.org/docs/docs/Survey/CreatingSurveys.html)
- Active Task - [How it's done in ResearchKit](http://researchkit.org/docs/docs/ActiveTasks/ActiveTasks.html)
  - We can implement these later with the help of flutter [plugins](https://github.com/cph-cachet/flutter-plugins) by CACHET.


## Useful Links
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


## Challenges

[ResearchStack](http://researchstack.org/) and [ResearchKit](http://researchkit.org/) are built on native iOS and Android which have totally different architecture than the Widget-based [Flutter](flutter.io). It hopefully doesn't affect the domain model but for wiring up the model to the UI, we should definitely implement a different approach from ResearchKit and Stack.

## Naming

We are following Apple's pattern when it comes to naming. There's a prefix ORK (Open Research Kit) before the names of classes, types etc. in ResearchKit, so our names are starting with the RP prefix which stands for Research Package.

For UI widgets we are using the RPUI (Research Package UI) prefix.


## Getting Started

In order to use Research Package, you have to clone this repo and add it manually to your `pubspec.yaml` file

```dart
  research_package:
    path: *PATH*/research.package
```

After you run the `flutter packages get` command you are able to import and start using Research Package. With the following line you have access both to the Model and the UI part of the package.

```dart
import 'package:research_package/model.dart';
import 'package:research_package/ui.dart';
```

Remember, that objects starting with `RP` are part of the Model (like `RPConsentDocument`) while those which start with `RPUI` are part of the UI library (like `RPUIVisualConsentStep`).
