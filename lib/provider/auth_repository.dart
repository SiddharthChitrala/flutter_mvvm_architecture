import 'package:flutter_mvvm_architecture/data/network/base_api_services.dart';
import 'package:flutter_mvvm_architecture/data/network/network_api_services.dart';
import 'package:flutter_mvvm_architecture/res/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      // throw e;
      throw Exception(e);
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.registerurl, data);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
