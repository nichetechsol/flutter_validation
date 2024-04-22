abstract class Validators {
  dynamic requiredValidator({String? errorMessage, String? value, message});
  dynamic emailValidator({String? errorMessage, String? value});
  String? phoneValidator({String? errorMessage, String? value});
  dynamic upperCaseValidator({String? errorMessage, String? value});
  dynamic lowerCaseValidator({String? errorMessage, String? value});
  dynamic digitValidator({String? errorMessage, String? value});
  dynamic specialCharValidator({String? errorMessage, String? value});
  String? alphanumericValidator({String? errorMessage, String? value});
  String? maxLengthValidator(
      {int maxLength = 255, String? errorMessage, String? value});
  String? minLengthValidator(
      {int minLength = 1, String? errorMessage, String? value});
  String? combinedPhoneEmailValidator({
    String? errorMessage,
    String? value,
  });
  dynamic strongPassWordValidation(
      {int? minLength = 6,
      String? errorMessage,
      List? validations,
      String? value});
  dynamic combineValidators({required List validators});
}
