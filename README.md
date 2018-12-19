# research_package

This is a Flutter package implementing support for surveys like [ResearchStack](http://researchstack.org/) and [ResearchKit](http://researchkit.org/).

## Current stage

Currently we are designing and implementing the domain model for ResearchPackage.
The package tries to follow the [ResearchStack](http://researchstack.org/) and [ResearchKit](http://researchkit.org/) patterns and namings.

The main modules of the above mentioned libraries are:
- Consent
- Survey
- Active Task
  - We can implement these later with the help of flutter [plugins](https://github.com/cph-cachet/flutter-plugins) by CACHET.


## Useful Links

- [Official Tutorial on how to use ResearchKit in ObjectiveC](http://researchkit.org/docs/docs/Survey/CreatingSurveys.html)
You can get a good understading of the flow and the basic concepts.
Also there's a useful presentation of the different AnswerFormats.
- [Hierarchy of objects in ResearchKit](http://researchkit.org/docs/hierarchy.html)
This is a good representation of a possible file/class hierarchy for ResearchPackage.
- [Tutorial on how to use ResearchKit in Swift](https://www.raywenderlich.com/1820-researchkit-tutorial-with-swift-getting-started).
- [Sample App for ResearchStack](https://github.com/ResearchStack/SampleApp)
- [Sample Apps for ResearchKit in Swift](https://github.com/ResearchKit/ResearchKit/tree/master/samples)

## Challenges

[ResearchStack](http://researchstack.org/) and [ResearchKit](http://researchkit.org/) are built on native iOS and Android which have totally different architecture than the Widget-based [Flutter](flutter.io). It hopefully doesn't affect the domain model but for wiring up the model to the UI, we should definitely implement a different approach from ResearchKit and Stack.

## Naming

We are following Apple's pattern when it comes to naming. There's a prefix ORK (Open Research Kit) before the names of classes, types etc. in ResearchKit, so our names are starting with the RP prefix which stands for Research Package.


## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
