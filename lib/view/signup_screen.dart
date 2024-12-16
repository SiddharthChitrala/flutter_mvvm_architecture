import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/res/colors.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

import '../res/components/round_button.dart';
import '../utils/utils.dart';
import '../vm/auth_view_model.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNote = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNote.dispose();
    passwordFocusNode.dispose();
    _obscurePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);

    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Screen'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                title: 'Sign Up',
                loading: authViewModel.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.toastMessage('Please enter Email');
                  } else if (_passwordController.text.isEmpty) {
                    Utils.toastMessage('Please enter Password');
                  } else if (_passwordController.text.length < 6) {
                    Utils.toastMessage('Please enter 6 digit password');
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString()
                    };
                    authViewModel.registerApi(data, context);
                    print('Api Hit');
                  }
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context,RoutesName.login);
                },
                child: RichText(
                  text: const TextSpan(
                    text: 'If you have an account, ',
                    style:
                        TextStyle(color: AppColors.blackColor, fontSize: 16.0),
                    children: [
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
