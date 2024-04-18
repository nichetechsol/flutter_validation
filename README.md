
[![Pub](https://img.shields.io/badge/pub-v0.0.1-blue)](https://pub.dartlang.org/packages/Flutter_validation)
[![License](https://img.shields.io/badge/licence-MIT-orange.svg)](https://github.com/nichetechsol/flutter_validation/blob/main/LICENSE)

## Description
This package provides a set of commonly used validation functions for form fields in Flutter applications.

## Salient Features
- Required field validation: Checks if a field is empty.
- Email validation: Validates email addresses based on a regular expression.
- Phone number validation: Basic phone number validation.
- Alphanumeric validation: Allows only letters and numbers.
- Password strength validation: Checks for uppercase, lowercase, digits, and special characters (customizable).
- Minimum and maximum length validation: Enforces minimum and maximum character lengths for a field.
- Combined phone/email validation: Allows users to enter either a valid phone number or email address.
- Combine multiple validators: Combine multiple validators for complex validations.
  
## Installation
```yaml
dependencies:
  flutter_validations: ^0.0.2

```
## Available Validators
- requiredValidator: Checks if a field is empty.
- emailValidator: Validates email addresses.
- phoneValidator: Basic phone number validation. (Can be extended)
- alphanumericValidator: Allows only letters and numbers.
- upperCaseValidator: Checks for uppercase letters in password.
- lowerCaseValidator: Checks for lowercase letters in password.
- digitValidator: Checks for digits in password.
- specialCharValidator: Checks for special characters in password.
- maxLengthValidator: Enforces a maximum character length.
- minLengthValidator: Enforces a minimum character length.
- combinedPhoneEmailValidator: Allows either phone number or email.
- combineValidators: Combines multiple validators.
  
## Examples
![](https://github.com/nichetechsol/flutter_validation/blob/main/assets/Required%20-%20Made%20with%20Clipchamp.gif)
![](https://github.com/nichetechsol/flutter_validation/blob/main/assets/Strong%20Password%20-%20Made%20with%20Clipchamp.gif)
![](https://github.com/nichetechsol/flutter_validation/blob/main/assets/CombinedRE%20-%20Made%20with%20Clipchamp.gif)
![](https://github.com/nichetechsol/flutter_validation/blob/main/assets/Phone%20-%20Made%20with%20Clipchamp.gif)
![](https://github.com/nichetechsol/flutter_validation/blob/main/assets/Max%20length%2016%20-%20Made%20with%20Clipchamp.gif)
![](https://github.com/nichetechsol/flutter_validation/blob/main/assets/Combined%20Email%20and%20Phone%20-%20Made%20with%20Clipchamp.gif)
## Usage

#### Using Flutter_validation
Use Validate class with it's functions like this,



###### Required validator:
Using `Validate.requiredValidator();`

```dart
TextFormField(
  autovalidateMode: AutovalidateMode.onUserInteraction,
  controller: firstNameController,
  validator: (value) =>
    Validate.requiredValidator(
    errorMessage: 'This field must not be empty.',
    value: value
    ),
),
```

###### Email validator:
Using `Validate.emailValidator();`

```dart
TextFormField(
  autovalidateMode: AutovalidateMode.onUserInteraction,
  controller: firstNameController,
  validator: (value) =>
    Validate.emailValidator(
    errorMessage: 'Please enter valid email address.',
    value: value
    ),
),
```

###### Combine validator:
Using `Validate.combineValidators();`

```dart
TextFormField(
  autovalidateMode: AutovalidateMode.onUserInteraction,
  controller: firstNameController,
  validator: (value) =>
    Validate.combineValidators(
    validators: [
      Validate.requiredValidator(errorMessage: 'Username must not be empty.', value: value),
      Validate.minLengthValidator(minLength: 3,errorMessage: 'Please enter a username with at least 3 characters.', value: value),
      Validate.upperCaseValidator(errorMessage: 'Username must contain atleast 1 uppercase letter',value: value),
      
    ]
    ),
),
```
Note: In combine validators you have to pass value for each validator.

###### Alphanumeric validator:
Using `Validate.alphanumericValidator();`

```dart
TextFormField(
  autovalidateMode: AutovalidateMode.onUserInteraction,
  controller: firstNameController,
  validator: (value) =>
    validator: (value) => Validate.alphanumericValidator(value: value,),
// this will return "Please enter only letters and numbers" vaildation error
),
```

## Info

Feel Free to request any missing features or report issues [here](https://github.com/nichetechsol/flutter_validation/issues).

## License

```
MIT License

Copyright (c) 2024 Nichetechsolutions

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
