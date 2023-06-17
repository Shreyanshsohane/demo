

import 'package:demo/data/response/api_response.dart';
import 'package:demo/model/movies_model.dart';
import 'package:demo/repository/home_repository.dart';
import 'package:flutter/cupertino.dart';

class HomeViewViewModel with ChangeNotifier {

  final _homeRepo = HomeRepository();

  ApiResponse<MovieListModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieListModel> response){
    moviesList = response ;
    notifyListeners();
  }


  Future<void> fetchMoviesListApi ()async{

    setMoviesList(ApiResponse.loading());

    _homeRepo.fetchMoviesList().then((value){

      setMoviesList(ApiResponse.completed(value));

    }).onError((error, stackTrace){

      setMoviesList(ApiResponse.error(error.toString()));

    });
  }


}