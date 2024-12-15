import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';
import 'package:flutter_mvvm_architecture/view/home_screen.dart';
import 'package:flutter_mvvm_architecture/view/login_screen.dart';

class Routes {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('No route defined')),
                ));
    }
  }
}
