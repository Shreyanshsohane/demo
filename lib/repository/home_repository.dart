
import 'package:demo/data/network/BaseApiServices.dart';
import 'package:demo/data/network/NetworkApiService.dart';
import 'package:demo/model/movies_model.dart';
import 'package:demo/res/app_url.dart';

class HomeRepository {

  BaseApiServices _apiServices = NetworkApiService() ;

  Future<MovieListModel> fetchMoviesList()async{

    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrl.moviesListEndPoint);
      return response = MovieListModel.fromJson(response);

    }catch(e){
      throw e ;
    }
  }

}