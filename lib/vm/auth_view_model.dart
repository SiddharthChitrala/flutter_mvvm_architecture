import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/provider/auth_repository.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    _myRepo.loginApi(data).then((value) {

      print(value.toString());
       Utils.toastMessage('Authentication successful.');
    }).onError((error, stackTrace) {
      Utils.toastMessage(error.toString());
      print(error.toString());
    });
  }
}
