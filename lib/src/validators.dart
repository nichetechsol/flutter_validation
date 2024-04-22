import 'package:flutter_validation/src/validate.dart';

class Validators extends Validate {
  static final Validators _singleton = Validators._internal();

  factory Validators() {
    return _singleton;
  }

  Validators._internal();
}
