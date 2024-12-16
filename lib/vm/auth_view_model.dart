import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/provider/auth_repository.dart';
import 'package:flutter_mvvm_architecture/utils/routes/routes_name.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(true);

      print(value.toString());
      Utils.toastMessage('Authentication successful.');
      Navigator.pushReplacementNamed( context , RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.toastMessage(error.toString());
      print(error.toString());
    });
  }
  
}
