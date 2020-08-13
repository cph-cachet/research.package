## 0.3.1+1
- `onCancel` callback changed to only optional

## 0.3.1
- `onCancel` callback added to Tasks

## 0.3.0

- `RPActivityStep` and `RPActivityResult` added with including UI.
- 8 cognitive tests added as activity steps.
- Dependencies updated
- Minor bugfixes

## 0.2.1

- FormStep now supports Slider, Image, Date and Boolean Answer Formats as well

## 0.2.0

- Support for Navigable Tasks
  - Branching support with `RPDirectStepNavigationRule` and `RPPredicateStepNavigationRule`
  - Navigation to previous questions
  - Currently supports:
    - Boolean Answer Format
    - Choice Answer Format
- Localization added
  - Demo app available now in English and Danish
- Support for new Answer Format
  - Boolean
- UI updates, bug fixes

## 0.1.2

- Support for new Answer Formats
  - Slider
  - Date and Time
  - Image Choice
- `rx_dart` dependency updated to `^0.23.0`
- Small bug fixes and documentation update

## 0.1.1

- `json_annotation` dependency updated to `^3.0.0`
- `rx_dart` dependency updated to `^0.22.0`

## 0.1.0

- Form Step feature added
- Bug fixing

## 0.0.4

- Example application added

## 0.0.3

- Initial release for Pub
- Support for three Answer Formats
  - Single Choice
  - Multiple Choice
  - Integer

## 0.0.2

- Added initial support for serialization to/from JSON
- JSON serialization is available for these classes:
  - `RPAnswerFormat`
  - `RPChoiceAnswerFormat`
  - `RPIntegerAnswerFormat`
  - `RPConsentDocument`
  - `RPConsentSection`
  - `RPSignatureResult`
  - `RPStepResult`
  - `RPTaskResult`
  - `RPChoice`

## 0.0.1

- Initial release
- Entire framework done
- Support for SingleChoice question type
