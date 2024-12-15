import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utils.dart';

// import 'package:flutter_mvvm_architecture/utils/utils.dart';

// import '../utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNote = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        centerTitle:true,
        ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
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
                  Utils.fieldFocusChange(context, emailFocusNote,passwordFocusNode);
                },
              ),
              TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  obscuringCharacter: '*',
                  focusNode: passwordFocusNode,
                  decoration: const InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outlined),
                      suffixIcon: Icon(Icons.visibility_off_rounded))),
            ]),
      ),
    );
  }
}
