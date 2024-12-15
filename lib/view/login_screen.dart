import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/utils/utils.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () {
              // Navigate to the next screen
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeScreen())
              //   );
              // Navigator.pushNamed(context, RoutesName.home);
                Utils.toastMessage("No internet connection");
              // Utils.flushBarErrorMessage("message", context);
              // Utils.snackBar("No internet connection", context);
            },
            child: const Text('Login')),
      ),
    );
  }
}
