import 'package:flutter/material.dart';
import 'package:flutter_validation/flutter_validation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  dynamic formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController strongPasswordController = TextEditingController();
  TextEditingController combineController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController maxlenController = TextEditingController();
  TextEditingController minlenController = TextEditingController();
  Validate validate = Validate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Form(
            // onChanged: () {
            //   _formKey.currentState!.validate();
            // },
            key: formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Email'),
                    TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: emailController,
                        validator: (value) => Validate.emailValidator(
                            errorMessage: 'enter valid email address',
                            value: value)),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Required'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      validator: (value) => Validate.requiredValidator(
                          errorMessage: 'This field must not be empty',
                          value: value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Strong password'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: confirmPassController,
                      validator: (value) =>
                          Validate.strongPassWordValidation(validations: [
                        Validate.upperCaseValidator(value: value),
                        Validate.lowerCaseValidator(value: value),
                        Validate.digitValidator(value: value),
                        // Validate.specialCharValidator(value: value),
                      ], value: value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Strong password with special Charecter'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: strongPasswordController,
                      validator: (value) => Validate.strongPassWordValidation(
                          errorMessage: 'password me number likhh',
                          value: value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('combine required,Email'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: combineController,
                      validator: (value) =>
                          Validate.combineValidators(validators: [
                        Validate.requiredValidator(value: value),
                        Validate.emailValidator(value: value),
                        Validate.strongPassWordValidation(value: value),
                      ]),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('Phone'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: phoneController,
                      validator: (value) =>
                          Validate.phoneValidator(value: value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('max length (16)'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: maxlenController,
                      validator: (value) => Validate.maxLengthValidator(
                          value: value, maxLength: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text('combined email and phone'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: minlenController,
                      validator: (value) =>
                          Validate.combinedPhoneEmailValidator(
                        value: value,
                      ),
                    ),
                  ]),
            )),
      ),
    );
  }
}
