import 'package:flutter/material.dart';
import 'package:flutter_mvvm_architecture/data/response/app_response.dart';
import 'package:flutter_mvvm_architecture/models/movie_list_model.dart';
import 'package:flutter_mvvm_architecture/provider/movie_list_repository.dart';

class MovieListViewModel with ChangeNotifier {
  final _myRepo = MovieListRepository();

  ApiResponse<MovieListModel> movieList = ApiResponse.loading();

  setMovieList(ApiResponse<MovieListModel> response) {
    movieList = response;
    notifyListeners();
  }

  Future<void> fetchMovieListApi() async {
    setMovieList(ApiResponse.loading());

    _myRepo.fetchMovieList().then((value) {
      print(value);
      setMovieList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieList(ApiResponse.error( error.toString()));
    });
  }
}
