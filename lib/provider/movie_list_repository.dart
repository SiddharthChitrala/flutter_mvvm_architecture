import 'package:flutter_mvvm_architecture/models/movie_list_model.dart';

import '../data/network/base_api_services.dart';
import '../data/network/network_api_services.dart';
import '../res/app_url.dart';

class MovieListRepository {
  
    final BaseApiServices _apiServices = NetworkApiServices();

  Future<MovieListModel> fetchMovieList( ) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.movieListUrl);
      return response = MovieListModel.fromJson(response);
    } catch (e) {
      // throw e;
      throw Exception(e);
    }
  }
}