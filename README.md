# Research Package

[![pub package](https://img.shields.io/pub/v/research_package.svg)](https://pub.dartlang.org/packages/research_package)
[![style: effective dart](https://img.shields.io/badge/style-pedandic_dart-40c4ff.svg)](https://pub.dev/packages/pedandic_dart)
[![github stars](https://img.shields.io/github/stars/cph-cachet/research.package.svg?style=flat&logo=github&colorB=deeppink&label=stars)](https://github.com/cph-cachet/research.package)
[![MIT License](https://img.shields.io/badge/license-MIT-purple.svg)](https://opensource.org/licenses/MIT)

Research Package is a Flutter [package](https://pub.dartlang.org/packages/research_package) for building research study apps on Android and iOS using [Flutter](https://flutter.dev).

Research Package is a Flutter implementation of the [Apple ResearchKit](https://www.researchandcare.org/researchkit/) available for iOS (just like [ResearchStack](https://github.com/ResearchStack/ResearchStack) is for Android). The overarching goal of ResearchPackage is to enable developers and researchers to design and build cross-platform (iOS and Android) research applications using the same codebase.

Research Package is designed from the ground up to meet the requirements of most scientific research, including capturing participant consent, extensible input tasks, and the security and privacy needs necessary for IRB approval.
The main features of Research Package are:

- [Obtaining informed consent](https://carp.cachet.dk/obtaining-consent/) from participants, including support for a signature.
- [Creating surveys](https://carp.cachet.dk/creating-a-survey/) and questionnaires with a wide range of answer formats (e.g., likert scale, date pickers, image pickers, etc.), such as the [WHO5](https://www.psykiatri-regionh.dk/who-5/Documents/WHO-5%20questionaire%20-%20English.pdf) survey.
- [Supporting localizations](https://carp.cachet.dk/localization/) of surveys and informed consent.

Research Package is part of the overall [CACHET Research Platform (CARP)](https://carp.cachet.dk) with also provides a Flutter package for mobile and wearable sensing called [CARP Mobile Sensing](https://pub.dev/packages/carp_mobile_sensing). 
The CACHET [Pulmonary Monitor](https://github.com/cph-cachet/pulmonary_monitor_app) app shows how mobile sensing can be combined with collection of survery data from users.

## Documentation

There is a set of tutorials, describing:

- the overall [software architecture](https://carp.cachet.dk/research-package-api/) of Research Package
- how to create an [informed consent](https://carp.cachet.dk/obtaining-consent/) flow
- how to define and run [user surveys](https://carp.cachet.dk/creating-a-survey/)
- how to enable [localization](https://carp.cachet.dk/localization/)

The [Research Package Flutter API](https://pub.dev/documentation/research_package/latest/) is available (and maintained) as part of the package release at pub.dev.

## Example Application

There is an [example app](https://github.com/cph-cachet/research.package/tree/master/example) which demonstrates the different features of Research Package as implemented in a Flutter app.

## Who is backing this project?

Research Package is made by the [Copenhagen Center for Health Technology (CACHET)](https://www.cachet.dk/) and is an important component in the [CACHET Research Platform (CARP)](https://carp.cachet.dk), which is used
in a number of applications and studies.
The current project maintainers are [Mads Vedel Saaby Christensen](https://github.com/MadsVSChristensen) and [Jakob E. Bardram](https://www.bardram.net).

## How can I contribute?

We are more than happy to take contributions and feedback.
Use the [Issues](https://github.com/cph-cachet/research.package/issues) page to file an issue or feature request.
Besides general help for enhacement and quality assurance (bug fixing), we welcome input on new answer types.

## License

This software is copyright (c) [Copenhagen Center for Health Technology (CACHET)](https://www.cachet.dk/)
at the [Technical University of Denmark (DTU)](https://www.dtu.dk).
This software is available 'as-is' under a [MIT license](https://github.com/cph-cachet/research.package/blob/master/LICENSE).
