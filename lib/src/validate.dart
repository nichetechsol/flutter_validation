import 'methods.dart';

class Validate implements Validators {
  @override
  dynamic requiredValidator({String? errorMessage, String? value, message}) {
    return (value?.isEmpty ?? true)
        ? (errorMessage ?? 'This field is required.')
        : null;
  }

  @override
  dynamic emailValidator({String? errorMessage, String? value}) {
    final RegExp emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

    return value == null || !emailRegex.hasMatch(value)
        ? (errorMessage ?? 'Please enter a valid email address.')
        : null;
  }

  @override
  String? phoneValidator({String? errorMessage, String? value}) {
    if (value == null || value.length <= 9) {
      return errorMessage ?? 'Please enter a valid phone number.';
    }
    return null;
  }

  @override
  dynamic upperCaseValidator({String? errorMessage, String? value}) {
    if (!RegExp(r'[A-Z]').hasMatch((value ?? '').trim())) {
      return (errorMessage ?? 'Password must contain an uppercase letter');
    }
    return null;
  }

  @override
  dynamic lowerCaseValidator({String? errorMessage, String? value}) {
    if (!RegExp(r'[a-z]').hasMatch((value ?? '').trim())) {
      return (errorMessage ?? 'Password must contain a lowercase letter');
    }
    return null;
  }

  @override
  dynamic digitValidator({String? errorMessage, String? value}) {
    if (!RegExp(r'\d').hasMatch((value ?? '').trim())) {
      return (errorMessage ?? 'Password must contain at least one digit.');
    }
    return null;
  }

  @override
  dynamic specialCharValidator({String? errorMessage, String? value}) {
    if (!RegExp(r'[!@#$%^&*]').hasMatch((value ?? '').trim())) {
      return (errorMessage ??
          'Password must contain at least one special character.');
    }
    return null;
  }

  @override
  String? alphanumericValidator({String? errorMessage, String? value}) {
    if (value == null || value.isEmpty) {
      return (errorMessage ?? "Please enter a value");
    } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
      return 'Please enter only letters and numbers';
    }
    return null;
  }

  @override
  String? maxLengthValidator(
      {int maxLength = 255, String? errorMessage, String? value}) {
    if (value == null || value.length > maxLength) {
      return (errorMessage ??
          'Please enter no more than $maxLength characters');
    }
    return null;
  }

  @override
  String? minLengthValidator(
      {int minLength = 1, String? errorMessage, String? value}) {
    if (value == null || value.length < minLength) {
      return (errorMessage ?? 'Please enter at least $minLength characters');
    }
    return null;
  }

  @override
  String? combinedPhoneEmailValidator({
    String? errorMessage,
    String? value,
  }) {
    var isEmail = value!.isNotEmpty &&
            (value.startsWith(RegExp(r'[a-zA-Z]')) ||
                value.contains(RegExp(r'[a-zA-Z]'))) ||
        value.contains("@");
    var isPhone = value.isNotEmpty &&
        (value.startsWith(RegExp(r'[1-9]')) ||
            (!value.contains("@") && !value.contains(RegExp(r'[a-zA-Z]'))));
    final phoneError = phoneValidator(value: value);
    final emailError = emailValidator(value: value);

    if (value.isEmpty) {
      return 'Please enter a valid phone number or email address';
    }
    if (isEmail && emailError != null) {
      return 'please enter a valid email address';
    }
    if (isPhone && phoneError != null) {
      return 'please enter a valid phone number';
    }
    return null;
  }

  @override
  dynamic strongPassWordValidation(
      {int? minLength = 6,
      String? errorMessage,
      List? validations,
      String? value}) {
    if (value == null || value.isEmpty) {
      return (errorMessage ?? "Please enter password");
    }
    if (value.length < minLength!) {
      return 'Password must be at least $minLength characters long';
    }

    // Use separate validators or combine regular expressions as needed
    final validators = validations == null || validations == []
        ? [
            upperCaseValidator(value: value),
            lowerCaseValidator(value: value),
            digitValidator(value: value),
            specialCharValidator(value: value)
          ]
        : validations;
    for (final validator in validators) {
      final error = validator;
      if (error != null) {
        return error;
      }
    }

    return null;
  }

  @override
  dynamic combineValidators({required List validators}) {
    for (final validator in validators) {
      final error = validator;
      if (error != null) {
        return error;
      }
    }
    return null;
  }

  // static String? dateValidator({String? errorMessage, String? value}){}
}
