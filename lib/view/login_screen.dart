import 'package:flutter/material.dart';

import '../utils/routes/routes_name.dart';

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
              Navigator.pushNamed(context, RoutesName.home);
            },
            child: const Text('Login')),
      ),
    );
  }
}
