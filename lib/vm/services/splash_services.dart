import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/models/user_model.dart';
import 'package:flutter_mvvm_architecture/vm/user_view_model.dart';
import '../../utils/routes/routes_name.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    // check if user is logged in
    // if user is logged in then navigate to home screen
    // else navigate to login screen
    // here you can use your authentication service to check if user is logged in
    getUserData().then((value) async{

      if (value.token == 'null' || value.token == '') {
        // navigate to login screen
        Future.delayed(const Duration(seconds: 10));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        // navigate to home screen
        Future.delayed(const Duration(seconds: 10));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }
}
