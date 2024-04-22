import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation/flutter_validation.dart';
import 'package:flutter_validation/src/validate.dart';
import 'package:flutter_validation/src/validators.dart';

void main() {
  test('adds one to input values', () {
    // final calculator = Calculator();
    expect(Validators().emailValidator(errorMessage: 'hele'), null);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  });
}
