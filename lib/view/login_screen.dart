import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNote = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // Disposes the TextEditingController associated with the email input field
    // to release resources like memory and listeners.
    _emailController.dispose();

    // Disposes the TextEditingController associated with the password input field
    // to release resources like memory and listeners.
    _passwordController.dispose();

    // Disposes the FocusNode for the email input field to clean up focus-related resources.
    emailFocusNote.dispose();

    // Disposes the FocusNode for the password input field to clean up focus-related resources.
    passwordFocusNode.dispose();

    // Disposes the ValueNotifier (_obscurePassword) to release any listeners and free resources.
    _obscurePassword.dispose();

    // Calls the superclass's dispose method to ensure proper cleanup of resources
    // managed by the parent class.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            // child: InkWell(
            // onTap: () {
            // Navigate to the next screen
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => const HomeScreen())
            //   );
            // Navigator.pushNamed(context, RoutesName.home);
            // Utils.toastMessage("No internet connection");
            // Utils.flushBarErrorMessage("message", context);
            // Utils.snackBar("No internet connection", context);
            // },
            // child: const Text('Login')),
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNote,
                decoration: const InputDecoration(
                    hintText: 'abcd@gmail.com',
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.alternate_email_outlined)),
                onFieldSubmitted: (valu) {
                  // FocusScope.of(context).requestFocus(passwordFocusNode);
                  Utils.fieldFocusChange(
                      context, emailFocusNote, passwordFocusNode);
                },
              ),
              SizedBox(height: height * 0.07),
              ValueListenableBuilder(
                  valueListenable: _obscurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword.value,
                        obscuringCharacter: '*',
                        focusNode: passwordFocusNode,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: InkWell(
                                onTap: () {
                                  _obscurePassword.value =
                                      !_obscurePassword.value;
                                },
                                child: Icon(_obscurePassword.value
                                    ? Icons.visibility_off_rounded
                                    : Icons.visibility_rounded))));
                  }),
              SizedBox(height: height * .1),
              RoundButton(
                title: 'Login',
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.toastMessage('Please enter Email');
                  } else if (_passwordController.text.isEmpty) {
                    Utils.toastMessage('Please enter Password');
                  } else if (_passwordController.text.length < 6) {
                    Utils.toastMessage('Please enter 6 digit password');
                  } else {
                    Utils.toastMessage('Login Successfull');
                  }
                },
              ),
            ]),
      ),
    );
  }
}
